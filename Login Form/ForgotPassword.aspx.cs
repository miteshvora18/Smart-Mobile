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
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace Login_Form
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["connSmartMobile"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblSuccessMsg.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select username,upassword,uname from users where uemail=@uemail", con);
                cmd.Parameters.AddWithValue("@uemail", txtEmail.Text);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Send Mail
                        MailMessage mail = new MailMessage();
                        mail.From = new MailAddress("miteshvora18@gmail.com", "Admin,All in One Mobile Store");
                        //mail.To.Add("mitesh.vora@webaccess.co.in");

                        mail.To.Add(txtEmail.Text); //Actual Email Id to be sent
                        mail.Subject = "Login Details";
                        mail.Body = "Hello " + dr["uname"] + ",\n\nThis is a system generated message from All in One Mobile Store.\n\n Kindly find the login details below:\n\nUsername:" + dr["username"] + "\nPassword:" + dr["upassword"] + "\n\nThank You,\nAdmin, All in One Mobile Store";

                        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                        smtp.EnableSsl = true;
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                        smtp.Credentials = new NetworkCredential("miteshvora18@gmail.com", "mahavir18");
                        smtp.Timeout = 20000;
                        //ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
                        smtp.Send(mail);

                        lblSuccessMsg.Text = "Email has been sent with your credentials!!!";
                        txtEmail.Text = "";
                    }
                }
                else
                    lblMessage.Text = "Email Id does not exist.. Try Again";
                con.Close();
            }
            catch (Exception e1)
            {
                lblMessage.Text = e1.Message;
            }
        }
    }
}
