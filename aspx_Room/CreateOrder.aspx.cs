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
    public partial class CreateOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string txtRow1 = "Create New Order";
                string txtRow2 = "Add The Pet Owner To Queue";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null || lblRow1 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }
                // Generate the OrderID as 1 plus the highest value in the database
                string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    string query = "SELECT ISNULL(MAX(Order_ID), 0) + 1 AS NextOrderID FROM [Order]";

                    SqlCommand command = new SqlCommand(query, con);
                    int nextOrderID = (int)command.ExecuteScalar();

                    txtBox_OrderID.Text = nextOrderID.ToString();
                }
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string orderID = txtBox_OrderID.Text;
            string petownerID = txtBox_PetOwnerID.Text;

            // Insert the order into the database
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string findPetOwnerIDQuery = "SELECT COUNT(*) FROM PetOwner WHERE PetOwner_ID = @PetOwnerID";
                SqlCommand command = new SqlCommand(findPetOwnerIDQuery, con);
                command.Parameters.AddWithValue("@PetOwnerID", petownerID);
                int count = (int)command.ExecuteScalar();

                if (count != 0)
                {
                    string insertQuery = "INSERT INTO [Order] (Order_ID, PetOwner_ID) VALUES (@OrderID, @PetOwnerID)";

                    command = new SqlCommand(insertQuery, con);
                    command.Parameters.AddWithValue("@OrderID", orderID);
                    command.Parameters.AddWithValue("@PetOwnerID", petownerID);
                    command.ExecuteNonQuery();
                    Response.Redirect("TableRoom.aspx");
                }

                else
                {
                    lblErrorMessage.Text = "Pet Owner ID not found.";
                    lblErrorMessage.Visible = true;
                }
            }
        }
    }
}
