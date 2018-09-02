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

public partial class Companyt : System.Web.UI.Page
{
    private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
                txtChairman.Visible = false;
                txtDirectors.Visible = false;
                btnSave.Visible = false;
                btnCancel.Visible = false;


                SqlConnection conn = new SqlConnection(strConnString);
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand cmd = new SqlCommand("select * from tb_About", conn);
                SqlDataReader sdr = cmd.ExecuteReader();

                if (sdr.Read())
                {
                    lblChairman.Text = sdr[0].ToString();
                    lblDirectors.Text = sdr[1].ToString();
                }

                conn.Close();
            
            
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, This page can't load successfull, we will repair it soon !');", true);
        }
    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            txtChairman.Visible = false;
            txtDirectors.Visible = false;
            btnSave.Visible = false;
            btnCancel.Visible = false;

            lblDirectors.Visible = true;
            lblChairman.Visible = true;
            btnEdit.Visible = true;

            SqlConnection conn = new SqlConnection(strConnString);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "update tb_About set Chairman=@Chairman, Directors=@Directors";
            cmd.Parameters.AddWithValue("@Chairman", txtChairman.Text.ToString());
            cmd.Parameters.AddWithValue("@Directors", txtDirectors.Text.ToString());
            cmd.ExecuteNonQuery();

            conn.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Edit Successfull !');", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, we can't save this information, we will repair it soon !');", true);
        }
    }

    protected void btnEdit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            lblChairman.Visible = false;
            lblDirectors.Visible = false;
            btnEdit.Visible = false;

            txtChairman.Visible = true;
            txtDirectors.Visible = true;
            btnCancel.Visible = true;
            btnSave.Visible = true;

            SqlConnection conn = new SqlConnection(strConnString);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tb_About", conn);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                txtChairman.Text = sdr[0].ToString();
                txtDirectors.Text = sdr[1].ToString();
            }

            conn.Close();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't edit right now, we will repair it soon !');", true);
        }
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            txtChairman.Visible = false;
            txtDirectors.Visible = false;
            btnSave.Visible = false;
            btnCancel.Visible = false;

            lblDirectors.Visible = true;
            lblChairman.Visible = true;
            btnEdit.Visible = true;

            SqlConnection conn = new SqlConnection(strConnString);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tb_About", conn);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                txtChairman.Text = sdr[0].ToString();
                txtDirectors.Text = sdr[1].ToString();
            }

            conn.Close();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, this page can't load successfull, we will repair it soon !');", true);
        }
    }
}
