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
            bodyMsg.Append("<br /><br /><a href=http://localhost:2363/master%20page/Newregister.aspx?id=" + txtMail.Text + "> Follow this link</a>");

            mail.Body = bodyMsg.ToString();

            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.gmail.com");

            smtp.UseDefaultCredentials = false;
            smtp.EnableSsl = true;
            smtp.Credentials = cred;
            smtp.Port = 587;

            smtp.Send(mail);


            Response.Redirect("thank you.aspx");
        }
        else if (ds1.Tables[0].Rows.Count == 1)
        {
            Label3.Text = "Email Id already registered.";
        }
        else
        {
            Label3.Text = "Error";
        }



    }
}