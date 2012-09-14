using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Newregister : System.Web.UI.Page
{
    Class1 ob = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        ob.conn();
        //if(!IsPostBack)
            //Label9.Text = Session["ab"].ToString();

        Label1.Visible = false;
       
    }
    static int id;


    public int Autoid()
    {
        ob.fetch("select ud_id from user_details order by ud_id");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            id = 500;
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
        Label1.Visible = true;

        if (txtFname.Text == "")
        {
            Label1.Text = "Please enter your first name";
            txtFname.Focus();
           
            

        }
        else if (txtLname.Text == "")
        {
            Label1.Text="Please enter your last name";
            txtLname.Focus();
        }

        else if (txtNewpass.Text == "")
        {
            Label1.Text = "Please enter your password";
            txtNewpass.Focus();
        }
        else if (txtConpass.Text == "")
        {
            Label1.Text = "Please re-enter your password";
            txtConpass.Focus();
        }
            
        else if (txtConpass.Text != txtNewpass.Text)
        {
            Label1.Text = "Confirm password must match with password";
            txtConpass.Focus();
        }  


        else
        {


            // CONNECTION
            int b = 11;
            int a = Autoid();


            //ob.cm = new System.Data.SqlClient.SqlCommand("", ob.cn);
            ob.dml_statement("update user_details set ud_id='" + Convert.ToInt32(b) + "' ,ud_fname='" + txtFname.Text + "',ud_mname='" + txtMname.Text + "',ud_lname='" + txtLname.Text + "',ud_password='" + txtNewpass.Text + "' where ud_email_id='" + Session["email"] + "' ");
            //ob.cn.Open();
            ob.cm.ExecuteNonQuery();
            ob.cn.Close();






            //ob.fetch ("Select ud_id from user_details where ud_email_id='"+Session ["email"]+"'");
            //int c= Convert.ToInt32(ob.ds.Tables[0].Rows[0]["ud_id"].ToString());
            ////session userid= int c;
            Response.Redirect("Welcome.aspx");
        }
    } 
     
    public void Clear()
    {

        txtFname.Text = "";
        txtMname.Text = "";
        txtLname.Text = "";
        txtNewpass.Text = "";
        txtConpass.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Clear();
    }
   
}