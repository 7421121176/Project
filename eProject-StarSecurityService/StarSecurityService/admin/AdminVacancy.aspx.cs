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
using System.IO;
using System.IO.Compression;  

public partial class _Default : System.Web.UI.Page 
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
                    this.BindData();
                }
                this.BindData2();
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

            sda = new SqlDataAdapter("select * from tb_EduQual", conn);
            sda.Fill(ds, "EduQual");
            ddlEduQual.DataSource = ds.Tables["EduQual"];
            ddlEduQual.DataTextField = "EduQual";
            ddlEduQual.DataValueField = "EduQualID";
            ddlEduQual.DataBind();

            ddlEduQual.BorderWidth = 1;
            ddlEduQual.BorderColor = System.Drawing.Color.Black;

            sda = new SqlDataAdapter("select * from tb_Title", conn);
            sda.Fill(ds, "Title");
            ddlTitle.DataSource = ds.Tables["Title"];
            ddlTitle.DataTextField = "Title";
            ddlTitle.DataValueField = "TitleID";
            ddlTitle.DataBind();

            ddlTitle.BorderWidth = 1;
            ddlTitle.BorderColor = System.Drawing.Color.Black;
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
                txtQuantity.Text = row.Cells[1].Text;
                DateTime dt1 = DateTime.Now;
                DateTime dt2 = DateTime.Parse(row.Cells[2].Text);
                int day = dt2.Subtract(dt1).Days;
                int month = 0;
                if (day > 0)
                {
                    if (day / 30 > 0)
                    {
                        month = day / 30;
                    }
                    else
                    {
                        month = 1;
                    }
                }
                txtExprirationDate.Text = month.ToString();
                txtDescription.Text = row.Cells[3].Text;
                txtSalary.Text = Convert.ToDecimal(row.Cells[5].Text).ToString("#0.00");
                popup.Show();
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't edit right now, we will repair it soon !');", true);
        }
    }

    protected void Add(object sender, EventArgs e)
    {
        try
        {
            txtVacancyID.Value = string.Empty;
            txtQuantity.Text = string.Empty;
            txtExprirationDate.Text = string.Empty;
            txtDescription.Text = string.Empty;
            ddlEduQual.SelectedIndex = 0;
            txtSalary.Text = string.Empty;
            ddlTitle.SelectedIndex = 0;
            popup.Show();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't add new vacancy right now, we will repair it soon !');", true);
        }
    }

    protected void Save(object sender, EventArgs e)
    {
        try
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AddUpdateVacancies";
                cmd.Parameters.AddWithValue("@VacancyID", txtVacancyID.Value);
                cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
                cmd.Parameters.AddWithValue("@ExprirationDate", DateTime.Now.AddMonths(Int32.Parse(txtExprirationDate.Text)));
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@EduQualID", ddlEduQual.SelectedValue.ToString());
                double salary = double.Parse(txtSalary.Text);
                cmd.Parameters.AddWithValue("@Salary", salary.ToString());
                cmd.Parameters.AddWithValue("@TitleID", ddlTitle.SelectedValue.ToString());

                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Save Successfull !');", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, we can't save this information, we will repair it soon !');", true);
        }
    }

    protected void Delete(object sender, EventArgs e)
    {
        try
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                txtVacancyID.Value = row.Cells[0].Text;
            }

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DeleteVacancies";
                cmd.Parameters.AddWithValue("@VacancyID", txtVacancyID.Value);

                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't delete this record. Please try the other!');", true);
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "sua")
            {
                ddlEduQual.SelectedValue = dt.Rows[int.Parse(e.CommandArgument.ToString())][5].ToString();
                ddlTitle.SelectedValue = dt.Rows[int.Parse(e.CommandArgument.ToString())][8].ToString();
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't edit right now, we will repair it soon !');", true);
        }
    }

    protected void ddlVacancyID_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void View(object sender, EventArgs e)
    {
        try
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                txtVacancyID.Value = row.Cells[0].Text;
            }
            Response.Redirect("RegisterVacancy.aspx?vid=" + txtVacancyID.Value);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't view this right now, we will repair it soon !');", true);
        }
    }
}
