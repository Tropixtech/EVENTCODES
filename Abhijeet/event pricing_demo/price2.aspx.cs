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



public partial class price2 : System.Web.UI.Page
{
    BAL ob = new BAL();
   

    private SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Tropix.net\Desktop\event pricing\App_Data\pricing.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");


    #region Variables
    string gvUniqueID = String.Empty;
    int gvNewPageIndex = 0;
    int gvEditIndex = -1;
    string gvSortExpr = String.Empty;
    private string gvSortDir
    {

        get { return ViewState["SortDirection"] as string ?? "ASC"; }

        set { ViewState["SortDirection"] = value; }

    }
    #endregion

    //This procedure returns the Sort Direction
    private string GetSortDirection()
    {
        switch (gvSortDir)
        {
            case "ASC":
                gvSortDir = "DESC";
                break;

            case "DESC":
                gvSortDir = "ASC";
                break;
        }
        return gvSortDir;
    }

    //This procedure prepares the query to bind the child GridView
    private SqlDataSource ChildDataSource(string strCustometId, string strSort)
    {
        string strQRY = "";
        SqlDataSource dsTemp = new SqlDataSource();
        dsTemp.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Tropix.net\Desktop\event pricing\App_Data\pricing.mdf;Integrated Security=True;User Instance=True";


        strQRY = "SELECT registrationcost.pt_id,registrationcost.rc_id,participanttype.pp_id,participanttype.pp_name, registrationcost.rc_individual, registrationcost.rc_group, registrationcost.rc_guest FROM participanttype INNER JOIN registrationcost ON participanttype.pp_id = registrationcost.rc_pp_id  WHERE [registrationcost].[pt_id] = '" + strCustometId + "'";

       // strQRY = "SELECT pricetype.pt_id, participanttype.pp_name, registrationcost.rc_individual FROM dbo.participanttype INNER JOIN dbo.registrationcost ON dbo.participanttype.pp_id = dbo.registrationcost.rc_pp_id INNER JOIN dbo.pricetype ON dbo.registrationcost.pt_id = dbo.pricetype.pt_id";


        //strQRY="SELECT     dbo.pricetype.pt_name, dbo.participanttype.pp_name, dbo.registrationcost.rc_individual FROM dbo.participanttype INNER JOIN
        //              dbo.registrationcost ON dbo.participanttype.pp_id = dbo.registrationcost.rc_pp_id INNER JOIN
        //              dbo.pricetype ON dbo.registrationcost.pt_id = dbo.pricetype.pt_id";
        dsTemp.SelectCommand = strQRY;
        return dsTemp;
    }
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["eventid"] = 1;
            ViewState["orgid"] = 2;
            ViewState["userid"] = 3;
         showgrid();
        }
    }

    public void showgrid()
    {
        ob.manipulate("select * from pricetype  order by pt_id", "");
        GridView1.DataSource = ob.ds;
        GridView1.DataBind();
    }

    #region GridView1 Event Handlers
    //This event occurs for each row
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        GridViewRow row = e.Row;
        string strSort = string.Empty;

        // Make sure we aren't in header/footer rows
        if (row.DataItem == null)
        {
            return;
        }

        //Find Child GridView control
        GridView gv = new GridView();
        gv = (GridView)row.FindControl("GridView2");

        //Check if any additional conditions (Paging, Sorting, Editing, etc) to be applied on child GridView
        if (gv.UniqueID == gvUniqueID)
        {
            gv.PageIndex = gvNewPageIndex;
            gv.EditIndex = gvEditIndex;
            //Check if Sorting used
            if (gvSortExpr != string.Empty)
            {
                GetSortDirection();
                strSort = " ORDER BY " + string.Format("{0} {1}", gvSortExpr, gvSortDir);
            }
            //Expand the Child grid
            ClientScript.RegisterStartupScript(GetType(), "Expand", "<SCRIPT LANGUAGE='javascript'>expandcollapse('div" + ((DataRowView)e.Row.DataItem)["pt_id"].ToString() + "','one');</script>");
      
        }

        //Prepare the query for Child GridView by passing the Customer ID of the parent row
        gv.DataSource = ChildDataSource(((DataRowView)e.Row.DataItem)["pt_id"].ToString(), strSort);
        gv.DataBind();

        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == -1 &&  gv.Rows.Count == 0)
        {
            ClientScript.RegisterStartupScript(GetType(), "Expand", "<SCRIPT LANGUAGE='javascript'>expandcollapse('div" + ((DataRowView)e.Row.DataItem)["pt_id"].ToString() + "','one');</script>");
            string s = e.Row.DataItem.ToString();
        }

        //Add delete confirmation message for Customer
        LinkButton l = (LinkButton)e.Row.FindControl("linkDeleteCust");
        l.Attributes.Add("onclick", "javascript:return " +
        "confirm('Are you sure you want to delete this Customer " +
        DataBinder.Eval(e.Row.DataItem, "pt_id") + "')");

    }
    public int id;
    public int autoid()
    {
        ob.fetch("select pt_id from pricetype order by pt_id");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            id = 4000;
            return id;
        }
        else
        {
            id = Convert.ToInt32(ob.ds.Tables[0].Rows[ob.ds.Tables[0].Rows.Count - 1].ItemArray[0].ToString()) + 1;
            return id;
        }
    }

    //This event occurs for any operation on the row of the grid
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int a = autoid(); ;
       // var createdTime = DateTime.Now.ToString("dd-MM-YYYY HH:mm:ss");
        string frmdt = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss tt");
        //Check if Add button clicked
        if (e.CommandName == "AddCustomer")
        {
            try
            {
                //Get the values stored in the text boxes
                string strpricetype = ((TextBox)GridView1.FooterRow.FindControl("txtptype")).Text;
                string strfromdate = ((TextBox)GridView1.FooterRow.FindControl("txtfromdate")).Text;
                string strtodate = ((TextBox)GridView1.FooterRow.FindControl("txttodate")).Text;
                
               

                //Prepare the Insert Command of the DataSource control
                string strSQL = "";
                strSQL = "INSERT INTO pricetype (pt_id, pt_ev_id, pt_org_id, " +
                        "pt_name, pt_from_date,pt_to_date,pt_created,pt_created_ud_id) VALUES ('" + a + "','" + ViewState["eventid"].ToString() + "','" + ViewState["orgid"].ToString() + "','" + strpricetype + "','" + Convert.ToDateTime(strfromdate) + "','" + Convert.ToDateTime(strtodate) + "','" + frmdt + "','" + ViewState["userid"].ToString() + "')";

                ob.fetch(strSQL);
                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Customer added successfully');</script>");

                //Re bind the grid to refresh the data
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('" + ex.Message.ToString().Replace("'", "") + "');</script>");
            }
        }
    }

    //This event occurs on click of the Update button
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //Get the values stored in the text boxes
        string strpricetype = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtptype")).Text;
        string strfromdate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtfromdate")).Text;
        string strtodate = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txttodate")).Text;

        string strpt_id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblptid")).Text;

        try
        {
            //Prepare the Update Command of the DataSource control
            string strSQL = "";
            strSQL = "UPDATE pricetype set pt_name = '" + strpricetype + "'" +
                     ",pt_from_date = '" + strfromdate + "'" +
                     ",pt_to_date = '" + strtodate + "'" +
                    
                     " WHERE pt_id = '" + strpt_id + "'";
            ob.fetch(strSQL);
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Customer updated successfully');</script>");
        }
        catch { }
    }

    //This event occurs after RowUpdating to catch any constraints while updating
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        //Check if there is any exception while deleting
        if (e.Exception != null)
        {
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('" + e.Exception.Message.ToString().Replace("'", "") + "');</script>");
            e.ExceptionHandled = true;
        }
    }

    //This event occurs on click of the Delete button
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Get the value        
        string strpt_id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblptid")).Text;

        //Prepare the delete Command of the DataSource control
        string strSQL = "";

        try
        {


            //strSQL = "delete from pricetype INNER JOIN registrationcost ON pricetype.pt_id=registrationcost.pt_id INNER JOIN participanttype ON registrationcost.rc_pp_id=participanttype.pp_id ";


            strSQL = "DELETE from pricetype WHERE pt_id = '" + strpt_id + "'";
            ob.fetch(strSQL);
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Customer deleted successfully');</script>");
            //GridView1.DataBind();
            showgrid();
        }
        catch { }
    }

    //This event occurs after RowDeleting to catch any constraints while deleting
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        //Check if there is any exception while deleting
        if (e.Exception != null)
        {
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('" + e.Exception.Message.ToString().Replace("'", "") + "');</script>");
            e.ExceptionHandled = true;
        }
    } 
    #endregion

    #region GridView2 Event Handlers
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        gvUniqueID = gvTemp.UniqueID;
        gvNewPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    public int id1;
    public int autoid1()
    {
        ob.fetch("select pp_id from participanttype order by pp_id");
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
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int b = autoid1();
        //int b = 1;
        
        if (e.CommandName == "AddOrder")
        {
            try
            {
                GridView gvTemp = (GridView)sender;
                gvUniqueID = gvTemp.UniqueID;

                //Get the values stored in the text boxes
                string strpt_id = gvTemp.DataKeys[0].Value.ToString();  //price type(pt_id) ID is stored as DataKeyNames
                string strpname = ((TextBox)gvTemp.FooterRow.FindControl("txtpname")).Text;
                string strindi = ((TextBox)gvTemp.FooterRow.FindControl("txtindvl")).Text;
                string strgrp = ((TextBox)gvTemp.FooterRow.FindControl("txtgrp")).Text;
                string strguest = ((TextBox)gvTemp.FooterRow.FindControl("txtguest")).Text;
                string frmdt = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss tt");

               


                SqlCommand cmd = new SqlCommand("insert into participanttype (pp_id,pp_ev_id,pp_org_id,pp_name,pp_created,pp_created_ud_id) values (@pid,@pevid,@porgid,@pname,@pcrt,@pcrtid)", con);
                cmd.CommandType = CommandType.Text;

         

                //SqlCommand cmd = new SqlCommand("insert into participanttype (pp_id,pp_ev_id,pp_org_id,pp_name,pp_created,pp_created_ud_id,pp_modified) values (" + b + "," + int.Parse(ViewState["eventid"].ToString()) + "," + int.Parse(ViewState["orgid"].ToString()) + ",'" + strpname + "','" + frmdt + "'," + int.Parse(ViewState["userid"].ToString()) + ",'" + frmdt + "')", con);
                //cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@pid", b);
                cmd.Parameters.AddWithValue("@pevid", ViewState["eventid"].ToString().Trim());
                cmd.Parameters.AddWithValue("@porgid", ViewState["orgid"].ToString().Trim());
                cmd.Parameters.AddWithValue("@pname", strpname.Trim());
                cmd.Parameters.AddWithValue("@pcrt", frmdt);

                cmd.Parameters.AddWithValue("@pcrtid", ViewState["userid"].ToString().Trim());
                //cmd.Parameters.AddWithValue("@pmodify", );

                //cmd.Parameters.AddWithValue("@pmodifyid", "NULL");

                //int ID = Int32.Parse(cmd.ExecuteScalar().ToString());
                SqlCommand cmd2 = new SqlCommand("insert into registrationcost (pt_id,rc_pp_id,rc_ev_id,rc_org_id,rc_individual,rc_group,rc_guest) values (@ptid,@ppid,@evid,@orgid,@indv,@group,@guest)", con);
                cmd2.CommandType = CommandType.Text;

                cmd2.Parameters.AddWithValue("@ptid", int.Parse(strpt_id));
                cmd2.Parameters.AddWithValue("@ppid", b);
                cmd2.Parameters.AddWithValue("@evid", ViewState["eventid"].ToString().Trim());
                cmd2.Parameters.AddWithValue("@orgid", ViewState["orgid"].ToString().Trim());
                cmd2.Parameters.AddWithValue("@indv", float.Parse(strindi));
                cmd2.Parameters.AddWithValue("@group", float.Parse(strgrp));
                cmd2.Parameters.AddWithValue("@guest", float.Parse(strguest));


                con.Open();
                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();

                con.Close();

                //string strSQL = "";
                //strSQL = "insert into participanttype pt  INNER JOIN registrationcost rc ON pt.pp_id=rc.rc_pp_id(pt.pp_id,pt.pp_ev_id,pt.pp_org_id,pt.pp_created,pt.pp_created_ud_id,pt.pp_modified,pt.pp_modified_ud_id,rc.pt_id,rc.rc_pp_id,rc.rc_ev_id,rc.rc_org_id,rc.rc_individual,rc.rc_group,rc.rc_guest) values (" + b + ",'" + ViewState["eventid"].ToString() + "','" + ViewState["orgid"].ToString() + "','" + strpname + "','" + createdTime + "','" + ViewState["userid"].ToString() + "',NULL,NULL,'" + int.Parse(strpt_id) + "'," + b + ",,'" + ViewState["eventid"].ToString() + "','" + ViewState["orgid"].ToString() + "','" + float.Parse(strindi) + "','" + float.Parse(strgrp) + "','" + float.Parse(strguest) + "')";
                        
                //ob.manipulate(strSQL,"");
                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Order added successfully');</script>");

                GridView1.DataBind();
                showgrid();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('" + ex.Message.ToString().Replace("'", "") + "');</script>");
            }
        }
    }

    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        gvUniqueID = gvTemp.UniqueID;
        gvEditIndex = e.NewEditIndex;
        GridView1.DataBind();
        showgrid();
    }

    protected void GridView2_CancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        gvUniqueID = gvTemp.UniqueID;
        gvEditIndex = -1;
        GridView1.DataBind();
        showgrid();
    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            //GridView gvinner = (GridView)GridView1.i.FindControl("GridView2");
            GridView gvTemp = (GridView)sender;
            gvUniqueID = gvTemp.UniqueID;

            //Get the values stored in the text boxes
           // TextBox fnme = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtfirst");
            string strparid = ((Label)gvTemp.Rows[e.RowIndex].FindControl("lblppid")).Text;
            string strpname = ((TextBox)gvTemp.Rows[e.RowIndex].FindControl("txtpname")).Text;
            string strindi = ((TextBox)gvTemp.Rows[e.RowIndex].FindControl("txtindvl")).Text;
            string strgrp = ((TextBox)gvTemp.Rows[e.RowIndex].FindControl("txtgrp")).Text;
            string strguest = ((TextBox)gvTemp.Rows[e.RowIndex].FindControl("txtguest")).Text;

            //Prepare the Update Command of the DataSource control
            //SqlDataSource dsTemp = new SqlDataSource();
            //dsTemp.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Tropix.net\Desktop\event pricing\App_Data\pricing.mdf;Integrated Security=True;User Instance=True";
            //string strSQL = "";

            SqlCommand cmd = new SqlCommand("update participanttype set pp_name=@ppname where pp_id=@ppid", con);
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@ppname", strpname);
            cmd.Parameters.AddWithValue("@ppid", int.Parse(strparid));

            SqlCommand cmd2 = new SqlCommand("update registrationcost set rc_individual=@indv,rc_group=@grp,rc_guest=@gst where rc_pp_id=@rcppid", con);
            cmd2.CommandType = CommandType.Text;

            cmd2.Parameters.AddWithValue("@indv", strindi);
            cmd2.Parameters.AddWithValue("@grp", strgrp);
            cmd2.Parameters.AddWithValue("@gst", strguest);
            cmd2.Parameters.AddWithValue("@rcppid", int.Parse(strparid));

            con.Open();
            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();

            con.Close();

           // strSQL = "UPDATE participanttype  INNER JOIN registrationcost   ON participanttype.pp_id = registrationcost.rc_pp_id   SET participanttype.pp_name='" + strpname + "',registrationcost.rc_individual='" + strindi + "',registrationcost.rc_group='" + strgrp + "',registrationcost.rc_guest='" + strguest + "' WHERE registrationcost.rc_pp_id = '" + strparid + "'";

            
            //dsTemp.UpdateCommand = strSQL;
            //dsTemp.Update();
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Order updated successfully');</script>");

            //Reset Edit Index
            gvEditIndex = -1;

            GridView1.DataBind();
            showgrid();
        }
        catch { }
    }

    protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        //Check if there is any exception while deleting
        if (e.Exception != null)
        {
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('" + e.Exception.Message.ToString().Replace("'", "") + "');</script>");
            e.ExceptionHandled = true;
        }
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        gvUniqueID = gvTemp.UniqueID;

        //Get the value        
        string strparid = ((Label)gvTemp.Rows[e.RowIndex].FindControl("lblppid")).Text;

        //Prepare the Update Command of the DataSource control
        //string strSQL = "";

        try
        {


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


            //strSQL = "DELETE from cost WHERE pp_id = " + strparid;
            //SqlDataSource dsTemp = new SqlDataSource();
            //dsTemp.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Tropix.net\Desktop\event pricing\App_Data\pricing.mdf;Integrated Security=True;User Instance=True";

            //dsTemp.DeleteCommand = strSQL;
            //dsTemp.Delete();

            //LinkButton l = (LinkButton)gvTemp.Rows[e.RowIndex].FindControl("linkDeleteCust");
            //l.Attributes.Add("onclick", "javascript:return " +
            //"confirm('Are you sure you want to delete this Customer " +
            //DataBinder.Eval(gvTemp.Rows[e.RowIndex].DataItem, "pp_id") + "')");



            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('Order deleted successfully');</script>");
            GridView1.DataBind();
            showgrid();
        }
        catch { }
    }

    protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        //Check if there is any exception while deleting
        if (e.Exception != null)
        {
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert('" + e.Exception.Message.ToString().Replace("'", "") + "');</script>");
            e.ExceptionHandled = true;
        }
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        //int cnt = 0;
        //string arr = "";

        ////GridView gvTemp = (GridView)sender;
        //TextBox txt = (TextBox)e.Row.FindControl("txtpname");
        //DropDownList ddl = (DropDownList)e.Row.FindControl("ddlpname");

      //  TextBox txt = ((TextBox)gvTemp.FooterRow.FindControl("txtpname"));
        //DropDownList ddl = ((DropDownList)gvTemp.FooterRow.FindControl("ddlpname"));

        //Check if this is our Blank Row being databound, if so make the row invisible
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (((DataRowView)e.Row.DataItem)["rc_id"].ToString() == String.Empty) e.Row.Visible = false;
        }
        //if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == -1)
        //{
        //    ob.fetch("select pp_name from participanttype where pp_ev_id='"+ ViewState["eventid"].ToString() +"' and pp_org_id='"+ ViewState["orgid"].ToString() +"'");
        //    if (ob.ds.Tables[0].Rows.Count > 0)
        //    {
        //        while (cnt < ob.ds.Tables[0].Rows.Count)
        //        {
        //            arr = ob.ds.Tables[0].Rows[cnt]["pp_name"].ToString();
        //            cnt++;
        //            ddl.Items.Add(new ListItem(arr));
        //        }
        //        txt.Visible = false;
        //        ddl.Visible = true;
                
        //    }
        //    else
        //    {
        //        ddl.Visible = false;
        //    }

            

        }

    protected void GridView2_Sorting(object sender, GridViewSortEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        gvUniqueID = gvTemp.UniqueID;
        gvSortExpr = e.SortExpression;
        GridView1.DataBind();
    } 

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        showgrid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        showgrid();
    }
    public int autoid2()
    {
        ob.fetch("select pt_id from pricetype order by pt_id");
        if (ob.ds.Tables[0].Rows.Count == 0)
        {
            id = 4000;
            return id;
        }
        else
        {
            id = Convert.ToInt32(ob.ds.Tables[0].Rows[ob.ds.Tables[0].Rows.Count - 1].ItemArray[0].ToString()) + 1;
            return id;
        }
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    int b = autoid2();
    //    SqlCommand cmd = new SqlCommand("insert into pricetype (pt_id) values (@ptid)", con);
    //    cmd.CommandType = CommandType.Text;

    //    cmd.Parameters.AddWithValue("@ptid", b);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //}
}

    
    #endregion

    





//SELECT        participanttype.pp_name, registrationcost.rc_individual, registrationcost.rc_group, registrationcost.rc_guest
//FROM            participanttype INNER JOIN
//                         registrationcost ON participanttype.pp_id = registrationcost.rc_pp_id




//"SELECT dbo.pricetype.pt_name, dbo.participanttype.pp_name, dbo.registrationcost.rc_individual FROM dbo.participanttype INNER JOIN dbo.registrationcost ON dbo.participanttype.pp_id = dbo.registrationcost.rc_pp_id INNER JOIN dbo.pricetype ON dbo.registrationcost.pt_id = dbo.pricetype.pt_id";
