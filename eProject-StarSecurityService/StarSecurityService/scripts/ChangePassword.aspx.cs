using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;

public partial class ChangePassword : System.Web.UI.Page
{
    
    SqlConnection conn;
    private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["allow"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }
            txtID.Text = Session["ID"].ToString();
            txtID.ReadOnly = true;
        
    }
    //khai bao ma hoa MD5
    public static string encryptMD5(string pass)
    {

        return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pass.Trim(), "SHA1");
    }
    
    protected void UpPass(string oldpass, string newpass, string comnewpass)
    {


        
        conn = new SqlConnection(strConnString);
        conn.Open();

        string uppass = encryptMD5(newpass);
        string passmahoa = encryptMD5(oldpass);
        SqlCommand cmd = new SqlCommand("select count(*) from tb_Employee where EmployeeID = '" + txtID.Text.ToString() + "'and Password = '" + passmahoa + "'", conn);
        int a = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        if (a == 1)
        {
           
            SqlCommand cmd1 = new SqlCommand("update tb_Employee set Password = '" + encryptMD5(txtNewpass.Text) + "'where EmployeeID = '" + txtID.Text + "'", conn);
            cmd1.ExecuteNonQuery();
            Response.Write("<script> alert(' Update successfull! ') </script>");
            Response.Write("<script>window.location.assign('AdminHomes.aspx')</script>");
        }
        else
        {
            Response.Write("<script> alert(' Username or Password are not invalid ! ') </script>");
            
            txtID.Text = "";
            txtNewpass.Text = "";
            txtComfirm.Text = "";
        }

        
    }
    protected void btChange_Click(object sender, EventArgs e)
    {
        string oldpass = txtOldpass.Text.ToString();
        string newpass = txtNewpass.Text;
        string comnewpass = txtComfirm.Text;
        UpPass(oldpass, newpass, comnewpass);
    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        txtOldpass.Text = "";
        txtNewpass.Text = "";
        txtComfirm.Text = "";
        txtID.Text = "";
    }
}
