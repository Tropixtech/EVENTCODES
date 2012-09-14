using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data.SqlClient;
using System.Data;

using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for DbHelper
/// </summary>
public class DbHelper
{
    public SqlConnection con ;
    public SqlDataAdapter da;
    public DataSet ds ;
	public DbHelper()
	{

	}
    public void Read(string query, string value)
    {
        da = new SqlDataAdapter(query+value,con);
        ds.Clear();
        ds.Reset();
        da.Fill(ds);
    }

    public DataSet Fetch(string query)
    {
        da = new SqlDataAdapter(query, con);
        ds.Clear();
        ds.Reset();
        da.Fill(ds);
        return ds;
    }

    public void Connect()
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["cname"].ToString());
        ds = new DataSet();
        
    }
}