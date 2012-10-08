using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data.SqlClient;
using System.Data;

using System.Text;
using System.Security.Cryptography;


/// <summary>
/// Summary description for BAL
/// </summary>
public class BAL
{
    public SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Eventmanagement1"].ToString());
  
    public SqlDataAdapter da;
    public SqlDataReader dr;
    public SqlCommand cmd;
    public DataSet ds;

   
    public void manipulate(string parma, string val)
    {
        //try
        //{
            ds = new DataSet();
            ds.Clear();
            ds.Reset();
            con.Open();
            da = new SqlDataAdapter(parma + val, con);
            da.Fill(ds);
            con.Close();
        //}
        //catch (Exception)
        //{
        //    //
        //}
    }

  
    public string pwdd;
    public void gen_pwd()
    {
        int maxSize = 10;
        char[] chars = new char[62];
        string a = "abcdefghijklmno~@#$%^&*()+pqrstuvwxyz0123456789";
        chars = a.ToCharArray();
        int size = maxSize;
        byte[] data = new byte[1];
        RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
        crypto.GetNonZeroBytes(data);
        size = maxSize;
        data = new byte[size];
        crypto.GetNonZeroBytes(data);
        StringBuilder result = new StringBuilder(size);
        foreach (byte b in data)
        {
            result.Append(chars[b % (chars.Length - 1)]);
        }
        pwdd = result.ToString();
    }














    public DataSet fetch(string query)
    {
        da = new SqlDataAdapter(query, con);
        ds = new DataSet();
        ds.Clear();
        ds.Reset();
        da.Fill(ds);
        return ds;

    }


    public int rvalue;

    public int dml_statement(string query)
    {
        cmd = new SqlCommand(query, con);
        rvalue = cmd.ExecuteNonQuery();
        return rvalue;
    }


    //public void read(string query1, string value1)
    //{
    //    da = new SqlDataAdapter(query1 + value1, cn);
    //    ds.Clear();
    //    ds.Reset();
    //    da.Fill(ds);
    //}
    //public void read1(string query1)
    //{
    //    da = new SqlDataAdapter(query1, cn);
    //    ds.Clear();
    //    ds.Reset();
    //    da.Fill(ds);
    //}




   
}



