using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Login_Form
{
    public partial class Login : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["connSmartMobile"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select rname from users u join roles r on u.rid=r.rid where username=@username and upassword=@upassword", con);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@upassword", txtPassword.Text);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if (dr["rname"].ToString() == "Admin")
                        {
                            con.Close();
                            Response.Redirect("AdminPage.aspx");
                        }
                        else if (dr["rname"].ToString() == "User")
                        {
                            con.Close();
                            Response.Redirect("Default.aspx");
                        }
                    }
                }
                else
                    lblMessage.Text = "Invalid Username and/or Password";
                con.Close();
            }
            catch (Exception e1)
            {
                lblMessage.Text = e1.Message;
            }
            
        }
    }
}
