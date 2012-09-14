using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Test : System.Web.UI.Page
{
    static string constr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\EventManagementSystem\\SessionFinal\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True";
    private SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from presenter", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        GridView1.DataSource = ds;
        GridView1.DataBind();


    }
}