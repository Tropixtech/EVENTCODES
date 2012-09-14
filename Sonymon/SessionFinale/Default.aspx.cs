using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    DbHelper db = new DbHelper();
    protected static int orgId=51;
    protected static int eventId=61;
    protected static int userId=71;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSession();
            Session["command"] = null;

            //to be modified at the time of integration
            orgId = 51;
            eventId = 61;
            userId = 71;
            //
        }   
    }

    protected int generateSessionId()
    {
        int id ;

        db.Connect();
        //db.Fetch("Select max(ss_id) as exp from session where ss_org_id = "+orgId+" and ss_ev_id = "+eventId);
        db.Read("SS_GetMaxSSId", "'"+ orgId +"','"+ eventId +"'");

        if (db.ds.Tables[0].Rows.Count > 0)
            id = Convert.ToInt16(db.ds.Tables[0].Rows[0]["exp"]);
        else
            id = 0;
        return (id + 1);
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
        db.Connect();
        //db.Fetch("Select * from session where ss_org_id = "+orgId+" and ss_ev_id = "+eventId);
        db.Read("SS_GetSessionInfo","'" + orgId + "','" + eventId + "'");

        if (db.ds.Tables[0].Rows.Count > 0)
        {
            gvSession.DataSource = db.ds;
            gvSession.DataBind();
        }
        else
        {
            gvSession.TemplateControl.Visible = true;
            db.ds.Tables[0].Rows.Add(db.ds.Tables[0].NewRow());
            gvSession.DataSource = db.ds;
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

        db.Connect();
       //db.Fetch("delete from session where ss_id=" + id);
        db.Read("SS_DeleteRecordById", "'" + id + "','" + orgId + "','" + eventId + "'");       
        
        db.Connect();
       //db.Fetch("delete from presenter where pr_ss_id=" + id);
        db.Read("PR_DeleteRecordBySSId", "'" + id + "','" + orgId + "','" + eventId + "'");
       
        db.Connect();
       //db.Fetch("delete from additionalreq where ar_ss_id=" + id);
        db.Read("AR_DeleteRecordBySSId", "'" + id + "','" + orgId + "','" + eventId + "'");
        
        BindSession();
    }


    protected void gvSession_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Edit"))
        {
            int id = Convert.ToInt16(e.CommandArgument.ToString());
            var modifiedTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            Session["id"] = id;
            Session["command"] = "EditSession";
            Session["sessionId"] = id;
            Response.Redirect("AddNewSession.aspx");
        }
    }

    protected void btnAddSession_Click(object sender, EventArgs e)
    {
        Session["sessionId"] = generateSessionId();
        Response.Redirect("AddNewSession.aspx");
    }

    protected void gvSession_RowEditing(object sender, GridViewEditEventArgs e)
    {
    }

    protected void gvSession_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //getting username from particular row
            string title = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ss_title"));
            //identifying the control in gridview
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtnDelete");
            //raising javascript confirmationbox whenver user clicks on link button
            if (lnkbtnresult != null)
            {
                lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + title + "')");
            }
        }
    }
}
