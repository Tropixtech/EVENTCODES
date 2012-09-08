using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
    Class1 ob = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {

        ob.conn();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
         ob.fetch("select ud_password from user_details where ud_email_id='"+txtemail.Text+"'");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            if (txtpass.Text == ob.ds.Tables[0].Rows[0].ItemArray[0].ToString())
            {
                Session["email"] = txtemail.Text;
                Response.Redirect("event_home.aspx");
            }
            else
            {
                lblmsg.Text = "Password Not Match";
            }
        }
        else
        {
            lblmsg.Text = "Email Id Not Present";
        }
    }
    }
