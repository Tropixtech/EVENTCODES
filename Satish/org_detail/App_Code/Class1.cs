using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

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
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\TROPIX-.NET3\Desktop\New folder\master page\App_Data\org_dtl.mdf;Integrated Security=True;User Instance=True");
        cn.Open();
    }

    public void dml_qry(string query)
    {
        //SqlCommand cm = new SqlCommand(query,cn);
        //cm.ExecuteNonQuery();
        da = new SqlDataAdapter(query, cn);
        ds.Clear();
        ds.Reset();
        da.Fill(ds);


    }

    public DataSet fetch(string query)
    {
        da = new SqlDataAdapter(query, cn);
        ds.Clear();
        ds.Reset();
        da.Fill(ds);
        return ds;
    }
}