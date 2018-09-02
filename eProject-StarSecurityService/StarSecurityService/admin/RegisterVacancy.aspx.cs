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
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;


public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["vid"] != null)
        {
            if (Session["ID"] != null)
            {

                if (!Page.IsPostBack)
                {
                    BindEmpGrid();
                }
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }
        else
        {
            Response.Redirect("Vacancy.aspx");
        }
    }

    protected void BindEmpGrid()
    {
        SqlCommand cmd = new SqlCommand("select * from tb_RegisVacancies where VacancyID='"+Request.QueryString["vid"].ToString() + "'", con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        grEmp.DataSource = dt;
        grEmp.DataBind();
    }

    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        string empId = string.Empty;
        DataTable dt = new DataTable();
        try
        {
            foreach (GridViewRow row in grEmp.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("chkSelect");

                if (cb.Checked == true)
                {
                    if (cb != null && cb.Checked)
                    {
                        //get Current EMAIL_ID from the DataKey
                        empId = Convert.ToString(grEmp.DataKeys[row.RowIndex].Value);
                        SqlCommand cmd = new SqlCommand("select Email from tb_RegisVacancies where RegisID=" + empId + "", con);
                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        //Fill datatable with EMAIL_ID corresponding to Current EMP_ID
                        adp.Fill(dt);
                        //Get EMAIL_ID into variable
                        string emailId = dt.Rows[0]["Email"].ToString();
                        //write code to send mail
                        SendEmailUsingGmail(emailId);
                        dt.Clear();
                        dt.Dispose();
                    }
                }
            }
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Emails sent successfully');", true);
        }
        catch (Exception ex)
        {
            Response.Write("Error occured: " + ex.Message.ToString());
        }
        finally
        {
            empId = string.Empty;
        }
    }

    private void SendEmailUsingGmail(string toEmailAddress)
    {
        try
        {
            //Send an e-mail to the subscriber mailbox
            SmtpClient SmtpServer = new SmtpClient();
            SmtpServer.Credentials = new System.Net.NetworkCredential("aptechcanthostars3curity@gmail.com", "aptechcanthoproject");
            SmtpServer.Port = 587;
            SmtpServer.Host = "smtp.gmail.com";
            SmtpServer.EnableSsl = true;
            MailMessage mail = new MailMessage();

            mail.IsBodyHtml = true;

            string str = "<html>"
                       + "<P>Hello, Mr/Ms </P>"
                       + "<P>As a result of your application for the position of Star Company, I would like to invite you to attend an interview on 3 days later at our office.</P>"
                       + "<P>You will have an interview with the department manager. The interview will last about 45 minutes. Please bring three references as well as a copy of your identity card to the interview.</P>"
                       + "<P>If the date or time of the interview is inconvenient, please contact me by phone or email in order to arrange another appointment..</P>"
                       + "<P>We look forward to seeing you.</P>"
                       + "<P>Best regards,</P>"
                       + "<P>Star Security Company</P>"
                       + "</html>";

            mail.From = new MailAddress("aptechcanthostars3curity@gmail.com",
            "Star Security Company", System.Text.Encoding.UTF8);
            mail.To.Add(toEmailAddress);
            mail.Subject = "Invitation to Interview";
            mail.Body = str;
            mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            SmtpServer.Send(mail);
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Sending successful !');", true);
        }
        catch (Exception)
        {
            Response.Write("<script language='javascript'>alert('Oops!!! We so sorry, you can't send this reply. Please try again! If it can't send again, Please Wait. We will repair it soon!') </script>");
        }
    }

    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkAll =
           (CheckBox)grEmp.HeaderRow.FindControl("chkSelectAll");
        if (chkAll.Checked == true)
        {
            foreach (GridViewRow gvRow in grEmp.Rows)
            {
                CheckBox chkSel =
                     (CheckBox)gvRow.FindControl("chkSelect");
                chkSel.Checked = true;
            }
        }
        else
        {
            foreach (GridViewRow gvRow in grEmp.Rows)
            {
                CheckBox chkSel = (CheckBox)gvRow.FindControl("chkSelect");
                chkSel.Checked = false;
            }
        }
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        this.BindEmpGrid();
        grEmp.PageIndex = e.NewPageIndex;
        grEmp.DataBind();
    }
}
