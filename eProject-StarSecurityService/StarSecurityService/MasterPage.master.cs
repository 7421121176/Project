using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.Configuration;
using System.Data.SqlClient;


public partial class MasterPage : System.Web.UI.MasterPage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID2"] != null)
        {
            Button1.Visible = true;
            btnsubmitlogin.Visible = false;
            Button2.Visible = true;
        }
        else
        {
            Button1.Visible = false;
            btnsubmitlogin.Visible = true;
            Button2.Visible = false;
        }
    }

    public void btn_logout(object sender, EventArgs e)
    {
    }
    
}

  