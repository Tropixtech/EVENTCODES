using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using System.Data;
public partial class Register : System.Web.UI.Page
{
    Class1 ob = new Class1();
    DataSet ds1 = new DataSet();


    protected void Page_Load(object sender, EventArgs e)
    {
        ob.conn();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        ds1 = ob.fetch("Select * from user_details where ud_email_id='" + txtMail.Text + "'");


        if (ds1.Tables[0].Rows.Count == 0)
        {
            //Session["ab"] = txtMail.Text;
           // Session["mail"] = txtMail.Text;

            StringBuilder bodyMsg = new StringBuilder(); 

            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            System.Net.NetworkCredential cred = new System.Net.NetworkCredential("tropixtechnologies@gmail.com", "Tropixtech");

            mail.From = new System.Net.Mail.MailAddress("tropixtechnologies@gmail.com");
            mail.To.Add(txtMail.Text);
            mail.Subject = "from application";
            mail.IsBodyHtml = true;                                                                                                                                                                                                                                                                                                                                                                                                                                                                

            
            bodyMsg.Append("Thank you for creating an account \n\n Please follow the link below to activate");
            bodyMsg.Append("<br /><br /><a href=http://localhost:2363/master%20page/login.aspx?id=" + txtMail.Text + "> Follow this link</a>");

            mail.Body = bodyMsg.ToString();

            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.gmail.com");

            smtp.UseDefaultCredentials = false;
            smtp.EnableSsl = true;
            smtp.Credentials = cred;
            smtp.Port = 587;
             
            smtp.Send(mail);

            int a = Autoid1();
            int b = Autoid();


            ob.dml_statement("insert into user_details ( ud_id,ud_org_id, ud_email_id) values( '"+Convert.ToInt32(b)+"','" + Convert.ToInt32(a) + "','" + txtMail.Text + "')");

            Session["ud_id"] = a;
            Session["ud_org_id"] = b;

           // int d = int.Parse(Session["ud_id"].ToString());

            Response.Redirect("thank you.aspx");

              
           
        
            
          

        }
        else if (ds1.Tables[0].Rows.Count == 1)
        {
            lblUsermsg.Text = "Email Id already registered.";
        }
        else
        {
            lblUsermsg.Text = "Error";
        }

                    


    }
     public int id1;
     public int Autoid()
     {
         ob.fetch("select ud_org_id from user_details order by ud_org_id");
         if (ob.ds.Tables[0].Rows.Count == 0)
         {
             id1 = 500;
             return id1;
         }
         else
         {
             id1 = Convert.ToInt32(ob.ds.Tables[0].Rows[ob.ds.Tables[0].Rows.Count - 1].ItemArray[0].ToString()) + 1;
             return id1;
         }
     }









    public int id;
    public int Autoid1()
        
    {
        ob.fetch("select ud_org_id from user_details order by ud_org_id");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            id = 1;
            return id;
        }
        else
        {
            id = Convert.ToInt32(ob.ds.Tables[0].Rows[ob.ds.Tables[0].Rows.Count - 1].ItemArray[0].ToString()) + 1;
            return id;
        }
    }
}