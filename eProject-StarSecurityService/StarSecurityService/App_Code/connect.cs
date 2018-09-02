using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for connect
/// </summary>
public class connect
{

    public static SqlConnection cnn = null;
    public static SqlDataReader sdar;
    public static DataSet ds;
    public static SqlCommand cmd;


    public static SqlConnection getconn()
    {
        string conn = ConfigurationManager.ConnectionStrings["conString"].ToString();
        cnn= new SqlConnection(conn);
        cnn.Open();
        return cnn;

    }



	public connect()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
