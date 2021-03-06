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
using System.Web.Configuration;
using System.Security.Cryptography;
using System.Net.Mail;

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

    private void BindData()
    {
        SqlConnection conn = new SqlConnection(strConnString);
        DataSet ds = new DataSet();

        string strQuery = "select * from tb_Contact order by Status asc";
        SqlCommand cmd = new SqlCommand(strQuery);
        GridView1.DataSource = GetData(cmd);
        GridView1.DataBind();
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
                txtContactID.Value = row.Cells[0].Text;
                txtEmail.Value = row.Cells[2].Text;
            }
            txtTitle.Text = string.Empty;
            txtReply.Text = string.Empty;
            popup.Show();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't edit right now, we will repair it soon !');", true);
        }
    }

    protected void Send(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand("AddUpdateContact", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ContactID", txtContactID.Value);
            cmd.Parameters.AddWithValue("@Fullname", string.Empty);
            cmd.Parameters.AddWithValue("@Email", string.Empty);
            cmd.Parameters.AddWithValue("@Time", DateTime.Parse(DateTime.Now.ToString()));
            cmd.Parameters.AddWithValue("@Comment", string.Empty);

            if (conn.State != ConnectionState.Open)
                conn.Open();

            //Send an e-mail to the subscriber mailbox
            SmtpClient SmtpServer = new SmtpClient();
            SmtpServer.Credentials = new System.Net.NetworkCredential("aptechcanthostars3curity@gmail.com", "aptechcanthoproject");
            SmtpServer.Port = 587;
            SmtpServer.Host = "smtp.gmail.com";
            SmtpServer.EnableSsl = true;
            MailMessage mail = new MailMessage();

            mail.IsBodyHtml = true;

            string str = "<html>"
                       + "<P>Hello, </P>"
                       + "<P>" + txtReply.Text.ToString() + "</P>"
                       + "</html>";

            mail.From = new MailAddress("aptechcanthostars3curity@gmail.com",
            "Star Security Company", System.Text.Encoding.UTF8);
            mail.To.Add(txtEmail.Value);
            mail.Subject = "Re: " + txtTitle.Text;
            mail.Body = str;
            mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            SmtpServer.Send(mail);
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Sending successful !');", true);


            
            cmd.ExecuteNonQuery();

            GridView1.DataSource = this.GetData(cmd);
            GridView1.DataBind();
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Oops!!! We so sorry, you can't send this reply. Please try again! If it can't send again, Please Wait. We will repair it soon!!');", true);        
        }
    }

}
