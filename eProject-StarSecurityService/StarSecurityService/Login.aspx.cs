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
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class admin_Login : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;

    SqlDataReader sdr;
    private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public string mahoa(string pass)
    {
        return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pass.Trim(), "SHA1");
    }
   


    public int phanquyen(string input)
    {
        conn = new SqlConnection(strConnString);
        conn.Open();
        cmd = new SqlCommand("kiemtraquyen", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@EmployeeID", input);

        int maquyen = (int)cmd.ExecuteScalar();
        
        return maquyen;
        
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {

 
      conn = new SqlConnection(strConnString);
       conn.Open();

        cmd = new SqlCommand("login_form", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@EmployeeID", txtusername.Text);
        cmd.Parameters.AddWithValue("@Password", mahoa(txtpassword.Text));
        sdr = cmd.ExecuteReader();
     
        bool login = sdr.Read();

        if (login)
        {
            int check = phanquyen(txtusername.Text);
            switch (check)
            {
                case 1:


                    Session["Fullname"] = sdr.GetString(1);
                    Session["ID"] = txtusername.Text;
                    Session["allow"] = true;

                    Response.Redirect("~/admin/AdminHomes.aspx");
                    break;

                case 2:

                    Session["Fullname2"] = sdr.GetString(1);
                    Session["ID2"] = txtusername.Text;
                    Session["allow2"] = true;
                    Response.Redirect("~/Home.aspx");
                    break;
                //case 3:

                //    Session["Fullname"] = connect.sdar.GetString(1);
                //    Session["allow"] = true;
                //    Response.Redirect("test.aspx");
                //    break;

            }
        }

        else
        {

            Response.Write("<script>alert('User you entered does not belong to any account.')</script>");
            Response.Write("<script>window.location.assign('Login.aspx')</script>");
        }
    }
}
