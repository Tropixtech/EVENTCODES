using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Organisation_details1 : System.Web.UI.Page
{
    Class1 ob = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        ob.conn();

        Label1.Visible = false;
        Label2.Visible = false;
        Label3.Visible = false;
        Label4.Visible = false;
        Label5.Visible = false;
        Label6.Visible = false;
        Label7.Visible = false;
        Label8.Visible = false;
        Label9.Visible = false;
        Label10.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label8.Text = "";

        if (TextBox1.Text == "")
        {
            Label1.Visible = true;
            Label1.Text = "*Please enter your organization name";
            Label8.Text = Label1.Text;
        }
        if (DropDownList1.SelectedIndex == 0)
        {
            Label9.Visible = true;
            Label9.Text = "*Please Select organization type";
            Label8.Text = Label9.Text;
        }
        if (DropDownList2.SelectedIndex == 0)
        {
            Label10.Visible = true;
            Label10.Text = "*Please select Industry type";
            Label8.Text = Label10.Text;
        }

        if (TextBox7.Text == "")
        {
            Label7.Visible = true;
            Label7.Text = "*Please select city name";
            Label8.Text = Label7.Text;
        }
        if (TextBox2.Text == "")
        {
            Label2.Visible = true;
            Label2.Text = "*Please enter your address";
            Label8.Text = Label2.Text;
        }
        if (TextBox2.Text == "" && TextBox3.Text.Length > 0)
        {
            Label3.Visible = true;
            Label3.Text = "*enter this in Line1";
            Label8.Text = Label3.Text;
            Label2.Text = "";
        }
        if (TextBox4.Text == "")
        {
            Label4.Visible = true;
            Label4.Text = "*Please enter your zip code";
            Label8.Text = Label4.Text;
        }
        if (TextBox5.Text == "")
        {
            Label5.Visible = true;
            Label5.Text = "*Please enter your phone no";
            Label8.Text = Label5.Text;
        }


        if (Label8.Text.Length == 0)//&& RadTextBox1.Text.Length > 0 && RadTextBox2.Text.Length > 0 && RadTextBox7.Text.Length > 0)
        {
            string tym_dt = "";
            tym_dt = DateTime.Now.ToShortDateString().ToString();
            tym_dt += ' ' + DateTime.Now.ToShortTimeString().ToString();

            //data entry to database
            ob.dml_qry("insert into organisation_details values ('" + TextBox1.Text + "','" + DropDownList1.Text + "','" + DropDownList2.Text + "','" + "" + "','" + "" + "','" + TextBox7.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + tym_dt + "','" + tym_dt + "')");

            Response.Redirect("Default2.aspx");

        }




    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
    }

}