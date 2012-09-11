using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userdetail : System.Web.UI.Page
{
    
    Class2 ob1;
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel3.Visible = false;
        ob1=new Class2();
       
        rbtnstatus.Items[0].Selected = true;
        if (!IsPostBack)
        {

            show1();
        }
    }
    static int id;

    public int autoid()
    {
        ob1.read1("fetch_userid");
        if (ob1.ds.Tables[0].Rows.Count == 0)
        {
            id = 100;
            return id;
        }
        else
        {
            id = Convert.ToInt32(ob1.ds.Tables[0].Rows[ob1.ds.Tables[0].Rows.Count - 1].ItemArray[0].ToString()) + 1;
            return id;
        }
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        try
        {
            int v = 11;
            int g = 1;
            Label userid = (Label)GridView1.Rows[GridView1.SelectedIndex].FindControl("lbluserid");
            ob1.read("fetch_status","'"+Session["email"]+"'");
            if (v == Convert.ToInt32(ob1.ds.Tables[0].Rows[0]["ud_status"].ToString()))
            {
                ob1.read("update_user_admin","'"+Convert.ToInt32(v)+"','"+userid.Text+"'");
                ob1.read("update_admin_user", "'" + Convert.ToInt32(g) + "','" + Session["email"] + "'");
                show1();

                Response.Write("<script>alert('user has been changed to admin')</script>");
            }
            else
            {
                Response.Write("<script>alert('Sorry there can be only one Admin for an ogganisation...')</script>");
            }
        }
        catch (Exception ex)
        {
            lblmsg1.Text = ex.Message;
        }
    }
    protected void btncreate_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
    }
    
    public void show1()
    {
        ob1.read1("fetch_all");
        GridView1.DataSource = ob1.ds;
        GridView1.DataBind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        
        GridView1.EditIndex = e.NewEditIndex;
        show1();
        
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {

            var createdTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            Label userid = (Label)GridView1.Rows[e.RowIndex].FindControl("lbluserid");
            TextBox fnme = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtfirst");
            TextBox mnme = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtmiddle");
            TextBox lnme = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtlast");
            TextBox email = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtemail");
            TextBox pass = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtpass");
            Label crdate = (Label)GridView1.Rows[e.RowIndex].FindControl("lblcreate");
            Label deactiv = (Label)GridView1.Rows[e.RowIndex].FindControl("lbldeactive");
            RadioButtonList status = GridView1.Rows[e.RowIndex].FindControl("rbtlstatus") as RadioButtonList;

            if (status.SelectedValue == "1")
            {
                ob1.read("update_active", " " + userid.Text + ",'" + fnme.Text + "','" + mnme.Text + "','" + lnme.Text + "','" + email.Text + "','" + pass.Text + "','" + createdTime + "','" + Convert.ToInt32(status.SelectedValue) + "'");
                {
                    GridView1.EditIndex = -1;
                    show1();
                }
            }
            else
            {
                ob1.read("update_deactive", " " + userid.Text + ",'" + fnme.Text + "','" + mnme.Text + "','" + lnme.Text + "','" + email.Text + "','" + pass.Text + "','" + createdTime + "','" + Convert.ToInt32(status.SelectedValue) + "'");
                {
                    GridView1.EditIndex = -1;
                    show1();
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg1.Text = ex.Message;
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       try
        {
            Label userid = (Label)GridView1.Rows[e.RowIndex].FindControl("lbluserid");
            ob1.read("del_all", "'" + userid.Text + "'");
                 
                show1(); 
        }
        catch (Exception ex)
        {
            lblmsg1.Text = ex.Message;
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            GridView1.EditIndex = -1;
            show1();
        }
        catch (Exception ex)
        {
            lblmsg1.Text = ex.Message;
        }
    }
   
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var createdTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            int a = autoid();
            int b = 1;
            int c = 0;
            Panel3.Visible = true;
            ob1.read("fetch_email", "'" + txtemail.Text + "'");
            if (ob1.ds.Tables[0].Rows.Count > 0)
            {
                lblmsg.Text = "Email Id Already Exist";
            }
            else
            {
                

                  ob1.read("insert_user","'" + a + "','" + txtfirst.Text + "','" + txtmiddle.Text + "','" + txtlast.Text + "','" + txtemail.Text + "','" + txtpass.Text + "','" + createdTime + "','" + b + "',null,null");
                    lblmsg.Text = "Data Added Successfully";
                 
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }
    protected void btnshow_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        show1();
    }
 

    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)  //to update status using radio button. 
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow && ((e.Row.RowState & DataControlRowState.Edit) > 0))
            {

                RadioButtonList rbl = (RadioButtonList)e.Row.FindControl("rbtlstatus");  //it is used to find the control from the item template's edititem template.
                string status = rbl.DataValueField.ToString();   //here the value of status from database which is bind with radio button is stored in status variable.

                if (status == "1")
                {
                    rbl.SelectedValue = "1";

                }
                else if (status == "0")
                {
                    rbl.SelectedValue = "0";
                }
                else
                {
                    rbl.Visible = false;
                }


            }
            else if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == -1)
            {
                Label rbl = (Label)e.Row.FindControl("Label14");   //label14 here is the label used in the item template of status field to show the status.
                string statuss = rbl.Text;
                if (statuss.Equals("1"))
                {
                    rbl.Text = "Active";

                }
                else if (statuss.Equals("0"))
                {
                    rbl.Text = "Deactive";
                }
                else if (statuss.Equals("11"))
                {
                    rbl.Text = "Admin";
                }


            }
        }
        catch (Exception ex)
        {
            lblmsg1.Text = ex.Message;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("event_home.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        show1();
    }
}