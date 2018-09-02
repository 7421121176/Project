using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections;
using System.IO.Compression;  

public partial class _Default : System.Web.UI.Page 
{
    private String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                this.BindData();
            }
            this.BindData2();
            GridView1.ShowHeader = false;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, this page can't load successfull, we will repair it soon !');", true);
        }
    }

    DataTable dt;
    private void BindData2()
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            SqlDataAdapter sda;
            DataSet ds = new DataSet();

            string strQuery = "select [VacancyID], [Quantity],[ExprirationDate],[Description],[EduQual], e.[EduQualID], [Salary],[Title], t.[TitleID] FROM tb_Vacancies v, tb_EduQual e, tb_Title t WHERE v.EduQualID=e.EduQualID and v.TitleID=t.TitleID";
            SqlCommand cmd = new SqlCommand(strQuery);
            dt = GetData(cmd);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, this page can't load successfull, we will repair it soon !');", true);
        }
    }

    private void BindData()
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            SqlDataAdapter sda;
            DataSet ds = new DataSet();

            sda = new SqlDataAdapter("select * from tb_City", conn);
            sda.Fill(ds, "City");
            ddlCity.DataSource = ds.Tables["City"];
            ddlCity.DataTextField = "City";
            ddlCity.DataValueField = "CityID";
            ddlCity.DataBind();

            ddlCity.BorderWidth = 1;
            ddlCity.BorderColor = System.Drawing.Color.Black;

            sda = new SqlDataAdapter("select * from tb_EduQual", conn);
            sda.Fill(ds, "EduQual");
            ddlEduQual.DataSource = ds.Tables["EduQual"];
            ddlEduQual.DataTextField = "EduQual";
            ddlEduQual.DataValueField = "EduQualID";
            ddlEduQual.DataBind();

            ddlEduQual.BorderWidth = 1;
            ddlEduQual.BorderColor = System.Drawing.Color.Black;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, this page can't load successfull, we will repair it soon !');", true);
        }
    }

    private DataTable GetData(SqlCommand cmd)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(strConnString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = conn;
                conn.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                return dt;
            }
        }
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        this.BindData();
        this.BindData2();
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }

    protected void Edit(object sender, EventArgs e)
    {
        try
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                txtVacancyID.Value = row.Cells[0].Text;
            }
            txtFullname.Text = string.Empty;
            rblGender.SelectedIndex = 0;
            txtAddress.Text = string.Empty;
            ddlCity.SelectedIndex = 0;
            txtBirthDate.Text = string.Empty;
            txtPhone.Text = string.Empty;
            ddlEduQual.SelectedIndex = 0;
            txtAchievements.Text = string.Empty;
            txtEmail.Text = string.Empty;
            popup.Show();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't regist right now, we will repair it soon !');", true);
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "sua")
            {
                txtTitleID.Value = dt.Rows[int.Parse(e.CommandArgument.ToString())][8].ToString();
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't regist right now, we will repair it soon !');", true);
        }
    }
    protected void Save(object sender, ImageClickEventArgs e)
    {
        try
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AddRegisVacancies";
                cmd.Parameters.AddWithValue("@VacancyID", txtVacancyID.Value);
                cmd.Parameters.AddWithValue("@Fullname", txtFullname.Text);
                cmd.Parameters.AddWithValue("@TitleID", txtTitleID.Value);
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

                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Regist Successful ! Please wail until we send mail interview to you!');", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't regist right now, we will repair it soon !');", true);
        }
    }
}
