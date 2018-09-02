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
    bool check = true;
    private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID2"] != null)
        {
            BindData();
            if (Session["allow2"] == null)
            {
                Response.Redirect("~/Home.aspx");
            }
            txtID.Text = Session["ID2"].ToString();
            txtID.ReadOnly = true;
            conn = new SqlConnection(strConnString);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            SqlCommand cmd = new SqlCommand("select * from tb_Employee where EmployeeID = '" + Session["ID2"].ToString() + "'", conn);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                txtFullname.Text = sdr[1].ToString();
                txtAddress.Text = sdr[5].ToString();
                if (sdr[4].ToString() == "True")
                {
                    rblGender.SelectedIndex = 0;
                }
                else
                {
                    rblGender.SelectedIndex = 1;
                }
                ddlCity.SelectedValue = sdr[6].ToString();
                txtBirthDate.Text = sdr[7].ToString();
                txtPhone.Text = sdr[9].ToString();
                txtEmail.Text = sdr[13].ToString();
                ddlEduQual.SelectedValue = sdr[10].ToString();
                txtAchievements.Text = sdr[11].ToString();
            }
        }
        else
        {
            Response.Redirect("~/Home.aspx");
        }

    }

    private void BindData()
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            SqlDataAdapter sda;
            DataSet ds = new DataSet();
            if (conn.State != ConnectionState.Open)
                conn.Open();

            sda = new SqlDataAdapter("select * from tb_City", conn);
            sda.Fill(ds, "City");
            ddlCity.DataSource = ds.Tables["City"];
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "CityID";
            ddlCity.DataBind();

            sda = new SqlDataAdapter("select * from tb_EduQual", conn);
            sda.Fill(ds, "EduQual");
            ddlEduQual.DataSource = ds.Tables["EduQual"];
            ddlEduQual.DataTextField = "EduQual";
            ddlEduQual.DataValueField = "EduQualID";
            ddlEduQual.DataBind();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, this page can't load successfull, we will repair it soon !');", true);
        }
    }
    //khai bao ma hoa MD5
    public static string encryptMD5(string pass)
    {

        return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pass.Trim(), "SHA1");
    }

    protected void UpPass(string oldpass, string newpass, string comnewpass)
    {



        conn = new SqlConnection(strConnString);
        if (conn.State != ConnectionState.Open)
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
        }
        else
        {
            Response.Write("<script> alert(' Username or Password are not invalid ! ') </script>");

            txtNewpass.Text = "";
            txtComfirm.Text = "";
        }


    }
    protected void btChange_Click(object sender, EventArgs e)
    {
        if (check)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();

            SqlCommand cmd = new SqlCommand("update tb_Employee set Fullname=@Fullname, Gender=@Gender, Address=@Address,CityID=@CityID,BirthDate=@BirthDate,Phone=@Phone,EduQualID=@EduQualID,Achievements=@Achievements,Email=@Email where EmployeeID='" + Session["ID2"].ToString() + "'", conn);

            cmd.Parameters.AddWithValue("@EmployeeID", Session["ID2"].ToString());
            cmd.Parameters.AddWithValue("@Fullname", txtFullname.Text);
            if (rblGender.SelectedIndex == 0)
            {
                cmd.Parameters.AddWithValue("@Gender", "True");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Gender", "False");
            }
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@CityID", ddlCity.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@BirthDate", DateTime.Parse(txtBirthDate.Text.ToString()));
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@EduQualID", ddlEduQual.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Achievements", txtAchievements.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.ExecuteNonQuery();

        }
        else
        {
            string oldpass = txtOldpass.Text.ToString();
            string newpass = txtNewpass.Text;
            string comnewpass = txtComfirm.Text;
            UpPass(oldpass, newpass, comnewpass);
        }

    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        txtOldpass.Text = "";
        txtNewpass.Text = "";
        txtComfirm.Text = "";
        txtID.Text = "";
    }
    protected void ChangeInfor(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        check = true;
    }
    protected void ChangePass(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        check = false;
    }
}
