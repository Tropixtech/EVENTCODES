using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class rg_pm : System.Web.UI.Page
{
    public Class1 ob;
    protected void Page_Load(object sender, EventArgs e)
    {
        ob = new Class1();
        if (!IsPostBack)
        {
           how_many.Visible = false;
           how_many_txtbx.Visible = false;
           no_of_days.Visible = false;
            days_txtbx.Visible = false;
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbl_can_rg.SelectedIndex == 0)
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
        if (rbl_can_rgwop.SelectedIndex == 0)
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
  
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
         if (txt_max_rg.Text == "")
        {
            lbl_blank.Text = "Number cannot be blank";
            //if (rbl_can_rg.SelectedItem=='1')
            //{
            //    if (txt_how_many.Text == "")
            //    {
            //        Label1.Text == "Number cannot be blank";
            //    }
            //}
        }
        else
        {
            SqlCommand cmd = new SqlCommand("add1", ob.cn);
            cmd.CommandType = CommandType.StoredProcedure;


            SqlParameter org_id = new SqlParameter("@rp_org_id", SqlDbType.Int);
            org_id.Value = 3;
            cmd.Parameters.Add(org_id);


            SqlParameter ev_id = new SqlParameter("@rp_ev_id", SqlDbType.Int);
            ev_id.Value = 2;
            cmd.Parameters.Add(ev_id);


            SqlParameter max_rg = new SqlParameter("@rp_max_participants", SqlDbType.Int);
            max_rg.Value = txt_max_rg.Text;
            cmd.Parameters.Add(max_rg);

            SqlParameter is_rg = new SqlParameter("@rp_is_register_more", SqlDbType.TinyInt);
            is_rg.Value = rbl_can_rg.SelectedValue;
            cmd.Parameters.Add(is_rg);

            if (rbl_can_rg.SelectedValue == "1")
            {
                SqlParameter reg_howmany = new SqlParameter("@rp_reg_howmany", SqlDbType.Int);
                reg_howmany.Value = txt_how_many.Text;
                cmd.Parameters.Add(reg_howmany);
            }
            SqlParameter is_wt_list = new SqlParameter("@rp_is_wtlisitng", SqlDbType.TinyInt);
            is_wt_list.Value = rbl_is_waitlist.SelectedValue;
            cmd.Parameters.Add(is_wt_list);

            SqlParameter is_onsite = new SqlParameter("@rp_is_onsite_reg", SqlDbType.TinyInt);
            is_onsite.Value = rbl_is_onsite.SelectedValue;
            cmd.Parameters.Add(is_onsite);

            SqlParameter rg_wop = new SqlParameter("@rp_reg_without_pay", SqlDbType.TinyInt);
            rg_wop.Value = rbl_can_rgwop.SelectedValue;
            cmd.Parameters.Add(rg_wop);

            if (rbl_can_rgwop.SelectedValue == "1")
            {
                SqlParameter no_of_day = new SqlParameter("@rp_no_days_pay", SqlDbType.TinyInt);
                no_of_day.Value = txt_no_of_days.Text;
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
            lbl_blank.Visible = false;
        }

        //int rp_ev_id = 2;
        //int rp_org_id = 3;
        //int created_ud_id = 6;
        //int mdfd_ud_id = 7;





        //if (txt_max_rg.Text == "")
        //{
        //    lbl_blank.Text = "cannot be empty";
        //}
        //else
        //{
        //    ob.read("add1", "'"+rp_ev_id+"','"+rp_org_id+"','"+txt_max_rg.Text+"','"+Convert.ToInt32(rbl_can_rg.SelectedValue)+"','" +txt_how_many.Text+"','" +Convert.ToInt32(rbl_is_waitlist.SelectedValue)+"','"+Convert.ToInt32(rbl_is_onsite.SelectedValue)+"','"+Convert.ToInt32(rbl_can_rgwop.SelectedValue)+"','"+Convert.ToInt32(txt_no_of_days.Text)+"','"+DateTime.Today.ToShortDateString()+"','" +created_ud_id +"','" +DateTime.Today.ToShortDateString()+"','" +mdfd_ud_id +"'");
        //}
    }
    
}