using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class regprice : System.Web.UI.Page
{

    BAL ob = new BAL();


    private SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=E:\event pricing_demo\App_Data\pricing.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["edit_ptid"] = Session["edit_ptid"];
            ViewState["ptid"] = Session["ptid"];
            ViewState["eventid"] = Session["eventid"];
            ViewState["orgid"] = Session["orgid"];
            ViewState["userid"] = Session["userid"];
            ViewState["command"] = Session["command"];

           //ob.manipulate("select * from pricetype where pt_id='" + int.Parse(ViewState["edit_ptid"].ToString()) + "'", "");
           //if (ob.ds.Tables[0].Rows.Count > 0)
           //{


           //    btnupdate.Visible = true;
           //    btnsubmit.Visible = false;
           //    showeditgrid();
           //}
           //else
           //{
           //    btnsubmit.Visible = true;
           //    btnupdate.Visible = false;
           //    showgrid();
           //}

            if (ViewState["command"] != null && ViewState["command"].Equals("EditSession"))
           {


               btnupdate.Visible = true;
               btnsubmit.Visible = false;
               showeditgrid();
           }
           else
           {
               btnsubmit.Visible = true;
               btnupdate.Visible = false;
               showgrid();
           }
            
            
            
        }
    }
    public void showeditgrid()
    {
        ob.manipulate("select * from pricetype where pt_id='" + int.Parse(ViewState["edit_ptid"].ToString()) + "'", "");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {

            txtpricetype.Text = ob.ds.Tables[0].Rows[0]["pt_name"].ToString();
            txtfrom.Text = ob.ds.Tables[0].Rows[0]["pt_from_date"].ToString();
            txttodate.Text = ob.ds.Tables[0].Rows[0]["pt_to_date"].ToString();
            //ob.manipulate("select * from participanttype INNER JOIN registrationcost ON participanttype.pp_pt_id=registrationcost.pt_id where participanttype.pp_pt_id='" + int.Parse(ViewState["edit_ptid"].ToString()) + "'", "");
            ob.manipulate("sp_p_fetch_parti_regco", "'" + int.Parse(ViewState["edit_ptid"].ToString()) + "'");
            GridView1.DataSource = ob.ds;
            GridView1.DataBind();
        }
    }
    public void showgrid()
    {
        //ob.fetch("SELECT registrationcost.pt_id,registrationcost.rc_id,participanttype.pp_id,participanttype.pp_name, registrationcost.rc_individual, registrationcost.rc_group, registrationcost.rc_guest FROM participanttype INNER JOIN registrationcost ON participanttype.pp_id = registrationcost.rc_pp_id INNER JOIN pricetype ON registrationcost.pt_id="+ ViewState["ptid"] +" ");

        //ob.fetch("select registrationcost.rc_id,participanttype.pp_id,participanttype.pp_name, registrationcost.rc_individual, registrationcost.rc_group, registrationcost.rc_guest FROM  participanttype  INNER JOIN registrationcost ON participanttype.pp_id = registrationcost.rc_pp_id where registrationcost.pt_id=" + ViewState["ptid"] + "");


        ob.manipulate("sp_p_fetch_parti_regco", "'" + int.Parse(ViewState["ptid"].ToString()) + "'");
        

        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ob.ds;
            GridView1.DataBind();
        }
        else
        {
            GridView1.TemplateControl.Visible = true;
            ob.ds.Tables[0].Rows.Add(ob.ds.Tables[0].NewRow());
            GridView1.DataSource = ob.ds;
            GridView1.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView1.Rows[0].Cells[0].Text = "";
        }

    }
    int cnt = 0;
    string arr = "";
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ob.manipulate("sp_p_fetch_ptid", "");
        //int ptid = int.Parse(ob.ds.Tables[0].Rows[0]["pt_id"].ToString());
        if (ob.ds.Tables[0].Rows.Count > 1)
        {
            if (e.Row.RowType == DataControlRowType.Footer && GridView1.EditIndex == -1)
            {
                //GridView gvTemp = (GridView)sender;
                //TextBox txt = (TextBox)GridView1.FooterRow.FindControl("ftrtxtpname");
                //DropDownList ddl = (DropDownList)GridView1.FooterRow.FindControl("ddlpname");

                TextBox txt = (TextBox)e.Row.FindControl("ftrtxtpname");
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlpname");

                //ob.fetch("select DISTINCT pp_name from participanttype where pp_ev_id='" + ViewState["eventid"].ToString() + "' and pp_org_id='" + ViewState["orgid"].ToString() + "' ");
                
           ob.manipulate("sp_p_fetch_distinct_ppname", "'" + int.Parse(ViewState["eventid"].ToString()) + "','" + int.Parse(ViewState["orgid"].ToString()) + "'");
                if (ob.ds.Tables[0].Rows.Count > 0)
                {
                    //ob.manipulate("select pt_id from pricetype", "");
                    //if (ptid == 1)
                    //{
                    //    txt.Visible = true;
                    //    ddl.Visible = false;
                    //}
                    //else
                    //{
                        txt.Visible = false;
                        ddl.Visible = true;
                        while (cnt < ob.ds.Tables[0].Rows.Count)
                        {
                            arr = ob.ds.Tables[0].Rows[cnt]["pp_name"].ToString();
                            cnt++;
                            ddl.Items.Add(new ListItem(arr));

                        }
                    //}



                }
                else
                {
                    ddl.Visible = false;
                }

            }
        }
        else 
        {
            if (e.Row.RowType == DataControlRowType.Footer && GridView1.EditIndex == -1)
            {
                TextBox txt = (TextBox)e.Row.FindControl("ftrtxtpname");
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlpname");

                txt.Visible = true;
                ddl.Visible = false;
            }
        }

    }

    public int id1;
    public int autoid1()
    {
       
        ob.manipulate("sp_p_fetch_ppid", "");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            id1 = 100;
            return id1;
        }
        else
        {
            id1 = Convert.ToInt32(ob.ds.Tables[0].Rows[ob.ds.Tables[0].Rows.Count - 1].ItemArray[0].ToString()) + 1;
            return id1;
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int b = autoid1();
        if (e.CommandName.Equals("AddOrder"))
        {
            
          
           // TextBox strpname = (TextBox)GridView1.FindControl("ftrtxtpname");
            //string strpname = tbstrpname.Text;
            
            TextBox strpname = (TextBox)GridView1.FooterRow.FindControl("ftrtxtpname");
            TextBox strindi = (TextBox)GridView1.FooterRow.FindControl("ftrtxtindvl");
            TextBox strgrp = (TextBox)GridView1.FooterRow.FindControl("ftrtxtgrp");
            TextBox strguest = (TextBox)GridView1.FooterRow.FindControl("ftrtxtguest");
           var frmdt = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss ");
            DropDownList ddl = (DropDownList)GridView1.FooterRow.FindControl("ddlpname");

                if (ddl.Items.Count == 0)
                {
                    ob.manipulate("sp_p_fetch_ppname", "'" + int.Parse(ViewState["ptid"].ToString()) + "','" + strpname.Text + "'");
                    if (ob.ds.Tables[0].Rows.Count > 0)
                    {

                        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type Already Exist For This Price Type');</script>");

                    }

                    else
                    {

                        ob.manipulate("sp_p_insert_parti", "'" + b + "','" + int.Parse(ViewState["ptid"].ToString()) + "','" + int.Parse(ViewState["eventid"].ToString()) + "','" + int.Parse(ViewState["orgid"].ToString()) + "','" + strpname.Text + "','" + frmdt + "','" + int.Parse(ViewState["userid"].ToString()) + "'");
                        ob.manipulate("sp_p_insert_regcost", "'" + int.Parse(ViewState["ptid"].ToString()) + "','" + b + "','" + int.Parse(ViewState["eventid"].ToString().Trim()) + "','" + int.Parse(ViewState["orgid"].ToString().Trim()) + "','" + float.Parse(strindi.Text) + "','" + float.Parse(strgrp.Text) + "','" + float.Parse(strguest.Text) + "'");
                    
                        showgrid();
                        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type and Registration Cost added successfully');</script>");

                    }




                }
                else
                {
                    ob.manipulate("sp_p_fetch_ppname", "'" + int.Parse(ViewState["ptid"].ToString()) + "','" + ddl.SelectedValue + "'");
                    if (ob.ds.Tables[0].Rows.Count > 0)
                    {

                        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type Already Exist For This Price Type');</script>");

                    }

                    else
                    {
                        ob.manipulate("sp_p_insert_parti", "'" + b + "','" + int.Parse(ViewState["ptid"].ToString()) + "','" + int.Parse(ViewState["eventid"].ToString()) + "','" + int.Parse(ViewState["orgid"].ToString()) + "','" + ddl.SelectedValue + "','" + frmdt + "','" + int.Parse(ViewState["userid"].ToString()) + "'");

                        ob.manipulate("sp_p_insert_regcost", "'" + int.Parse(ViewState["ptid"].ToString()) + "','" + b + "','" + int.Parse(ViewState["eventid"].ToString().Trim()) + "','" + int.Parse(ViewState["orgid"].ToString().Trim()) + "','" + float.Parse(strindi.Text) + "','" + float.Parse(strgrp.Text) + "','" + float.Parse(strguest.Text) + "'");
                    
                        showgrid();
                        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type and Registration Cost added successfully');</script>");

                    }

                }
            }
           

           
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
         //string frmdt = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss tt");
        TextBox txt = (TextBox)GridView1.FooterRow.FindControl("ftrtxtindvl");
        ob.manipulate("sp_p_fetch_rcppid", "'" + int.Parse(ViewState["ptid"].ToString()) + "'");
         if (ob.ds.Tables[0].Rows.Count > 0)
         {
             ob.manipulate("sp_p_fetch_ptname", "'" + txtpricetype.Text + "','" + int.Parse(ViewState["orgid"].ToString()) + "','" + int.Parse(ViewState["eventid"].ToString()) + "'");
             if (ob.ds.Tables[0].Rows.Count > 0)
             {
                 ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Price Type Already Exist For The Event ');</script>");
             }
             else
             {
                 var frmdt = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

               
                // ob.manipulate("sp_p_update_insert_pricetype", "'" + int.Parse(ViewState["eventid"].ToString()) + "','" + int.Parse(ViewState["orgid"].ToString()) + "','" + txtpricetype.Text + "','" + txtfrom.Text + "','" + txttodate.Text + "','" + frmdt + "','" + int.Parse(ViewState["userid"].ToString()) + "','" + int.Parse(ViewState["ptid"].ToString()) + "'");

                 ob.manipulate("sp_p_update_insrt_pricetype", "'" + txtpricetype.Text + "','" + txtfrom.Text + "','" + txttodate.Text + "','" + frmdt + "','" + int.Parse(ViewState["userid"].ToString()) + "','" + int.Parse(ViewState["ptid"].ToString()) + "','" + int.Parse(ViewState["eventid"].ToString()) + "','" + int.Parse(ViewState["orgid"].ToString()) + "'");


                 ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Price Type Added Successfully');</script>");

                 Session["eventid"] = ViewState["eventid"];
                 Session["orgid"] = ViewState["orgid"];
                 Session["userid"] = ViewState["userid"];



                 Response.Redirect("cost.aspx");
             }
         }
         else
         {
             ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Please Enter a Registration Cost For The Price Type');</script>");
             showgrid();
             txt.Focus();
         }

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        //showgrid();


        if (Session["command"] != null && Session["command"].Equals("EditSession"))
        {
            showeditgrid();
        }
        else
        {
            showgrid();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strparid = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblppid")).Text;

        SqlCommand cmd = new SqlCommand("delete from participanttype where pp_id=@ppid", con);
        cmd.CommandType = CommandType.Text;

        cmd.Parameters.AddWithValue("@ppid", int.Parse(strparid));


        SqlCommand cmd2 = new SqlCommand("delete from registrationcost where rc_pp_id=@pprcid", con);
        cmd2.CommandType = CommandType.Text;

        cmd2.Parameters.AddWithValue("@pprcid", int.Parse(strparid));


        con.Open();
        cmd.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();

        con.Close();

        ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type and Registration Cost deleted successfully');</script>");
        if (Session["command"] != null && Session["command"].Equals("EditSession"))
        {
            showeditgrid();
        }
        else
        {
            showgrid();
        }

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string strparid = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblppid")).Text;
            string strpname = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtpname")).Text;
            string strindi = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtindvl")).Text;
            string strgrp = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtgrp")).Text;
            string strguest = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtguest")).Text;
            var frmdt = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss ");

            //Prepare the Update Command of the DataSource control
          

            ob.manipulate("sp_p_update_parti", "'"+strpname+"','"+frmdt+"','"+int.Parse(ViewState["userid"].ToString())+"','"+int.Parse(strparid)+"'");

            ob.manipulate("sp_p_update_regcost", "'"+float.Parse(strindi)+"','"+float.Parse(strgrp)+"','"+float.Parse(strguest)+"','"+int.Parse(strparid)+"'");   
        
        
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Participant Type and Registration Cost updated successfully');</script>");

            //Reset Edit Index
            GridView1.EditIndex = -1;

            if (Session["command"] != null && Session["command"].Equals("EditSession"))
            {
                showeditgrid();
            }
            else
            {
                showgrid();
            }
            //showgrid();
        }
       
    
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        //showgrid();
        if (Session["command"] != null && Session["command"].Equals("EditSession"))
        {
            showeditgrid();
        }
        else
        {
            showgrid();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
          Session["eventid"]=ViewState["eventid"];
          Session["orgid"]=ViewState["orgid"];
          Session["userid"]=ViewState["userid"];

         

        Response.Redirect("cost.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)GridView1.FooterRow.FindControl("ftrtxtindvl");
        ob.manipulate("sp_p_fetch_rcppid", "'" + int.Parse(ViewState["edit_ptid"].ToString()) + "'");
        if (ob.ds.Tables[0].Rows.Count > 0)
        {
            ob.manipulate("select pt_name from pricetype where pt_id='"+int.Parse(ViewState["edit_ptid"].ToString())+"'","");
            string ppname = ob.ds.Tables[0].Rows[0]["pt_name"].ToString();
            ob.manipulate("sp_p_fetch_ptname", "'" + txtpricetype.Text + "','" + int.Parse(ViewState["orgid"].ToString()) + "','" + int.Parse(ViewState["eventid"].ToString()) + "'");
            string ppnme=ob.ds.Tables[0].Rows[0]["pt_name"].ToString();
            if (ob.ds.Tables[0].Rows.Count > 0 &&  ppname!=ppnme)
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Price Type Already Exist For The Event ');</script>");
            }
            else
            {
                var frmdt = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");


                ob.manipulate("sp_p_update_insert_pricetype", "'" + int.Parse(ViewState["eventid"].ToString()) + "','" + int.Parse(ViewState["orgid"].ToString()) + "','" + txtpricetype.Text + "','" + txtfrom.Text + "','" + txttodate.Text + "','" + frmdt + "','" + int.Parse(ViewState["userid"].ToString()) + "','" + int.Parse(ViewState["edit_ptid"].ToString()) + "'");



                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Price Type Added Successfully');</script>");

                Session["eventid"] = ViewState["eventid"];
                Session["orgid"] = ViewState["orgid"];
                Session["userid"] = ViewState["userid"];



                Response.Redirect("cost.aspx");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Please Enter a Registration Cost For The Price Type');</script>");
            showgrid();
            txt.Focus();
        }
    }
}