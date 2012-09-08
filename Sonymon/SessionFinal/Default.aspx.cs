﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    static string constr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\EventManagementSystem\\SessionInAsp\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True";
    private SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSession();
            Session["command"] = null;
        }
        
    }

    protected string PaperSubmissionStatus(int flag)
    {
        if (flag == 1)
            return "Yes";
        else
            return "No";
    }

    protected void BindSession()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from session", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            gvSession.DataSource = ds;
            gvSession.DataBind();
        }
        else
        {
            gvSession.TemplateControl.Visible = true;
            //gvPresenter.Columns[2].Visible = false;
            //gvPresenter.ShowFooter = true;
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            gvSession.DataSource = ds;
            gvSession.DataBind();
            int columncount = gvSession.Rows[0].Cells.Count;
            gvSession.Rows[0].Cells.Clear();
            gvSession.Rows[0].Cells.Add(new TableCell());
            gvSession.Rows[0].Cells[0].ColumnSpan = columncount;
            gvSession.Rows[0].Cells[0].Text = "No Session Available";
        }

    }


   
    protected void gvSession_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        int id = Convert.ToInt32(gvSession.DataKeys[e.RowIndex].Values["ss_id"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from session where ss_id=" + id, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            BindSession();
            //lblresult.ForeColor = Color.Red;
            //lblresult.Text = id + " details deleted successfully";
        }
    }
    protected void gvSession_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      
        if (e.CommandName.Equals("Edit"))
        {
            int id = Convert.ToInt16(e.CommandArgument.ToString());

            var modifiedTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
           // con.Open();
          //  SqlCommand cmd = new SqlCommand("update session set ss_modified='" + modifiedTime + "' where ss_id=" + id, con);
            Session["test"] = "EDITED";
            Session["id"] = id;
            Session["command"] = "EditSession";
          //  cmd.ExecuteNonQuery();
          //  con.Close();
            Response.Redirect("AddNewSession.aspx");
        }

    }

    protected void btnAddSession_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddNewSession.aspx");
    }
    protected void gvSession_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //gvSession.EditIndex = e.NewEditIndex;
        //BindSession();
    }
}