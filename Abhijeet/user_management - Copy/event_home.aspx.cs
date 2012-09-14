using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class event_home : System.Web.UI.Page
{
    Class1 ob = new Class1();
    Class2 ob1;
    protected void Page_Load(object sender, EventArgs e)
    {
        ob1 = new Class2();
        ob.conn();
    }
    public int a = 11;
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ob1.read("ud_fetch_status_admin","'"+Session["email"]+"'");
        if (ob1.ds.Tables[0].Rows.Count > 0)
        {
            if (a == Convert.ToInt32(ob1.ds.Tables[0].Rows[0]["ud_status"].ToString()))
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