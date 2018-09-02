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

            string strQuery = "select [EmployeeID],[Fullname],[Title],t.[TitleID],[Gender],[Address],[City],c.[CityID],[BirthDate],[HireDate],[Phone],[Email],[EduQual],e.[EduQualID],[Achievements],[Role],r.[RoleID] FROM tb_Employee e,tb_Title t, tb_City c, tb_EduQual ed,tb_Role r WHERE e.TitleID=t.TitleID and e.CityID=c.CityID and e.EduQualID=ed.EduQualID and e.RoleID=r.RoleID";
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


            sda = new SqlDataAdapter("select * from tb_Title", conn);
            sda.Fill(ds, "Title");
            ddlTitle.DataSource = ds.Tables["Title"];
            ddlTitle.DataTextField = "Title";
            ddlTitle.DataValueField = "TitleID";
            ddlTitle.DataBind();

            ddlTitle.BorderWidth = 1;
            ddlTitle.BorderColor = System.Drawing.Color.Black;

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

            sda = new SqlDataAdapter("select * from tb_Role", conn);
            sda.Fill(ds, "Role");
            ddlRole.DataSource = ds.Tables["Role"];
            ddlRole.DataTextField = "Role";
            ddlRole.DataValueField = "RoleID";
            ddlRole.DataBind();

            ddlRole.BorderWidth = 1;
            ddlRole.BorderColor = System.Drawing.Color.Black;
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
                HiddenField1.Value = row.Cells[0].Text;
                txtFullname.Text = row.Cells[1].Text;
                CheckBox chk = (CheckBox)row.Cells[3].Controls[0];
                if (chk.Checked)
                {
                    rblGender.SelectedIndex = 0;
                }
                else
                {
                    rblGender.SelectedIndex = 1;
                }
                txtAddress.Text = row.Cells[4].Text;
                txtBirthDate.Text = row.Cells[6].Text.ToString();
                txtPhone.Text = row.Cells[8].Text;
                txtEmail.Text = row.Cells[9].Text;
                txtAchievements.Text = row.Cells[11].Text;

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
            SqlConnection conn = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand("Select max(EmployeeID) from tb_Employee", conn);

            SqlDataReader sdr;
            if (conn.State != ConnectionState.Open)
                conn.Open();
            sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                string a = sdr[0].ToString();
                string numbers = string.Empty;
                foreach (char c in a)
                {
                    if (Char.IsNumber(c))
                    {
                        numbers += c;
                    }
                }
                int n = Int32.Parse(numbers);
                n += 1;
                HiddenField1.Value = "Star" + n.ToString();
            }
            else
            {
                HiddenField1.Value = "Star";
            }
            txtFullname.Text = string.Empty;
            ddlTitle.SelectedIndex = 0;
            rblGender.SelectedIndex = 0;
            txtAddress.Text = string.Empty;
            ddlCity.SelectedIndex = 0;
            txtBirthDate.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAchievements.Text = string.Empty;
            ddlRole.SelectedIndex = 0;
            popup.Show();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't add new employee right now, we will repair it soon !');", true);
        }
    }

    protected void Save(object sender, EventArgs e)
    {
        try
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AddUpdateEmployee";
                cmd.Parameters.AddWithValue("@EmployeeID", HiddenField1.Value);
                cmd.Parameters.AddWithValue("@Fullname", txtFullname.Text);
                cmd.Parameters.AddWithValue("@TitleID", ddlTitle.SelectedValue.ToString());
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
                cmd.Parameters.AddWithValue("@HireDate", DateTime.Parse(DateTime.Now.Date.ToString()));
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@EduQualID", ddlEduQual.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Achievements", txtAchievements.Text);
                cmd.Parameters.AddWithValue("@RoleID", ddlRole.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

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

    protected void Search(object sender, EventArgs e)
    {
        try
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SearchEmployee";
                cmd.Parameters.AddWithValue("@Fullname", txtSearch.Text);

                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't searching this information. Please try again! If it error again, Please Wait. We will repair it soon!');", true);
        }
    }

    protected void Delete(object sender, EventArgs e)
    {
        try
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                HiddenField1.Value = row.Cells[0].Text;
            }

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DeleteEmployee";
                cmd.Parameters.AddWithValue("@EmployeeID", HiddenField1.Value);

                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Delete Syccessfull !');", true);
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
                ddlTitle.SelectedValue = dt.Rows[int.Parse(e.CommandArgument.ToString())][3].ToString();
                ddlCity.SelectedValue = dt.Rows[int.Parse(e.CommandArgument.ToString())][7].ToString();
                ddlEduQual.SelectedValue = dt.Rows[int.Parse(e.CommandArgument.ToString())][12].ToString();
                ddlRole.SelectedValue = dt.Rows[int.Parse(e.CommandArgument.ToString())][15].ToString();
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't edit right now, we will repair it soon !');", true);
        }
    }
}
