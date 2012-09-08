using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label4.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label4.Visible = true;
    }

    
}