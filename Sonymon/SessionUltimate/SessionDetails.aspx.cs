using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Configuration;

public partial class SessionDetails : System.Web.UI.Page
{
    BAL db = new BAL();
    protected static int orgId = 51;
    protected static int eventId = 61;
    protected static int userId = 71;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            setLblVisibility(false);
            gvAdditionalReq.Visible = false;
            BindPresenter();
            BindAdditionalReq();
           
            if (Session["command"] != null && Session["command"].Equals("EditSession"))
            {
                SetFields();
                btnSubmit.Text = "Update";
                lblHeading.Text = "Edit Session";
            }
            if (Session["sessionId"] == null)
                Response.Redirect("Sessions.aspx");   
        }   
    }

    protected void setLblVisibility(Boolean b)
    {  
        lblTitleAlreadyExist.Visible = b;
        lblTitleRequired.Visible = b;
        lblDescriptionRequired.Visible = b;
        lblMdtrNameRequired.Visible = b;
        lblNoOfAtndsRequired.Visible = b;
        lblPaperSubmRequired.Visible = b;
        lblPRNameAlreadyExist.Visible = b;
        lblPRRequired.Visible = b;
        lblARRequired.Visible = b;
    }

    protected void BindPresenter()
    {
        db.manipulate("PR_GetRecordById", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + orgId + "','" + eventId + "'");

        if (db.ds.Tables[0].Rows.Count > 0)
        {
            gvPresenter.DataSource = db.ds;
            gvPresenter.DataBind();
        }
        else
        {
            gvPresenter.TemplateControl.Visible = true;
            db.ds.Tables[0].Rows.Add(db.ds.Tables[0].NewRow());
            gvPresenter.DataSource = db.ds;
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
        db.manipulate("AR_GetRecordById", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + orgId + "','" + eventId + "'");

        if (db.ds.Tables[0].Rows.Count > 0)
        {
            gvAdditionalReq.DataSource = db.ds;
            gvAdditionalReq.DataBind();
        }
        else
        {
            db.ds.Tables[0].Rows.Add(db.ds.Tables[0].NewRow());
            gvAdditionalReq.DataSource = db.ds;
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
        BindPresenter(); BindAdditionalReq();
    }
    protected void gvPresenter_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            TextBox txtName = (TextBox)gvPresenter.FooterRow.FindControl("txtftrName");
            TextBox txtTopic = (TextBox)gvPresenter.FooterRow.FindControl("txtftrTopic");

            db.manipulate("PR_GetNameByNameId", "'" + txtName.Text + "','" + Convert.ToInt16(Session["sessionId"]) + "','" + orgId + "','" + eventId + "'");
            if (db.ds.Tables[0].Rows.Count == 0)
            {
                if (txtName.Text.ToString().Length != 0 && txtTopic.Text.ToString().Length != 0)
                {
                    lblPRNameAlreadyExist.Visible = false;
                    db.manipulate("PR_InsertRecord", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + txtName.Text + "','" + txtTopic.Text + "','" + orgId + "','" + eventId + "'");
                    lblPRRequired.Visible = false;
                }
                else
                {
                    lblPRRequired.Visible = true;
                    lblPRNameAlreadyExist.Visible = false;
                }
            }
            else
            {
                lblPRNameAlreadyExist.Visible = true;
                lblPRRequired.Visible = false;
            }
            BindPresenter(); BindAdditionalReq(); 
        }
    }
    protected void gvPresenter_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvPresenter.DataKeys[e.RowIndex].Values["pr_id"].ToString());
        db.manipulate("PR_DeleteRecordById", "'" + id + "','" + orgId + "','" + eventId + "'");
        BindPresenter(); BindAdditionalReq();
    }

    protected void gvPresenter_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvPresenter.EditIndex = e.NewEditIndex;
        BindPresenter(); BindAdditionalReq();
    }

    protected void gvPresenter_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvPresenter.DataKeys[e.RowIndex].Value.ToString());
        TextBox txtName = (TextBox)gvPresenter.Rows[e.RowIndex].FindControl("txtName");
        TextBox txtTopic = (TextBox)gvPresenter.Rows[e.RowIndex].FindControl("txtTopic");
        db.manipulate("PR_UpdateRecordById", "'" + id + "','" + txtName.Text + "','" + txtTopic.Text + "','" + orgId + "','" + eventId + "'");
        gvPresenter.EditIndex = -1;
        BindPresenter(); BindAdditionalReq();
    }

    protected void gvPresenter_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
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
        BindAdditionalReq(); BindPresenter();
    }

    protected void gvAdditionalReq_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            TextBox txtEquipment = (TextBox)gvAdditionalReq.FooterRow.FindControl("txtftrEquipment");
            TextBox txtSpecification = (TextBox)gvAdditionalReq.FooterRow.FindControl("txtftrSpecification");

            if (txtEquipment.Text.ToString().Length != 0)
            {
                db.manipulate("AR_InsertRecord", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + txtEquipment.Text + "','" + txtSpecification.Text + "','" + orgId + "','" + eventId + "'");
                lblARRequired.Visible = false;
            }
            else
                lblARRequired.Visible = true;

            BindAdditionalReq(); BindPresenter();
        }
    }
   
    protected void gvAdditionalReq_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvAdditionalReq.DataKeys[e.RowIndex].Values["ar_id"].ToString());
        db.manipulate("AR_DeleteRecordById", "'" + id + "','" + orgId + "','" + eventId + "'");
        BindAdditionalReq(); BindPresenter();
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

        db.manipulate("AR_UpdateRecordById", "'" + id + "','" + txtEquipment.Text + "','" + txtSpecification.Text + "','" + orgId + "','" + eventId + "'");
       
        gvAdditionalReq.EditIndex = -1;
        BindAdditionalReq(); BindPresenter();
    }

    protected void gvAdditionalReq_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
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
       
        db.manipulate("SS_GetRecordById", "'" + Session["id"] + "','" + orgId + "','" + eventId + "'");   

        txtTitle.Text = db.ds.Tables[0].Rows[0]["ss_title"].ToString();      
        txtDescription.Text = db.ds.Tables[0].Rows[0]["ss_description"].ToString(); 
        txtMdtrName.Text = db.ds.Tables[0].Rows[0]["ss_mdtr_name"].ToString(); 
        txtNoAttendees.Text = db.ds.Tables[0].Rows[0]["ss_max_no_atnd"].ToString();

        byte priorPaperSubm = Convert.ToByte(db.ds.Tables[0].Rows[0]["ss_prior_paper_subm"]);
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

        byte sharingOption = Convert.ToByte(db.ds.Tables[0].Rows[0]["ss_sharing_option"]);

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

        byte addReq = Convert.ToByte(db.ds.Tables[0].Rows[0]["ss_add_req"]);
        if (addReq == 1)
        {
            cbAdditionalRequirement.Checked = true;
            gvAdditionalReq.Visible = true;
        }
        else
        {
            cbAdditionalRequirement.Checked = false;
            gvAdditionalReq.Visible = false;
        }

        int priceAttend = Convert.ToInt16(db.ds.Tables[0].Rows[0]["ss_price_attend"]);
        if (priceAttend == 1)
            rblPriceAttend.SelectedIndex = 0;
        else
            rblPriceAttend.SelectedIndex = 1;
    }

    protected Boolean IsValidControls()
    {
        Boolean status = true;
        //validation
        if (txtTitle.Text.ToString().Trim().Length == 0)   
        {
            lblTitleRequired.Visible = true;
            status = false;
        }
        else
            lblTitleRequired.Visible = false;
        if (txtDescription.Text.ToString().Trim().Length == 0) 
        {
            lblDescriptionRequired.Visible = true;
            status = false;
        }
        else
            lblDescriptionRequired.Visible = false;
        if (txtMdtrName.Text.ToString().Trim().Length == 0)
        {
            lblMdtrNameRequired.Visible = true;
            status = false;
        }
        else
            lblMdtrNameRequired.Visible = false;
        if (txtNoAttendees.Text.ToString().Trim().Length == 0)
        {
            lblNoOfAtndsRequired.Visible = true;
            status = false;
        }
        else
            lblNoOfAtndsRequired.Visible = false;
        if (ddlPriorPaperSubm.SelectedIndex == 0)
        {
            lblPaperSubmRequired.Visible = true; 
            status = false;
        }
        else
            lblPaperSubmRequired.Visible = false; 

        BindPresenter();
        BindAdditionalReq();
        return status;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValidControls())
        {
            //insert into session table
            string title = txtTitle.Text;
            string description = txtDescription.Text;
            string mdtrName = txtMdtrName.Text;
            int maxNoAtnd = Convert.ToInt16(txtNoAttendees.Text);

            byte priorPaperSubm;
            if (ddlPriorPaperSubm.SelectedIndex == 1)
            {
                priorPaperSubm = 1;
            }
            else if (ddlPriorPaperSubm.SelectedIndex == 2)
            {
                priorPaperSubm = 0;
            }
            else
            {
                priorPaperSubm = 2;
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

            byte addReq;
            db.manipulate("AR_GetRecordById", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + orgId + "','" + eventId + "'");

            if (cbAdditionalRequirement.Checked == true && db.ds.Tables[0].Rows.Count > 0)
                addReq = 1;
            else
                addReq = 0;

            int priceAttend;
            if (rblPriceAttend.SelectedIndex == 0)
                priceAttend = 1;
            else
                priceAttend = 0;


            if (Session["command"] != null && Session["command"].Equals("EditSession"))
            {
                var modifiedTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                db.manipulate("SS_UpdateRecordById", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + title + "','" + description + "','" + mdtrName + "','" + maxNoAtnd + "','" + priorPaperSubm + "','" + sharingOption + "','" + addReq + "','" + priceAttend + "','" + modifiedTime + "','" + orgId + "','" + eventId + "','" + userId + "'");
            }
            else
            {
                var createdTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                db.manipulate("SS_InsertRecord", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + title + "','" + description + "','" + mdtrName + "','" + maxNoAtnd + "','" + priorPaperSubm + "','" + sharingOption + "','" + addReq + "','" + priceAttend + "','" + createdTime + "','" + orgId + "','" + eventId + "','" + userId + "'");
            }

            if (cbAdditionalRequirement.Checked == false)
            {
                db.manipulate("AR_DeleteRecordBySSId", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + orgId + "','" + eventId + "'");
            }
            Session["sessionId"] = null;
            Response.Redirect("Sessions.aspx");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Session["command"] != null && Session["command"].Equals("EditSession"))
        {
            db.manipulate("SS_GetRecordById", "'" + Session["id"] + "','" + orgId + "','" + eventId + "'");
            byte addReq = Convert.ToByte(db.ds.Tables[0].Rows[0]["ss_add_req"]);
            if (addReq == 0)
            {
                db.manipulate("AR_DeleteRecordBySSId", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + orgId + "','" + eventId + "'");
            }
        }
        else
        {
            db.manipulate("PR_DeleteRecordBySSId", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + orgId + "','" + eventId + "'");
            db.manipulate("AR_DeleteRecordBySSId", "'" + Convert.ToInt16(Session["sessionId"]) + "','" + orgId + "','" + eventId + "'");
        }
        Response.Redirect("Sessions.aspx");
    }
    protected void cbAdditionalRequirement_CheckedChanged(object sender, EventArgs e)
    {
        if (cbAdditionalRequirement.Checked == true)
        {
            gvAdditionalReq.Visible = true;
            BindPresenter();
            BindAdditionalReq();
        }
        else
        {
            gvAdditionalReq.Visible = false;
            BindPresenter();
        }
    }

    protected void txtTitle_TextChanged(object sender, EventArgs e)
    {
        BindPresenter();
        BindAdditionalReq(); 

        db.manipulate("SS_GetTitleByTitle", "'" + txtTitle.Text.ToString() + "','" + orgId + "','" + eventId + "'");
        if (db.ds.Tables[0].Rows.Count == 0)
            lblTitleAlreadyExist.Visible = false;
        else
            lblTitleAlreadyExist.Visible = true;
    }
}