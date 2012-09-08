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
        if (!IsPostBack)
        {
            int id = int.Parse(Session["userid"].ToString());
        }


        
        if (!IsPostBack)
        {


            if (Session["email"] != null)
            {
                Panel3.Visible = false;
                Label4.Text = Convert.ToString(Session["email"]);
                //Response.Redirect("Welcome.aspx");
            }
         

            else

                Response.Redirect("Register.aspx");
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
        Response.Redirect("Register.aspx");

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        
    }
}

     