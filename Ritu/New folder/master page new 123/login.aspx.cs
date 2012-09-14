using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    Class1 ob = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //int id = int.Parse(Session["userid"].ToString());
        }

        ob.conn();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        

       ob.fetch("select *  from user_details where ud_email_id='"+txtEmailid.Text+"' and ud_password='"+txtPassword.Text+"'");
        ob.da.Fill(ob.ds);


        if (ob.ds.Tables[0].Rows.Count != 0)
        {
            
            //int id = int.Parse(ob.ds.Tables[0].Rows[0]["ud_id"].ToString());
            Session["email"] = txtEmailid.Text;
            //Session["userid"] = id.ToString();
            Response.Redirect("Newregister.aspx");

        }
        else
        {
            lblWrongpassword.Text = "Wrong Password";
       //Session["email"] = TextBox1.Text;
       // Response.Redirect("Welcome.aspx");
        }
    
        

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
       ob.fetch("select *  from user_details where ud_email_id='"+txtEmailid.Text+"'");
       ob.da.Fill(ob.ds);

       if (ob.ds.Tables[0].Rows.Count != 0)
       {
           //string pwd =int.parse( ob.ds.Tables[0].Rows[0]["ud_password"].ToString());


           lblValidationmsg.Text = "New Password sent to your Email Id";
       }
      else if(ob.ds.Tables[0].Rows.Count == 0)
       {
           lblValidationmsg.Text = "Not a valid User ";
           lblValidationmssg.Text = " Enter a valid Email Id";
       }
     else
        {
            lblValidationmsg.Text = "Enter your Email Id";
        }
    }
}