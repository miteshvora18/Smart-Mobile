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

namespace Login_Form
{
    public partial class ProductListing : System.Web.UI.Page
    {
        public string Id
        {
            get 
            {
                if (Request.QueryString["Id"] == null)
                    return "0";
                else
                    return Request.QueryString["Id"];
            }
        }

        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["connSmartMobile"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Id == "1")
            {
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select cname from company", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Label lblName = new Label();
                        lblName.ID = dr["cname"].ToString();
                        lblName.Text = dr["cname"].ToString();
                        pnllbl.Controls.Add(lblName);
                    }
                }
            }

        }
    }
}
