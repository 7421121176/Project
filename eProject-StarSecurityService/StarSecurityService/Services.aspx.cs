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

            string strQuery = "select ServiceID, ServiceName, Information, Price, PhotoPath from tb_Service where FunctionID='" + DropDownList1.SelectedValue.ToString() + "'";
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
            DropDownList1.DataSource = ds.Tables["Function"];
            DropDownList1.DataTextField = "FunctionName";
            DropDownList1.DataValueField = "FunctionID";
            DropDownList1.DataBind();
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
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}
