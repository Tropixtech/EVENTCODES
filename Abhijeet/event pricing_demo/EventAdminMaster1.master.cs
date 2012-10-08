using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EventAdminMaster1 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    if (Session["ud_id"] == null)
        //    {
        //        Response.Redirect("Register.aspx");
        //    }
        //    else
        //    {
        //        Label1.Text = Session["ud_id"].ToString();
        //    }
        //}
        //Response.Buffer = true;
        //Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
        //Response.Expires = -1500;
        //Response.CacheControl = "no-cache";
    }
    //protected void LinkButton1_Click(object sender, EventArgs e)
    //{
    //    Session.Clear();
    //    Session.Abandon();
    //    Session["email"] = null;
    //    Response.Redirect(@"~/Register.aspx");
    //}
    protected void lbBesicDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("Eventdetail.aspx");
    }
    protected void lbSession_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sessions.aspx");
    }
    protected void lbSchedule_Click(object sender, EventArgs e)
    {
        Response.Redirect(@"~/Schedule.aspx");
    }
    protected void lbRegParam_Click(object sender, EventArgs e)
    {
        Response.Redirect("reg_pm.aspx");
    }
    protected void lbAccomodation_Click(object sender, EventArgs e)
    {
        //Response.Redirect("forgot.aspx");
    }
    protected void lbTours_Click(object sender, EventArgs e)
    {
        //Response.Redirect("forgot.aspx");
    }
    protected void lbExhibition_Click(object sender, EventArgs e)
    {
        //Response.Redirect("forgot.aspx");
    }
    protected void lbUserAllocation_Click(object sender, EventArgs e)
    {
        //Response.Redirect("forgot.aspx");
    }
    protected void lbCost_Click(object sender, EventArgs e)
    {
        //Response.Redirect("forgot.aspx");
    }
   
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Clear();
        Session.Abandon();
        Session["email"] = null;
        Response.Redirect(@"~/Register.aspx");
    }
    protected void lbtnHome_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect(@"~/Welcome.aspx");
    }
}
