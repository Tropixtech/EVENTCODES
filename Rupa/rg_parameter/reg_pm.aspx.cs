using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class reg_pm : System.Web.UI.Page
{

    Class1 ob;
    protected void Page_Load(object sender, EventArgs e)
    {

        ob = new Class1();
       
        if (!IsPostBack)
        {
           
            how_many.Visible = false;
            how_many_txtbx.Visible = false;
            no_of_days.Visible = false;
            days_txtbx.Visible = false;
            //panel2.Visible = false;

            //int org_id = int.Parse(Session["org_id"].ToString());
            //int ev_id = int.Parse(Session["ev_id"].ToString());
            int org_id= 2;
            int ev_id = 1;

            ViewState["orgid"] = org_id;
            ViewState["evid"] = ev_id;
            CheckData(org_id, ev_id);
            //btnUpdate.Visible = false;
        }
    }

    public void CheckData(int orgid,int evid)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("select * from reg_parameter where rp_org_id=" + orgid + " and rp_ev_id=" + evid, ob.cn);
        ds.Reset();
        da.Fill(ds);
        btnSave.Visible = false;
        btnUpdate.Visible = false;

        if (ds.Tables[0].Rows.Count > 0)
        {
            txtMax_rg.Text = ds.Tables[0].Rows[0]["rp_max_participants"].ToString();
            txtMax_rg.Enabled = false;

            FillData(rblCan_rg, ds.Tables[0].Rows[0]["rp_is_register_more"].ToString());
            rblCan_rg.Enabled = false;
            if (rblCan_rg.SelectedValue == "1")
            {
                how_many.Visible = true;
                how_many_txtbx.Visible = true;
                txtHow_many.Text = ds.Tables[0].Rows[0]["rp_reg_howmany"].ToString();
                txtHow_many.Enabled = false;
            }
            else
            {
                how_many.Visible = false;
                how_many_txtbx.Visible = false;
            }

            FillData(rblIs_waitlist, ds.Tables[0].Rows[0]["rp_is_wtlisting"].ToString());
            rblIs_waitlist.Enabled = false;

            FillData(rblIs_onsite, ds.Tables[0].Rows[0]["rp_is_onsite_reg"].ToString());
            rblIs_onsite.Enabled = false;

            FillData(rblCan_rgwop, ds.Tables[0].Rows[0]["rp_reg_without_pay"].ToString());
            rblCan_rgwop.Enabled = false;
            if (rblCan_rgwop.SelectedValue == "1")
            {
                no_of_days.Visible = true;
                days_txtbx.Visible = true;
                txtNo_of_days.Text = ds.Tables[0].Rows[0]["rp_no_days_pay"].ToString();
                txtNo_of_days.Enabled = false;
            }
            else
            {
                no_of_days.Visible = false;
                days_txtbx.Visible = false;
            }

        }
        else 
        {
            btnSave.Visible = true;
            btnEdit.Visible = false;
         }
    }

    public void FillData(RadioButtonList rb, String s)
    {
        int index = rb.Items.IndexOf(rb.Items.FindByValue(s));
        rb.SelectedItem.Selected = false;
        rb.Items[index].Selected = true;
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblCan_rg.SelectedIndex == 0)
        {
            how_many.Visible = true;
            how_many_txtbx.Visible = true;

        }
        else
        {
            how_many.Visible = false;
            how_many_txtbx.Visible = false;
        }
    }

    protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblCan_rgwop.SelectedIndex == 0)
        {
            no_of_days.Visible = true;
            days_txtbx.Visible = true;

        }
        else
        {
            no_of_days.Visible = false;
            days_txtbx.Visible = false;
        }

    }




    protected void btnShow_Click(object sender, EventArgs e)
    {
        panel2.Visible = true;
        //panel3.Visible = false;
    }

    //protected void btnCancel_2_Click(object sender, EventArgs e)
    //{
    //    panel2.Visible = false;
    //    //panel3.Visible = true;
    //}
    protected void btnSave_Click(object sender, EventArgs e)
    {

        SqlCommand cmd = new SqlCommand("add1", ob.cn);
        cmd.CommandType = CommandType.StoredProcedure;


        SqlParameter org_id = new SqlParameter("@rp_org_id", SqlDbType.Int);
        org_id.Value = int.Parse(ViewState["orgid"].ToString());
       cmd.Parameters.Add(org_id);


        SqlParameter ev_id = new SqlParameter("@rp_ev_id", SqlDbType.Int);
        ev_id.Value = int.Parse(ViewState["evid"].ToString());
        cmd.Parameters.Add(ev_id);


        SqlParameter max_rg = new SqlParameter("@rp_max_participants", SqlDbType.Int);
        max_rg.Value = txtMax_rg.Text;
        cmd.Parameters.Add(max_rg);

        SqlParameter is_rg = new SqlParameter("@rp_is_register_more", SqlDbType.TinyInt);
        is_rg.Value = rblCan_rg.SelectedValue;
        cmd.Parameters.Add(is_rg);

        if (rblCan_rg.SelectedValue == "1")
        {
            SqlParameter reg_howmany = new SqlParameter("@rp_reg_howmany", SqlDbType.Int);
            reg_howmany.Value = txtHow_many.Text;
            cmd.Parameters.Add(reg_howmany);
        }
        SqlParameter is_wt_list = new SqlParameter("@rp_is_wtlisitng", SqlDbType.TinyInt);
        is_wt_list.Value = rblIs_waitlist.SelectedValue;
        cmd.Parameters.Add(is_wt_list);

        SqlParameter is_onsite = new SqlParameter("@rp_is_onsite_reg", SqlDbType.TinyInt);
        is_onsite.Value = rblIs_onsite.SelectedValue;
        cmd.Parameters.Add(is_onsite);

        SqlParameter rg_wop = new SqlParameter("@rp_reg_without_pay", SqlDbType.TinyInt);
        rg_wop.Value = rblCan_rgwop.SelectedValue;
        cmd.Parameters.Add(rg_wop);

        if (rblCan_rgwop.SelectedValue == "1")
        {
            SqlParameter no_of_day = new SqlParameter("@rp_no_days_pay", SqlDbType.TinyInt);
            no_of_day.Value = txtNo_of_days.Text;
            cmd.Parameters.Add(no_of_day);
        }

        SqlParameter rp_crt = new SqlParameter("@rp_created", SqlDbType.DateTime);
        rp_crt.Value = DateTime.Now.ToLongTimeString();
        cmd.Parameters.Add(rp_crt);

        SqlParameter crtd_id = new SqlParameter("@rp_created_ud_id", SqlDbType.Int);
        crtd_id.Value = 5;
        cmd.Parameters.Add(crtd_id);

        ob.cn.Open();
        cmd.ExecuteNonQuery();
        ob.cn.Close();
        lblMsg.Text = "Successfully Inserted !";

    }

    //protected void btnCancel_2_Click1(object sender, EventArgs e)
    //{
    //    //panel3.Visible = true;
    //    panel2.Visible = false;
    //}

    protected void btnEdit_Click(object sender, EventArgs e)
    {

      
        btnSave.Visible = false;
        btnUpdate.Visible = true;
        btnEdit.Visible = false;

        txtMax_rg.Enabled = true;

       
        rblCan_rg.Enabled = true;
        
        txtHow_many.Enabled = true;
      
           
       
        rblIs_waitlist.Enabled = true;

        rblIs_onsite.Enabled = true;

       
        rblCan_rgwop.Enabled = true;
       
           
        txtNo_of_days.Enabled = true;
       
      
      
   }
}
