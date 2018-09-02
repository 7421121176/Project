using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Add : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter sda;
    DataSet ds;
    SqlDataReader sdr;
    private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["ID"] != null)
        {
            loadCity();
            loadEduQual();
            loadTitle();
        }
        else
        {
            Response.Redirect("~/Home.aspx");
        }
    }

    public void loadCity()
    {
        if (!IsPostBack)
        {

            try
            {
                conn = new SqlConnection(strConnString);
                conn.Open();
                sda = new SqlDataAdapter("select * from tb_City ", conn);
                ds = new DataSet();
                sda.Fill(ds, "City");
                GVCity.DataSource = ds.Tables["City"];
                GVCity.DataBind();


                sda = new SqlDataAdapter("select * from tb_Region", conn);
                ds = new DataSet();
                sda.Fill(ds, "Region");
                DDLRegionID.DataSource = ds.Tables["Region"];
                DDLRegionID.DataTextField = "RegionDescription";
                DDLRegionID.DataValueField = "RegionID";
                DDLRegionID.DataBind();




            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }

    public void loadEduQual()
    {
        try
        {
            conn = new SqlConnection(strConnString);
            conn.Open();
            sda = new SqlDataAdapter("select * from tb_EduQual ", conn);
            ds = new DataSet();
            sda.Fill(ds, "EduQual");
            GVEduQual.DataSource = ds.Tables["EduQual"];
            GVEduQual.DataBind();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    public void loadTitle()
    {
        try
        {
            conn = new SqlConnection(strConnString);
            conn.Open();
            sda = new SqlDataAdapter("select * from tb_Title ", conn);
            ds = new DataSet();
            sda.Fill(ds, "Title");
            GVTitle.DataSource = ds.Tables["Title"];
            GVTitle.DataBind();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void btAddNew_Click(object sender, EventArgs e)
    {
        if (txtCityID.Text != "" && txtCity.Text != "")
        {

            cmd = new SqlCommand("insert into tb_City(RegionID,City) values ('" + DDLRegionID.SelectedValue + "','" + txtCity.Text + "')", conn);

            cmd.ExecuteNonQuery();

            loadCity();
            conn.Close();
        }
        else
            Response.Write("<alert>CityID or City are not valid!!</alert>");

        txtCityID.Text = "";
        txtCity.Text = "";
        loadCity();
    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        txtCityID.Text = "";
        txtCity.Text = "";
        loadCity();

    }
    protected void btUpdate_Click(object sender, EventArgs e)
    {
        if (txtCity.Text == "")
        {
            Response.Write("<script language='javascript'> alert('City is not empty ! ' ) </script>");
            loadCity();
        }
        else
        {
            cmd = new SqlCommand("update tb_City set City = @City,RegionID = @RegionID where CityID = '" + txtCityID.Text + "',RegionID = '" + DDLRegionID.SelectedValue + "'", conn);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@RegionID", DDLRegionID.SelectedValue);
            cmd.ExecuteNonQuery();
            Response.Write("<script language='javascript'> alert('Update successfully ! ' ) </script>");
            txtCityID.Text = "";
            txtCity.Text = "";
            loadCity();

        }
    }
    protected void GVCity_RowEditing(object sender, GridViewEditEventArgs e)
    {
        txtCityID.Enabled = false;
        txtCity.Text = GVCity.Rows[e.NewEditIndex].Cells[3].Text;
        txtCityID.Text = GVCity.Rows[e.NewEditIndex].Cells[1].Text;
        DDLRegionID.SelectedValue = GVCity.Rows[e.NewEditIndex].Cells[2].Text;
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text == "")
        {
            Response.Write("<script> alert(' Your need enter information! ') </script>");
        }
        else
        {
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM tb_City WHERE City  like'%" + txtSearch.Text + "%'", conn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "City");
            if (ds.Tables["City"].Rows.Count > 0)
            {
                GVCity.DataSource = ds.Tables["City"];
                GVCity.DataBind();
            }
            else
            {
                Response.Write("<script language='javascript'> alert('City not available ! ' ) </script>");
                loadCity();
                txtSearch.Text = "";
            }

            txtSearch.Text = "";
        }
    }
    protected void GVCity_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = int.Parse(GVCity.DataKeys[e.RowIndex].Value.ToString());
        cmd = new SqlCommand("delete from tb_City where CityID = '" + id + "'", conn);
        cmd.ExecuteNonQuery();
        Response.Write("<script> alert ('Delete successfully !') </script>");
        loadCity();
    }
    protected void btAddNew2_Click(object sender, EventArgs e)
    {
        if (txtEduQualID.Text != "" && txtEduQual.Text != "")
        {

            cmd = new SqlCommand("insert into tb_EduQual(EduQual) values ('" + txtEduQual.Text + "')", conn);

            cmd.ExecuteNonQuery();

            loadEduQual();
            txtEduQualID.Text = "";
            txtEduQual.Text = "";
            conn.Close();

        }
        else

            Response.Write("<script> alert ('EduqualID or Eduqual are not valid!!')</script>");
            txtEduQualID.Text = "";
            txtEduQual.Text = "";

            loadEduQual();
    }
    protected void btUpdate2_Click(object sender, EventArgs e)
    {
        if (txtEduQual.Text == "")
        {
            Response.Write("<script language='javascript'> alert('EduQual is not empty ! ' ) </script>");
            loadEduQual();
        }
        else
        {
            cmd = new SqlCommand("update tb_EduQual set EduQual = @EduQual where EduQualID = '" + txtEduQualID.Text + "'", conn);
            cmd.Parameters.AddWithValue("@EduQual", txtEduQual.Text);

            cmd.ExecuteNonQuery();
            Response.Write("<script language='javascript'> alert('Update successfully ! ' ) </script>");
            txtEduQualID.Text = "";
            txtEduQual.Text = "";
            loadEduQual();

        }
    }
    protected void btCancel2_Click(object sender, EventArgs e)
    {
        txtEduQualID.Text = "";
        txtEduQual.Text = "";
        loadEduQual();
    }
    protected void btSearch2_Click(object sender, EventArgs e)
    {
        if (txtSearch2.Text == "")
        {
            Response.Write("<script> alert(' Your need enter information! ') </script>");
        }
        else
        {
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM tb_EduQual WHERE EduQual  like'%" + txtSearch2.Text + "%'", conn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "EduQual");
            if (ds.Tables["EduQual"].Rows.Count > 0)
            {
                GVEduQual.DataSource = ds.Tables["EduQual"];
                GVEduQual.DataBind();
            }
            else
            {
                Response.Write("<script language='javascript'> alert('EduQual not available ! ' ) </script>");
                loadEduQual();
                txtSearch2.Text = "";
            }

            txtSearch2.Text = "";
        }
    }
    protected void GVEduQual_RowEditing(object sender, GridViewEditEventArgs e)
    {
        txtEduQualID.Enabled = false;
        txtEduQualID.Text = GVEduQual.Rows[e.NewEditIndex].Cells[1].Text;
        txtEduQual.Text = GVEduQual.Rows[e.NewEditIndex].Cells[2].Text;
    }
    protected void GVEduQual_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = int.Parse(GVEduQual.DataKeys[e.RowIndex].Value.ToString());
        cmd = new SqlCommand("delete from tb_EduQual where EduQualID = '" + id + "'", conn);
        cmd.ExecuteNonQuery();
        loadEduQual();

    }
    protected void btAddNew3_Click(object sender, EventArgs e)
    {
        if (txtTitleID.Text != "" && txtTitle.Text != "")
        {

            cmd = new SqlCommand("insert into tb_Title(Title) values ('" + txtTitle.Text + "')", conn);

            cmd.ExecuteNonQuery();

            loadTitle();
            txtTitleID.Text = "";
            txtTitle.Text = "";
            conn.Close();
        }
        else

            Response.Write("<alert>TitleID or Title are not valid!!</alert>");
        txtTitleID.Text = "";
        txtTitle.Text = "";

        loadTitle();
    }
    protected void btUpdate3_Click(object sender, EventArgs e)
    {
        if (txtTitle.Text == "")
        {
            Response.Write("<script language='javascript'> alert( 'Title is not empty ! ' ) </script>");
            loadTitle();
        }
        else
        {
            cmd = new SqlCommand("update tb_Title set Title = @Title where TitleID = '" + txtTitleID.Text + "'", conn);
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text);

            cmd.ExecuteNonQuery();
            Response.Write("<script language='javascript'> alert('Update successfully ! ' ) </script>");
            txtTitleID.Text = "";
            txtTitle.Text = "";
            loadTitle();

        }
    }
    protected void btCancel3_Click(object sender, EventArgs e)
    {
        txtTitleID.Text = "";
        txtTitle.Text = "";
        loadTitle();
    }
    protected void btSearch3_Click(object sender, EventArgs e)
    {
        if (txtSearch3.Text == "")
        {
            Response.Write("<script> alert(' Your need enter information! ') </script>");
        }
        else
        {
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM tb_Title WHERE Title  like'%" + txtSearch3.Text + "%'", conn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "Title");
            if (ds.Tables["Title"].Rows.Count > 0)
            {
                GVTitle.DataSource = ds.Tables["Title"];
                GVTitle.DataBind();
            }
            else
            {
                Response.Write("<script language='javascript'> alert('Title not available ! ' ) </script>");
                loadTitle();
                txtSearch3.Text = "";
            }

            txtSearch3.Text = "";
        }
    }
    protected void GVTitle_RowEditing(object sender, GridViewEditEventArgs e)
    {
        txtTitleID.Enabled = false;
        txtTitleID.Text = GVTitle.Rows[e.NewEditIndex].Cells[1].Text;
        txtTitle.Text = GVTitle.Rows[e.NewEditIndex].Cells[2].Text;
    }
    protected void GVTitle_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = int.Parse(GVTitle.DataKeys[e.RowIndex].Value.ToString());
        cmd = new SqlCommand("delete from tb_Title where TitleID = '" + id + "'", conn);
        cmd.ExecuteNonQuery();
        loadTitle();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    
    protected void GVCity_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        this.loadCity();
        GVCity.PageIndex = e.NewPageIndex;
        GVCity.DataBind();
    }
    protected void GVEduQual_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        this.loadEduQual();
        GVEduQual.PageIndex = e.NewPageIndex;
        GVEduQual.DataBind();
    }
    protected void GVTitle_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.loadTitle();
        GVTitle.PageIndex = e.NewPageIndex;
        GVTitle.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
}
