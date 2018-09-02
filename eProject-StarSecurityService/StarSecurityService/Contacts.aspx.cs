using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections;
using System.IO.Compression;  

public partial class Contacts : System.Web.UI.Page
{
    private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
            if (!IsPostBack)
            {
                clear();
            }
        
    }
        

    private void clear()
    {
        txtName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtComment.Text = string.Empty;
    }

    protected void Send(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand("AddUpdateContact", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ContactID", string.Empty);
            cmd.Parameters.AddWithValue("@Fullname", txtName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Time", DateTime.Parse(DateTime.Now.Date.ToString()));
            cmd.Parameters.AddWithValue("@Comment", txtComment.Text);

            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.ExecuteNonQuery();
            clear();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Thanks For Your Comment!');", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't send this comment. Please try again! If it can't send again, Please Wait. We will repair it soon!');", true);
        }
    }
}
