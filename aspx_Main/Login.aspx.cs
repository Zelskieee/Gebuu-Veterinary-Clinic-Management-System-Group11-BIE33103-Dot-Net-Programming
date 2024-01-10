using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Gebuu
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM Login WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    // Username and password match found
                    // Perform the desired action, such as redirecting to another page
                    Session["Username"] = username;
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    // Username and password do not match
                    // Display an error message
                    lblStatus.Text = "Invalid username or password";
                }
            }
        }
    }
}