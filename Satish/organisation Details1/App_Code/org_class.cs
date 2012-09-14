using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for org_class
/// </summary>
public class org_class
{
    public SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ToString());
    public SqlDataAdapter da = new SqlDataAdapter();
    public DataSet ds = new DataSet();
	public org_class()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void read(string query1, string value1)
    {
        da = new SqlDataAdapter(query1 + value1, cn);
        ds.Clear();
        ds.Reset();
        da.Fill(ds);
    }
    public void read1(string query1)
    {
        da = new SqlDataAdapter(query1, cn);
        ds.Clear();
        ds.Reset();
        da.Fill(ds);
    }
}