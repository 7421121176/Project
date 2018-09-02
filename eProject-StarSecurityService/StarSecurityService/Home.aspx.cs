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
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Session["ID"] != null)
        {
            Response.Redirect("~/admin/AdminHomes.aspx");
        }

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from tb_Region", conn);
            DataSet ds = new DataSet(); sda.Fill(ds, "tb_Region");

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
            lbNorthern.Text = ds.Tables[0].Rows[0].ItemArray[1].ToString();
            lbNorthern2.Text = ds.Tables[0].Rows[0].ItemArray[2].ToString();
            lbNorthern3.Text = ds.Tables[0].Rows[0].ItemArray[3].ToString();
            lbNorthern4.Text = ds.Tables[0].Rows[0].ItemArray[4].ToString();

            //Eastern

            lbEastern.Text = ds.Tables[0].Rows[3].ItemArray[1].ToString();
            lbEastern2.Text = ds.Tables[0].Rows[3].ItemArray[2].ToString();
            lbEastern3.Text = ds.Tables[0].Rows[3].ItemArray[3].ToString();
            lbEastern4.Text = ds.Tables[0].Rows[3].ItemArray[4].ToString();
        
        

    }
    
}
