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
                if (Request.QueryString["oid"] == null)
                {
                    Response.Redirect("AdminOrder.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        this.BindData();
                    }
                    this.BindData2();
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

    DataTable dt;
    private void BindData2()
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            SqlDataAdapter sda;
            DataSet ds = new DataSet();

            string strQuery = "select [OrderDetailID],[OrderID],[ServiceName],s.[ServiceID],[Quantity],[Total],[StartDate],[ExpirationDate] FROM tb_OrderDetail o, tb_Service s WHERE o.ServiceID=s.ServiceID and OrderID = '" + Request.QueryString["oid"] + "'";
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

            sda = new SqlDataAdapter("select * from tb_Service", conn);
            sda.Fill(ds, "Service");
            ddlService.DataSource = ds.Tables["Service"];
            ddlService.DataTextField = "ServiceName";
            ddlService.DataValueField = "ServiceID";
            ddlService.DataBind();

            ddlService.BorderWidth = 1;
            ddlService.BorderColor = System.Drawing.Color.Black;
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
                HiddenField1.Value = row.Cells[0].Text;
                ddlService.Enabled = false;
                txtQuantity.Text = row.Cells[2].Text;
                txtQuantity.ReadOnly = true;
                txtTimeOrder.Text = row.Cells[4].Text;
                DateTime dt1 = DateTime.Parse(row.Cells[4].Text);
                DateTime dt2 = DateTime.Parse(row.Cells[5].Text);
                int day = dt2.Subtract(dt1).Days;
                int month = day / 30;
                txtTime.Text = month.ToString();
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
            HiddenField1.Value = string.Empty;
            ddlService.Enabled = true;
            txtQuantity.ReadOnly = false;
            txtTime.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            ddlService.SelectedIndex = 0;
            txtTimeOrder.Text = string.Empty;
            popup.Show();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't add new order right now, we will repair it soon !');", true);
        }
    }

    protected void Save(object sender, EventArgs e)
    {
        try
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AddUpdateOderDetails";
                cmd.Parameters.AddWithValue("@OrderDetailID", HiddenField1.Value);
                cmd.Parameters.AddWithValue("@OrderID", Request.QueryString["oid"]);
                cmd.Parameters.AddWithValue("@ServiceID", ddlService.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
                cmd.Parameters.AddWithValue("@StartDate", DateTime.Parse(txtTimeOrder.Text));
                cmd.Parameters.AddWithValue("@ExpirationDate", DateTime.Parse(txtTimeOrder.Text).AddMonths(Int32.Parse(txtTime.Text)));

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
                cmd.CommandText = "DeleteOderDetails";
                cmd.Parameters.AddWithValue("@OrderDetailID", HiddenField1.Value);
                cmd.Parameters.AddWithValue("@OrderID", Request.QueryString["oid"]);

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
                ddlService.SelectedValue = dt.Rows[int.Parse(e.CommandArgument.ToString())][3].ToString();
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't edit right now, we will repair it soon !');", true);
        }
    }

    protected void Back(object sender, EventArgs e)
    {
        Response.Redirect("AdminOrder.aspx");
    }
}
