using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class organisationdetails : System.Web.UI.Page
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
        Label11.Visible = false;
        Label12.Visible = false;
        Label13.Visible = false;
               
       
    }
     protected void Button1_Click(object sender, EventArgs e)
    {

        Label8.Text = "";

        if (txtOrgname.Text == "")
        {
            Label1.Visible = true;
            Label1.Text = "*Please enter your organization name";
            Label8.Text = Label1.Text;
        }
        if (ddOrgtype.SelectedIndex == 0)
        {
            Label9.Visible = true;
            Label9.Text = "*Please Select organization type";
            Label8.Text = Label9.Text;
        }
        if (ddIndustry.SelectedIndex == 0)
        {
            Label10.Visible = true;
            Label10.Text = "*Please select Industry type";
            Label8.Text = Label10.Text;

        }
        else
        {

            ob.fetch("select od_industry from organisation_details where od_name='" + txtOrgname.Text + "'");
            if (ob.ds.Tables[0].Rows.Count > 0 && ddIndustry.Text == ob.ds.Tables[0].Rows[0]["od_industry"].ToString())
            {
                Label13.Visible = true;
                Label13.Text = "*Organisation name & Industry exist";
                Label8.Text = Label13.Text;


            }
        }

         //asfdsadfsdfsdfsdfsfsdff
        //if (ddCountry.SelectedIndex == 0)
        //{
        //    Label11.Visible = true;
        //    Label11.Text = "*Please select Country";
        //    Label8.Text = Label11.Text;
        //}
        //if (ddState.SelectedIndex == 0)
        //{
        //    Label12.Visible = true;
        //    Label12.Text = "*Please select State";
        //    Label8.Text = Label12.Text;
        //}

        if (txtCity.Text == "")
        {
            Label7.Visible = true;
            Label7.Text = "*Please select city name";
            Label8.Text = Label7.Text;
        }
        if (txtAddress1.Text == "")
        {
            Label2.Visible = true;
            Label2.Text = "*Please enter your address";
            Label8.Text = Label2.Text;
        }
        if (txtAddress1.Text == "" && txtAddress2.Text.Length > 0)
        {
            Label3.Visible = true;
            Label3.Text = "*enter this in Line1";
            Label8.Text = Label3.Text;
            Label2.Text = "";
        }
        if (txtZipcode.Text == "")
        {
            Label4.Visible = true;
            Label4.Text = "*Please enter your zip code";
            Label8.Text = Label4.Text;
        }
        if (txtPhoneno.Text == "")
        {
            Label5.Visible = true;
            Label5.Text = "*Please enter your phone no";
            Label8.Text = Label5.Text;
        }
       
        if (Label8.Text.Length == 0)
        {

            string tym_dt = "";
            tym_dt = DateTime.Now.ToShortDateString().ToString();
            tym_dt += ' ' + DateTime.Now.ToShortTimeString().ToString();

            //data inserting to database table organisation details
            ob.dml_qry("insert into organisation_details values ('" + txtOrgname.Text + "','" + ddOrgtype.Text + "','" + ddIndustry.Text + "','" + ddCountry.Text + "','" + ddState.Text + "','" + txtCity.Text + "','" + txtAddress1.Text + "','" + txtAddress2.Text + "','" + txtZipcode.Text + "','" + txtPhoneno.Text + "','" + txtWebsite.Text + "','" + tym_dt + "','" + tym_dt + "')");

            Response.Redirect("Default2.aspx");

        }

     
       

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtOrgname.Text = "";
        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtZipcode.Text = "";
        txtPhoneno.Text = "";
        txtWebsite.Text = "";
        txtCity.Text = "";
        ddIndustry.SelectedIndex = 0;
        ddOrgtype.SelectedIndex = 0;
    }


    
}
