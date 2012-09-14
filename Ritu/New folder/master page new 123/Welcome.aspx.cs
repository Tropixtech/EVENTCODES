using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome : System.Web.UI.Page
{
    Class1 ob = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        ob.conn();
        Panel3.Visible = false;
        //if (!IsPostBack)
        //{
        //    int id = int.Parse(Session["userid"].ToString());
        //}

        

        if (!IsPostBack)
        {


            if (Session["email"] != null)
            {
                Panel3.Visible = false;
                lblEmailid.Text = Convert.ToString(Session["email"]);
                //Response.Redirect("Welcome.aspx");
            }


            else
            {
                //Response.Redirect("Register.aspx");
            }
        }

        Response.Buffer = true;
        Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
        Response.Expires = -1500;
        Response.CacheControl = "no-cache";
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        
        Panel3.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session["email"] = null;
        Response.Redirect("login.aspx");

    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        ob.dml_statement("update user_details set ud_password='" + txtNewPass.Text + "' where ud_email_id='"+Session["email"]+"'");
        Response.Write("<script>alert('Password updated')</script>");
    }

        public int a = 11;
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ob.fetch("select ud_org_id from user_details where ud_email_id='"+Session["email"]+"'");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script>alert('First fill up the organisational details form ')</script>");
        }
        else
        {
            Response.Redirect("userdetail.aspx");
        }
     
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


    protected void lbtnEvent_Click(object sender, EventArgs e)
    {
        ob.fetch("select ud_org_id from user_details where ud_email_id='" + Session["email"] + "'");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script>alert('First fill up the organisational details form ')</script>");
        }
        else
        {
            Response.Redirect("#");
        }
    }
}