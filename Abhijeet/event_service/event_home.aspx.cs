using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class event_home : System.Web.UI.Page
{
    Class1 ob = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        ob.conn();
    }
    public int a = 11;
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ob.fetch("select ud_status from user_details where ud_email_id='" + Session["email"] + "'");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            if (a == Convert.ToInt32(ob.ds.Tables[0].Rows[0]["ud_status"].ToString()))
            {
                Response.Redirect("userdetail.aspx");
            }
            else
            {
                Response.Redirect("error.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_login.aspx");
    }
}