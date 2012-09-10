using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
    public SqlConnection cn;
    public SqlCommand cm;
    public SqlDataAdapter da;
    public DataSet ds = new DataSet();
    public Class1()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void conn()
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=E:\EVENTCODES\Ritu\master page\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
        //cn.Open();
    }
    public int rvalue;
    public int dml_statement(string query)
    {
        cm = new SqlCommand(query, cn);
        rvalue = cm.ExecuteNonQuery();
        return rvalue;
    }
    public DataSet fetch(string query)
    {
        da = new SqlDataAdapter(query, cn);
        ds.Clear();
        ds.Reset();
        da.Fill(ds);
        return ds;
    }
    public void grdv(string query, GridView g1)
    {
        fetch(query);
        g1.DataSource = ds.Tables[0];
        g1.DataBind();
    }
    public void datalistviewcall(string query, DataList g1)
    {
        fetch(query);
        g1.DataSource = ds.Tables[0];
        g1.DataBind();
    }


}