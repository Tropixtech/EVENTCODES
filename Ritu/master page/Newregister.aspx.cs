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
          
         
        Label8.Visible = false;
    }
    static int id;


    public int Autoid()
    {
        ob.fetch("select ud_id from user_details order by ud_id");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            id = 100;
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
        // CONNECTION
        int b = 11;
        int a = Autoid();
        ob.cm = new System.Data.SqlClient.SqlCommand("insert into user_details (ud_id,ud_fname,ud_mname,ud_lname, ud_email_id,ud_password,ud_created_date,ud_status,ud_deactive_date,ud_lpwd) values('" + a + "','" + TextBox1.Text + "' , '" + TextBox2.Text + "' , '" + TextBox3.Text + "', '" + TextBox4.Text + "','" + TextBox5.Text + "','','"+Convert.ToInt32(b)+"','','')", ob.cn);
        ob.cn.Open();
        ob.cm.ExecuteNonQuery();
        ob.cn.Close();

        Label8.Text = "Successfully inserted...!";
        Label8.Visible = true;


        Clear();
        //TextBox1.Text = "";
        //TextBox2.Text = "";
        //TextBox3.Text = "";
        //TextBox4.Text = "";
        //TextBox5.Text = "";
        Session["userid"] = a.ToString();
        Response.Redirect("login.aspx");
    }

    public void Clear()
    {

        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
    }
}