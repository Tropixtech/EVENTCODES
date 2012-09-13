using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class AddNewSession : System.Web.UI.Page
{
    static string constr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\EventManagementSystem\\SessionFinal\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True";
    private SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPresenter();
            BindAdditionalReq();
            lblpriorPaperSubmValidation.Visible = false;
            if (Session["command"] != null && Session["command"].Equals("EditSession"))
            {
                SetFields();
                btnSubmit.Text = "Update";
            }
            if (Session["sessionId"] == null)
                Response.Redirect("Default.aspx");
        }
    }   


    protected void BindPresenter()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from presenter where pr_ss_id=" + Convert.ToInt16(Session["sessionId"]), con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();

        if (ds.Tables[0].Rows.Count > 0)
        {
            gvPresenter.DataSource = ds;
            gvPresenter.DataBind();
        }
        else
        {
            gvPresenter.TemplateControl.Visible = true;
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            gvPresenter.DataSource = ds;
            gvPresenter.DataBind();
            int columncount = gvPresenter.Rows[0].Cells.Count;
            gvPresenter.Rows[0].Cells.Clear();
            gvPresenter.Rows[0].Cells.Add(new TableCell());
            gvPresenter.Rows[0].Cells[0].ColumnSpan = columncount;
            gvPresenter.Rows[0].Cells[0].Text = "";
        }
    }

    protected void BindAdditionalReq()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from additionalreq where ar_ss_id = " + Convert.ToInt16(Session["sessionId"]), con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            gvAdditionalReq.DataSource = ds;
            gvAdditionalReq.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            gvAdditionalReq.DataSource = ds;
            gvAdditionalReq.DataBind();
            int columncount = gvAdditionalReq.Rows[0].Cells.Count;
            gvAdditionalReq.Rows[0].Cells.Clear();
            gvAdditionalReq.Rows[0].Cells.Add(new TableCell());
            gvAdditionalReq.Rows[0].Cells[0].ColumnSpan = columncount;
            gvAdditionalReq.Rows[0].Cells[0].Text = "";
        }
    }

    protected void gvPresenter_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvPresenter.EditIndex = -1;
        BindPresenter();
    }
    protected void gvPresenter_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            TextBox txtName = (TextBox)gvPresenter.FooterRow.FindControl("txtftrName");
            TextBox txtTopic = (TextBox)gvPresenter.FooterRow.FindControl("txtftrTopic");
            con.Open();
            SqlCommand cmd =
                new SqlCommand(
                    "insert into presenter(pr_ss_id,pr_name,pr_topic) values("+ Convert.ToInt16(Session["sessionId"]) + ",'" +
                    txtName.Text + "','" + txtTopic.Text + "')", con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                BindPresenter();
                lblresult.ForeColor = Color.Green;
                lblresult.Text = txtName.Text + " Details inserted successfully";
            }
            else
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = txtName.Text + " Details not inserted";
            }
        }
    }
    protected void gvPresenter_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvPresenter.DataKeys[e.RowIndex].Values["pr_id"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from presenter where pr_id=" + id, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            BindPresenter();
            lblresult.ForeColor = Color.Red;
            lblresult.Text = id + " details deleted successfully";
        }
    }
    protected void gvPresenter_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvPresenter.EditIndex = e.NewEditIndex;
        BindPresenter();
    }
    protected void gvPresenter_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvPresenter.DataKeys[e.RowIndex].Value.ToString());
        TextBox txtName = (TextBox)gvPresenter.Rows[e.RowIndex].FindControl("txtName");
        TextBox txtTopic = (TextBox)gvPresenter.Rows[e.RowIndex].FindControl("txtTopic");
        con.Open();
        SqlCommand cmd = new SqlCommand("update presenter set pr_name='" + txtName.Text + "',pr_topic='" + txtTopic.Text + "' where pr_id=" + id, con);
        cmd.ExecuteNonQuery();
        con.Close();
        lblresult.ForeColor = Color.Green;
        lblresult.Text = id + " Details Updated successfully";
        gvPresenter.EditIndex = -1;
        BindPresenter();
    }
    protected void gvPresenter_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ImageButton btnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
            ImageButton btnDelete = (ImageButton)e.Row.FindControl("imgbtnDelete");
            btnEdit.Visible = true;
            btnDelete.Visible = true;

            //getting username from particular row
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "pr_name"));
            //identifying the control in gridview
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtnDelete");
            //raising javascript confirmationbox whenver user clicks on link button
            if (lnkbtnresult != null)
            {
                lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
            }
        }
    }


    protected void gvAdditionalReq_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvAdditionalReq.EditIndex = -1;
        BindAdditionalReq();
    }
    protected void gvAdditionalReq_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            TextBox txtEquipment = (TextBox)gvAdditionalReq.FooterRow.FindControl("txtftrEquipment");
            TextBox txtSpecification = (TextBox)gvAdditionalReq.FooterRow.FindControl("txtftrSpecification");
            con.Open();
            SqlCommand cmd =
                new SqlCommand(
                    "insert into additionalreq(ar_ss_id,ar_equipment,ar_specification) values(" + Convert.ToInt16(Session["sessionId"]) +",'" +
                    txtEquipment.Text + "','" + txtSpecification.Text + "')", con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                BindAdditionalReq();
                lblresult.ForeColor = Color.Green;
                lblresult.Text = txtEquipment.Text + " Details inserted successfully";
            }
            else
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = txtEquipment.Text + " Details not inserted";
            }

        }
    }
   
    protected void gvAdditionalReq_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvAdditionalReq.DataKeys[e.RowIndex].Values["ar_id"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from additionalreq where ar_id=" + id, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            BindAdditionalReq();
            lblresult.ForeColor = Color.Red;
            lblresult.Text = id + " details deleted successfully";
        }
    }
    protected void gvAdditionalReq_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvAdditionalReq.EditIndex = e.NewEditIndex;
        BindAdditionalReq();
    }
    protected void gvAdditionalReq_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvAdditionalReq.DataKeys[e.RowIndex].Value.ToString());
        TextBox txtEquipment = (TextBox)gvAdditionalReq.Rows[e.RowIndex].FindControl("txtEquipment");
        TextBox txtSpecification = (TextBox)gvAdditionalReq.Rows[e.RowIndex].FindControl("txtSpecification");
        con.Open();
        SqlCommand cmd = new SqlCommand("update additionalreq set ar_equipment='" + txtEquipment.Text + "',ar_specification='" + txtSpecification.Text + "' where ar_id=" + id, con);
        cmd.ExecuteNonQuery();
        con.Close();
        lblresult.ForeColor = Color.Green;
        lblresult.Text = id + " Details Updated successfully";
        gvAdditionalReq.EditIndex = -1;
        BindAdditionalReq();
    }
    protected void gvAdditionalReq_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ImageButton btnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit0");
            ImageButton btnDelete = (ImageButton)e.Row.FindControl("imgbtnDelete0");

            btnEdit.Visible = true;
            btnDelete.Visible = true;

            //getting username from particular row
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ar_equipment"));
            //identifying the control in gridview
            ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtnDelete0");
            //raising javascript confirmationbox whenver user clicks on link button
            if (lnkbtnresult != null)
            {
                lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
            }
        }
    }


    protected void SetFields()
    {
         var createdTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
      
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from session where ss_id="+Session["id"], con);
        cmd.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        txtTitle.Text = ds.Tables[0].Rows[0]["ss_title"].ToString();      
        txtDescription.Text = ds.Tables[0].Rows[0]["ss_description"].ToString(); 
        txtMdtrFName.Text = ds.Tables[0].Rows[0]["ss_mdtr_fname"].ToString(); 
        txtMdtrMName.Text = ds.Tables[0].Rows[0]["ss_mdtr_mname"].ToString();
        txtMdtrLName.Text = ds.Tables[0].Rows[0]["ss_mdtr_lname"].ToString();
        txtNoAttendees.Text = ds.Tables[0].Rows[0]["ss_max_no_atnd"].ToString();

        byte priorPaperSubm = Convert.ToByte(ds.Tables[0].Rows[0]["ss_prior_paper_subm"]);
        if (priorPaperSubm == 1)
        {
            ddlPriorPaperSubm.SelectedIndex = 1;
        }

        else if ( priorPaperSubm == 0)
        {
            ddlPriorPaperSubm.SelectedIndex = 2;
        }
        else
        {
            ddlPriorPaperSubm.SelectedIndex = 0;
        }

        byte sharingOption = Convert.ToByte(ds.Tables[0].Rows[0]["ss_sharing_option"]);

        switch (sharingOption)
        {
            case 0: rblOrganizer.SelectedIndex = 1;
                    rblCopresenter.SelectedIndex = 1;
                    rblPublic.SelectedIndex = 1;
                    break;

            case 1: rblOrganizer.SelectedIndex = 1;
                    rblCopresenter.SelectedIndex = 1;
                    rblPublic.SelectedIndex = 0;
                    break;

            case 2: rblOrganizer.SelectedIndex = 1;
                    rblCopresenter.SelectedIndex = 0;
                    rblPublic.SelectedIndex = 1;
                    break;

            case 3: rblOrganizer.SelectedIndex = 1;
                    rblCopresenter.SelectedIndex = 0;
                    rblPublic.SelectedIndex = 0;
                    break;

            case 4: rblOrganizer.SelectedIndex = 0;
                    rblCopresenter.SelectedIndex = 1;
                    rblPublic.SelectedIndex = 1;
                    break;

            case 5: rblOrganizer.SelectedIndex = 0;
                    rblCopresenter.SelectedIndex = 1;
                    rblPublic.SelectedIndex = 0;
                    break;

            case 6: rblOrganizer.SelectedIndex = 0;
                    rblCopresenter.SelectedIndex = 0;
                    rblPublic.SelectedIndex = 1;
                    break;

            case 7: rblOrganizer.SelectedIndex = 0;
                    rblCopresenter.SelectedIndex = 0;
                    rblPublic.SelectedIndex = 0;
                    break;

            default: break;
        }

        int priceAttend = Convert.ToInt16(ds.Tables[0].Rows[0]["ss_price_attend"]);
        if (priceAttend == 1)
            rblPriceAttend.SelectedIndex = 0;
        else
           rblPriceAttend.SelectedIndex = 1;
    }




    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //insert into session table
        string title = txtTitle.Text;
        string description = txtDescription.Text;
        string mdtrFName = txtMdtrFName.Text;
        string mdthMName = txtMdtrMName.Text;
        string mdthLName = txtMdtrLName.Text;
        int maxNoAtnd  = Convert.ToInt16(txtNoAttendees.Text);
        
        byte priorPaperSubm;
        if (ddlPriorPaperSubm.SelectedIndex == 1)
        {
            priorPaperSubm = 1;
            lblpriorPaperSubmValidation.Visible = false;
        }
        else if (ddlPriorPaperSubm.SelectedIndex == 2)
        {
            priorPaperSubm = 0;
            lblpriorPaperSubmValidation.Visible = false;
        }
        else
        {
            priorPaperSubm = 2;
            lblpriorPaperSubmValidation.Text = "Select one";
            lblpriorPaperSubmValidation.Visible = true;
        }

        byte sharingOption;
        if (rblOrganizer.SelectedIndex == 1)
        {
            if (rblCopresenter.SelectedIndex == 1)
            {
                if (rblPublic.SelectedIndex == 1)
                    sharingOption = 0;               
                else
                    sharingOption = 1;    
            }
            else
            {
                if (rblPublic.SelectedIndex == 1)
                    sharingOption = 2;             
                else
                    sharingOption = 3;    
            }
        }
        else
        {
            if (rblCopresenter.SelectedIndex == 1)
            {
                if (rblPublic.SelectedIndex == 1)
                    sharingOption = 4;                                    
                else
                    sharingOption = 5;    
            }
            else
            {
                if (rblPublic.SelectedIndex == 1)
                    sharingOption = 6;                                    
                else
                    sharingOption = 7;    
            }
        }

        int priceAttend;
        if (rblPriceAttend.SelectedIndex == 0)
            priceAttend = 1;
        else
            priceAttend = 0;


        string query="";
        if (Session["command"] != null && Session["command"].Equals("EditSession"))
        {
            var modifiedTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            query = "update session set ss_title ='" + title + "',ss_description = '" + description + "',ss_mdtr_fname = '" + mdtrFName + "',ss_mdtr_mname='" + mdthMName + "',ss_mdtr_lname='" + mdthLName + "',ss_max_no_atnd = " + maxNoAtnd + ",ss_prior_paper_subm=" + priorPaperSubm + ",ss_sharing_option=" + sharingOption + ",ss_price_attend=" + priceAttend + ",ss_modified='" + modifiedTime + "' where ss_id = " + Convert.ToInt16(Session["id"]);
        }
        else
        {
            var createdTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            query = "insert into session (ss_id,ss_title,ss_description,ss_mdtr_fname,ss_mdtr_mname,ss_mdtr_lname,ss_max_no_atnd,ss_prior_paper_subm,ss_sharing_option,ss_price_attend,ss_created,ss_modified) values(" + Convert.ToInt16(Session["sessionId"]) + ",'" + title + "','" + description + "','" + mdtrFName + "','" + mdthMName + "','" + mdthLName + "'," + maxNoAtnd + "," + priorPaperSubm + "," + sharingOption + "," + priceAttend + ",'" + createdTime + "','" + createdTime + "')";
        }
        con.Open();
        SqlCommand cmd = new SqlCommand(query,con);
        cmd.ExecuteNonQuery();
        con.Close();

        Session["sessionId"] = null;
        Response.Redirect("Default.aspx");


    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}