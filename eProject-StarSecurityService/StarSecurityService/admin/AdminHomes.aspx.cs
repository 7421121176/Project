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

public partial class Default2 : System.Web.UI.Page
{
    private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {
                    load();
                }
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, this page can't load successfull, we will repair it soon !');", true);
        }
    }

    private void load()
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            SqlDataAdapter sda = new SqlDataAdapter("select * from tb_Region", conn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "Region");

            //Western
            lbWestern.Text = ds.Tables[0].Rows[1].ItemArray[1].ToString();
            lbWestern2.Text = ds.Tables[0].Rows[1].ItemArray[2].ToString();
            lbWestern3.Text = ds.Tables[0].Rows[1].ItemArray[3].ToString();
            lbWestern4.Text = ds.Tables[0].Rows[1].ItemArray[4].ToString();

            //Southern
            lbSouthern.Text = ds.Tables[0].Rows[2].ItemArray[1].ToString();
            lbSouthern2.Text = ds.Tables[0].Rows[2].ItemArray[2].ToString();
            lbSouthern3.Text = ds.Tables[0].Rows[2].ItemArray[3].ToString();
            lbSouthern4.Text = ds.Tables[0].Rows[2].ItemArray[4].ToString();

            //Northern
            lbNorthern.Text = ds.Tables[0].Rows[3].ItemArray[1].ToString();
            lbNorthern2.Text = ds.Tables[0].Rows[3].ItemArray[2].ToString();
            lbNorthern3.Text = ds.Tables[0].Rows[3].ItemArray[3].ToString();
            lbNorthern4.Text = ds.Tables[0].Rows[3].ItemArray[4].ToString();

            //Eastern

            lbEastern.Text = ds.Tables[0].Rows[0].ItemArray[1].ToString();
            lbEastern2.Text = ds.Tables[0].Rows[0].ItemArray[2].ToString();
            lbEastern3.Text = ds.Tables[0].Rows[0].ItemArray[3].ToString();
            lbEastern4.Text = ds.Tables[0].Rows[0].ItemArray[4].ToString();


            DropDownList1.DataSource = ds.Tables["Region"];
            DropDownList1.DataTextField = "RegionDescription";
            DropDownList1.DataValueField = "RegionID";
            DropDownList1.DataBind();

            SqlCommand cmd = new SqlCommand("select * from tb_Region where RegionID = '" + DropDownList1.SelectedValue.ToString() + "'", conn);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                txtAddress.Text = sdr[2].ToString();
                txtDetail.Text = sdr[3].ToString();
                txtPerson.Text = sdr[4].ToString();
            }

            conn.Close();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, this page can't load successfull, we will repair it soon !');", true);
        }
    }

    protected void btnEdit_Click(object sender, ImageClickEventArgs e)
    {
        MultiView1.ActiveViewIndex++;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tb_Region where RegionID = '" + DropDownList1.SelectedValue.ToString() + "'", conn);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                txtAddress.Text = sdr[2].ToString();
                txtDetail.Text = sdr[3].ToString();
                txtPerson.Text = sdr[4].ToString();
            }

            conn.Close();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, this page can't load successfull, we will repair it soon !');", true);
        }
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand("UpdateRegion", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RegionID", DropDownList1.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Details", txtDetail.Text);
            cmd.Parameters.AddWithValue("@Person", txtPerson.Text);

            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.ExecuteNonQuery();

            conn.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Save Successfull !');", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, we can't save this information, we will repair it soon !');", true);
        }
    }

    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            MultiView1.ActiveViewIndex--;
            load();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, this page can't load successfull, we will repair it soon !');", true);
        }

    }
}
