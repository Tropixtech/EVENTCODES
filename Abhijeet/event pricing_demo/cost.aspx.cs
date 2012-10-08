using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class cost : System.Web.UI.Page
{
    BAL ob = new BAL();
    private SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=E:\event pricing_demo\App_Data\pricing.mdf;Integrated Security=True;User Instance=True");
    string gvUniqueID = String.Empty;
    int gvNewPageIndex = 0;
    int gvEditIndex = -1;
    string gvSortExpr = String.Empty;
    int countrow = 1;
    private string gvSortDir
    {

        get { return ViewState["SortDirection"] as string ?? "ASC"; }

        set { ViewState["SortDirection"] = value; }

    }

    private string GetSortDirection()
    {
        switch (gvSortDir)
        {
            case "ASC":
                gvSortDir = "DESC";
                break;

            case "DESC":
                gvSortDir = "ASC";
                break;
        }
        return gvSortDir;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //ViewState["eventid"] = Session["eventid"];
            //ViewState["orgid"] = Session["orgid"];
            //ViewState["userid"] = Session["userid"];

            ViewState["eventid"] = 1;
            ViewState["orgid"] =2;
            ViewState["userid"] = 3;
             showgrid();
        }
       


    }
    public int id;
    public int autoid()
    {
        ob.manipulate("sp_p_fetchptid", "");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            id = 4000;
            return id;
        }
        else
        {
            id = Convert.ToInt32(ob.ds.Tables[0].Rows[ob.ds.Tables[0].Rows.Count - 1].ItemArray[0].ToString()) + 1;
            return id;
        }
    }
    public void showgrid()
    {

        con.Open();
       
        //ob.manipulate("delete from pricetype where pt_name is null or pt_from_date is null", "");
        ob.manipulate("sp_del_price_null", "");
        //ob.manipulate("DELETE FROM pricetype WHERE NOT EXISTS( select * from registrationcost where pricetype.pt_id = registrationcost.pt_id )", "");
        ob.manipulate("sp_del_pri_cos_ptyp", "");
        
      
        //SqlCommand cmd = new SqlCommand("select * from pricetype where pt_org_id='" + ViewState["orgid"].ToString() + "' and pt_ev_id='" + ViewState["eventid"].ToString() + "' ", con);
        // SqlDataAdapter da = new SqlDataAdapter(cmd);
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //con.Close();

        ob.manipulate("sp_fetch_prtype", "'" + int.Parse(ViewState["orgid"].ToString()) + "','" + int.Parse(ViewState["eventid"].ToString()) + "'");
        
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ob.ds;
            GridView1.DataBind();
        }
        else
        {
            GridView1.TemplateControl.Visible = true;
            ob.ds.Tables[0].Rows.Add(ob.ds.Tables[0].NewRow());
            GridView1.DataSource = ob.ds;
            GridView1.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView1.Rows[0].Cells[0].Text = "";
        }
        
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
       
            GridView1.EditIndex = -1;
            showgrid();
        
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Edit"))
        {
            int strpt_id = Convert.ToInt16(e.CommandArgument.ToString());

           
            Session["edit_ptid"] = strpt_id;
            Session["command"] = "EditSession";
             Session["eventid"]=ViewState["eventid"];
             Session["orgid"]=ViewState["orgid"];
            Session["userid"]= ViewState["userid"];
            Response.Redirect("regprice.aspx");
            
            //Session["id"] = id;
          
            //Session["sessionId"] = id;
            //Response.Redirect("SessionDetails.aspx");
        }





  //      var createdTime = DateTime.Now.ToString("dd-MM-YYYY HH:mm:ss");
  //int a=autoid();
  //     // int a = 5;

  //      if (e.CommandName.Equals("AddNew"))
  //      {
  //          TextBox txtptype = (TextBox)GridView1.FooterRow.FindControl("txtptypeadd");
  //          TextBox txtfromd = (TextBox)GridView1.FooterRow.FindControl("txtaddfrom");
  //          TextBox txttod = (TextBox)GridView1.FooterRow.FindControl("txtaddto");
  //          //ob.manipulate("insert into pricetype values(" + a + ",'" + ViewState["eventid"].ToString() + "','" + ViewState["orgid"].ToString() + "','" + txtptype.Text + "','" + Convert.ToDateTime(txtfromd.Text) + "',,'" + Convert.ToDateTime(txttod.Text) + "','" + createdTime + "','" + ViewState["userid"].ToString() + "',NULL,NULL)", "");
  //          con.Open();
  //          SqlCommand cmd = new SqlCommand("insert into pricetype values('" + a + "','" + ViewState["eventid"].ToString() + "','" + ViewState["orgid"].ToString() + "','" + txtptype.Text + "','" + Convert.ToDateTime(txtfromd.Text) + "','" + Convert.ToDateTime(txttod.Text) + "','" + createdTime + "','" + ViewState["userid"].ToString() + "',NULL,NULL)", con);
  //          SqlDataAdapter da = new SqlDataAdapter(cmd);
  //          DataSet ds = new DataSet();
  //          da.Fill(ds);
  //          con.Close();
  //        //ob.manipulate("insert into pricetype values(" + a + ",'" + ViewState["eventid"].ToString() + "','" + ViewState["orgid"].ToString() + "','" + txtptype.Text + "','" + Convert.ToDateTime(txtfromd.Text) + "','" + Convert.ToDateTime(txttod.Text) + "','" + createdTime + "','" + ViewState["userid"].ToString() + "',NULL,NULL)", "");
  //          showgrid();


  //      }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == -1)
        {
            ImageButton btnEdit = (ImageButton)e.Row.FindControl("imgbtnedit");
            ImageButton btnDelete = (ImageButton)e.Row.FindControl("imgbtndelete");

            btnEdit.Visible = true;
            btnDelete.Visible = true;
        }
        GridViewRow row = e.Row;
        string strSort = string.Empty;
      //  string strSort = string.Empty;

        // Make sure we aren't in header/footer rows
        if (row.DataItem == null)
        {
            return;
        }
        GridView gv = new GridView();
        gv = (GridView)row.FindControl("GridView2");
        if (gv.UniqueID == gvUniqueID)
        {
            gv.PageIndex = gvNewPageIndex;
            gv.EditIndex = gvEditIndex;
            //Check if Sorting used
            if (gvSortExpr != string.Empty)
            {
                GetSortDirection();
                strSort = " ORDER BY " + string.Format("{0} {1}", gvSortExpr, gvSortDir);
            }
            //Expand the Child grid
            ClientScript.RegisterStartupScript(GetType(), "Expand", "<SCRIPT LANGUAGE='javascript'>expandcollapse('div" + ((DataRowView)e.Row.DataItem)["pt_id"].ToString() + "','one');</script>");
        }
        gv.DataSource = ChildDataSource(((DataRowView)e.Row.DataItem)["pt_id"].ToString());
        
      
        gv.DataBind();

    }
    private DataSet ChildDataSource(string strCustometId)
    {
        
        //string strQRY = "";
        //SqlDataSource dsTemp = new SqlDataSource();
        //dsTemp.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=E:\event pricing_demo\App_Data\pricing.mdf;Integrated Security=True;User Instance=True";


        //strQRY = "SELECT registrationcost.pt_id,registrationcost.rc_id,participanttype.pp_id,participanttype.pp_name, registrationcost.rc_individual, registrationcost.rc_group, registrationcost.rc_guest FROM participanttype INNER JOIN registrationcost ON participanttype.pp_id = registrationcost.rc_pp_id  WHERE [registrationcost].[pt_id] = '" + strCustometId + "'";


        //dsTemp.SelectCommand = strQRY;
        //return dsTemp;

        ob.manipulate("sp_fetch_child", "'" + strCustometId + "'");
        return ob.ds;

    }





    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strSQL = "";
        //Get the value        
        string strpt_id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblptid")).Text;
        ob.manipulate("sp_p_fetch_rcppid","'" + int.Parse(strpt_id) + "'");
       
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
          
         string ppid = ob.ds.Tables[0].Rows[0].ItemArray[0].ToString();

         ob.manipulate("sp_p_del_price", "'" + int.Parse(strpt_id) + "'");

         ob.manipulate("sp_p_del_parti", "'" + int.Parse(strpt_id) + "'");
         ob.manipulate("sp_p_del_regcos", "'" + int.Parse(strpt_id) + "'");
           
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Price Type deleted successfully');</script>");
            showgrid();
        }
        
        else
        {
            ob.manipulate("sp_p_del_price", "'" + int.Parse(strpt_id) + "'");
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Price Type deleted successfully');</script>");
            showgrid();
        }
    }
      
    
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //GridView1.EditIndex = e.NewEditIndex;
        //showgrid();
        
        //string strpt_id = ((Label)GridView1.r.FindControl("lblptid")).Text;
        //string strpt_id = GridView1.DataKeys[0].Value.ToString();
        //Session["edit_ptid"] = strpt_id;
        //Response.Redirect("regprice.aspx");
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string strpricetype = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtptypeedit")).Text;
        string strfromdate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txteditfrom")).Text;
        string strtodate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txteditto")).Text;

        string strpt_id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblptid")).Text;
        string frmdt = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss tt");
        
            //Prepare the Update Command of the DataSource control
           
            ob.manipulate("sp_p_update_price", "'" + strpricetype + "','" + strfromdate + "','" + strtodate + "','" + frmdt + "','" + int.Parse(ViewState["userid"].ToString()) + "','" + int.Parse(strpt_id) + "'");
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Price Type updated successfully');</script>");
            GridView1.EditIndex = -1;
            showgrid();
        
    }
    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        showgrid();
    }

     public int id1;
    public int autoid1()
    {
        ob.manipulate("sp_p_fetch_ppid", "");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            id1 = 100;
            return id1;
        }
        else
        {
            id1 = Convert.ToInt32(ob.ds.Tables[0].Rows[ob.ds.Tables[0].Rows.Count - 1].ItemArray[0].ToString()) + 1;
            return id1;
        }
    }

    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        int b = autoid1();
        if (e.CommandName.Equals("AddNew"))
        {

            GridView gvTemp = (GridView)sender;
            string strpt_id = gvTemp.DataKeys[0].Value.ToString();
            TextBox strpname = (TextBox)gvTemp.FooterRow.FindControl("ftrtxtindvl");
            //string strpname = tbstrpname.Text;
            TextBox strindi = (TextBox)gvTemp.FooterRow.FindControl("ftrtxtindvl");
            TextBox strgrp = (TextBox)gvTemp.FooterRow.FindControl("ftrtxtgrp");
            TextBox strguest = (TextBox)gvTemp.FooterRow.FindControl("ftrtxtguest");
            string frmdt = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss tt");
            DropDownList ddl = (DropDownList)gvTemp.FooterRow.FindControl("ddlpname");

             if (strindi.Text == "")
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Individual Price cannot be blank');</script>");
                showgrid();
                strindi.Focus();
            }
            if (strgrp.Text == "")
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Group Price cannot be blank');</script>");
                showgrid();
                strgrp.Focus();
            }
            if (strguest.Text == "")
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Guest Price cannot be blank');</script>");
                showgrid();
                strguest.Focus();
            }
            else
            {

                if (ddl.Items.Count == 0)
                {
                    ob.manipulate("sp_p_fetch_ppname", "'" + int.Parse(strpt_id) + "','" + strpname.Text + "'");
                    if (ob.ds.Tables[0].Rows.Count > 0)
                    {

                        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type Already Exist For This Price Type');</script>");

                    }

                    else
                    {
                        ob.manipulate("sp_p_insert_parti", "" + b + ",'" + int.Parse(ViewState["ptid"].ToString()) + "','" + int.Parse(ViewState["eventid"].ToString().Trim()) + "','" + int.Parse(ViewState["orgid"].ToString().Trim()) + "','" + strpname.Text + "','" + frmdt + "','" + int.Parse(ViewState["userid"].ToString().Trim()) + "'");

                        ob.manipulate("sp_p_insert_regcost", "'" + int.Parse(ViewState["ptid"].ToString()) + "'," + b + ",'" + int.Parse(ViewState["eventid"].ToString().Trim()) + "','" + int.Parse(ViewState["orgid"].ToString().Trim()) + "','" + float.Parse(strindi.Text) + "','" + float.Parse(strgrp.Text) + "','" + float.Parse(strguest.Text) + "'");
                    
                        showgrid();

                        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type and Registration Cost added successfully');</script>");

                    }




                }
                else
                {
                    ob.manipulate("sp_p_fetch_ppname", "'" + int.Parse(strpt_id) + "','" + ddl.SelectedValue + "'");
                    if (ob.ds.Tables[0].Rows.Count > 0)
                    {

                        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type Already Exist For This Price Type');</script>");
                        showgrid();

                    }

                    else
                    {
                        ob.manipulate("sp_p_insert_parti", "'" + b + "','" + int.Parse(ViewState["ptid"].ToString()) + "','" + int.Parse(ViewState["eventid"].ToString()) + "','" + int.Parse(ViewState["orgid"].ToString()) + "','" + ddl.SelectedValue + "','" + frmdt + "','" + int.Parse(ViewState["userid"].ToString()) + "'");

                        ob.manipulate("sp_p_insert_regcost", "'" + int.Parse(ViewState["ptid"].ToString()) + "','" + b + "','" + int.Parse(ViewState["eventid"].ToString().Trim()) + "','" + int.Parse(ViewState["orgid"].ToString().Trim()) + "','" + float.Parse(strindi.Text) + "','" + float.Parse(strgrp.Text) + "','" + float.Parse(strguest.Text) + "'");
                    

                        showgrid();

                        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type and Registration Cost added successfully');</script>");

                    }

                }



            }
        }
    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (((DataRowView)e.Row.DataItem)["pp_id"].ToString() == String.Empty) e.Row.Visible = false;
        }
        ob.manipulate("sp_p_fetch_ptid", "");
        int ptid = int.Parse(ob.ds.Tables[0].Rows[0]["pt_id"].ToString());
        
        if (ob.ds.Tables[0].Rows.Count > 1 )
        {
            if (e.Row.RowType == DataControlRowType.Footer && GridView1.EditIndex == -1)
            {
                int cnt = 0;
                string arr = "";

                TextBox txt = (TextBox)e.Row.FindControl("ftrtxtpname");
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlpname");


                
                ob.manipulate("sp_p_fetch_distinct_ppname", "'" + int.Parse(ViewState["eventid"].ToString()) + "','" + int.Parse(ViewState["orgid"].ToString()) + "'");
                if (ob.ds.Tables[0].Rows.Count > 0)
                {
                    //ob.manipulate("select pt_id from pricetype", "");
                    //if (ptid == int.Parse(ob.ds.Tables[0].Rows[0]["pt_id"].ToString()))
                    //{
                    //    txt.Visible = true;
                    //    ddl.Visible = false;
                    //}
                    //else
                    //{
                        txt.Visible = false;
                        ddl.Visible = true;
                        while (cnt < ob.ds.Tables[0].Rows.Count)
                        {
                            arr = ob.ds.Tables[0].Rows[cnt]["pp_name"].ToString();
                            cnt++;
                            ddl.Items.Add(new ListItem(arr));

                        }
                    //}

                }
                else
                {
                    ddl.Visible = false;
                }

            }
        }
        else
        {
            if (e.Row.RowType == DataControlRowType.Footer && GridView1.EditIndex == -1)
            {
                TextBox txt = (TextBox)e.Row.FindControl("ftrtxtpname");
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlpname");

                txt.Visible = true;
                ddl.Visible = false;
            }
        }

    }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        string strparid = ((Label)gvTemp.Rows[e.RowIndex].FindControl("lblppid")).Text;

        SqlCommand cmd = new SqlCommand("delete from participanttype where pp_id=@ppid", con);
        cmd.CommandType = CommandType.Text;

        cmd.Parameters.AddWithValue("@ppid", int.Parse(strparid));


        SqlCommand cmd2 = new SqlCommand("delete from registrationcost where rc_pp_id=@pprcid", con);
        cmd2.CommandType = CommandType.Text;

        cmd2.Parameters.AddWithValue("@pprcid", int.Parse(strparid));


        con.Open();
        cmd.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();

        con.Close();

        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type and Registration Cost deleted successfully');</script>");
        GridView1.DataBind();
        showgrid();
    }
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        gvUniqueID = gvTemp.UniqueID;
        gvEditIndex = e.NewEditIndex;

        GridView1.DataBind();
        showgrid();
    }
    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        string strparid = ((Label)gvTemp.Rows[e.RowIndex].FindControl("lblppid")).Text;
        string strpname = ((TextBox)gvTemp.Rows[e.RowIndex].FindControl("txtpname1")).Text;
        string strindi = ((TextBox)gvTemp.Rows[e.RowIndex].FindControl("txtindvl1")).Text;
        string strgrp = ((TextBox)gvTemp.Rows[e.RowIndex].FindControl("txtgrp1")).Text;
        string strguest = ((TextBox)gvTemp.Rows[e.RowIndex].FindControl("txtguest1")).Text;
        string frmdt = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss tt");


        ob.manipulate("sp_p_update_parti", "'" + strpname + "','" + frmdt + "','" + int.Parse(ViewState["userid"].ToString()) + "','" + int.Parse(strparid) + "'");

        ob.manipulate("sp_p_update_regcost", "'" + float.Parse(strindi) + "','" + float.Parse(strgrp) + "','" + float.Parse(strguest) + "','" + int.Parse(strparid) + "'");   
        
        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type and Registration Cost updated successfully');</script>");

        //Reset Edit Index
        gvTemp.EditIndex = -1;


        showgrid();
    }

    protected void GridView1_RowCancelingEdit1(object sender, GridViewEditEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        gvUniqueID = gvTemp.UniqueID;
        gvEditIndex = -1;
        GridView1.DataBind();
        //showgrid();
    }
    public int autoid2()
    {
        ob.manipulate("sp_p_fetch_ptid", "");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            id = 4000;
            return id;
        }
        else
        {
            id = Convert.ToInt32(ob.ds.Tables[0].Rows[ob.ds.Tables[0].Rows.Count - 1].ItemArray[0].ToString()) + 1;
            return id;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int b = autoid2();

        //ob.manipulate("insert into pricetype(pt_id) values("+b+") ", "");

        ob.manipulate("insert into pricetype(pt_id,pt_ev_id,pt_org_id) values(" + b + ",'" + int.Parse(ViewState["eventid"].ToString()) + "','" + int.Parse(ViewState["orgid"].ToString()) + "') ", "");
        Session["ptid"] = Convert.ToString(b);
        Session["eventid"] = ViewState["eventid"];
        Session["orgid"] = ViewState["orgid"];
        Session["userid"] = ViewState["userid"];Session["command"] = null;
        Response.Redirect("regprice.aspx");
        
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {

    }
}