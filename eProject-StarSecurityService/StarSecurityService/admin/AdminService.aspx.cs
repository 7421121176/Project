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
    bool check;

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

            string strQuery = "select [ServiceID],[FunctionName],f.[FunctionID],[ServiceName],[Information],[Price],[PhotoPath] FROM tb_Service s, tb_Function f WHERE s.FunctionID=f.FunctionID";
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

            sda = new SqlDataAdapter("select * from tb_Function", conn);
            sda.Fill(ds, "Function");
            ddlFunction.DataSource = ds.Tables["Function"];
            ddlFunction.DataTextField = "FunctionName";
            ddlFunction.DataValueField = "FunctionID";
            ddlFunction.DataBind();

            ddlFunction.BorderWidth = 1;
            ddlFunction.BorderColor = System.Drawing.Color.Black;
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
                check = false;
                HiddenField1.Value = row.Cells[0].Text;
                txtServiceName.Text = row.Cells[2].Text;
                txtInformation.Text = row.Cells[3].Text;
                txtPrice.Text = Convert.ToDecimal(row.Cells[4].Text).ToString("#0.00");
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
            check = true;
            HiddenField1.Value = string.Empty;
            ddlFunction.SelectedIndex = 0;
            txtServiceName.Text = string.Empty;
            txtInformation.Text = string.Empty;
            txtPrice.Text = string.Empty;
            HiddenField2.Value = string.Empty;
            popup.Show();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't add new service right now, we will repair it soon !');", true);
        }
    }

    protected void Save(object sender, EventArgs e)
    {
        try
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                if (check)
                {
                    string filename = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~\\images\\Service\\" + filename.Trim()));
                    HiddenField2.Value = "~\\images\\Service\\" + filename.Trim();
                }
                else
                {
                    if (HiddenField2.Value != null && FileUpload1.HasFile)
                    {
                        string filename = FileUpload1.FileName;
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~\\images\\Service\\" + filename.Trim()));
                        HiddenField2.Value = "~\\images\\Service\\" + filename.Trim();
                    }
                }
                   

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AddUpdateService";
                cmd.Parameters.AddWithValue("@ServiceID", HiddenField1.Value);
                cmd.Parameters.AddWithValue("@FunctionID", ddlFunction.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@ServiceName", txtServiceName.Text);
                cmd.Parameters.AddWithValue("@Information", txtInformation.Text);
                double price = double.Parse(txtPrice.Text);
                cmd.Parameters.AddWithValue("@Price", price.ToString());

                cmd.Parameters.Add("@PhotoPath", HiddenField2.Value);


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
                HiddenField1.Value = row.Cells[0].Text;
            }

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DeleteService";
                cmd.Parameters.AddWithValue("@ServiceID", HiddenField1.Value);

                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
            }
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
                cmd.CommandText = "SearchService";
                cmd.Parameters.AddWithValue("@ServiceName", txtSearch.Text);

                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't searching this information. Please try again! If it error again, Please Wait. We will repair it soon!');", true);
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "sua")
            {
                ddlFunction.SelectedValue = dt.Rows[int.Parse(e.CommandArgument.ToString())][2].ToString();
                HiddenField2.Value = dt.Rows[int.Parse(e.CommandArgument.ToString())][6].ToString();
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't edit right now, we will repair it soon !');", true);
        }
    }
}
