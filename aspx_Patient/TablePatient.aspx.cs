using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Gebuu
{
    public partial class Patient1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string txtRow1 = "Pet Owner";
                string txtRow2 = "You Have " + GetPetOwnerCount() + " Pet Owners In Total";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null || lblRow1 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }
                BindPetOwnerData();
                if (Request.QueryString["petownerID"] != null)
                {
                    string petownerID = Request.QueryString["petownerID"];
                    LoadMedicalRecord(petownerID);
                }
            
        }
    }

        private void LoadMedicalRecord(string petownerID)
        {
            Response.Redirect("TableMedicalRecord.aspx?petownerID=" + petownerID);
        }

        private int GetPetOwnerCount()
        {
            int PetOwnerCount = 0;

            // Assuming you have a database table named 'PetOwner' with a column 'PetOwnerDate' to store the PetOwner date

            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Open the database connection
                connection.Open();

                // Create a SQL command to execute the query
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM PetOwner", connection))
                {
                    // Execute the query and retrieve the count
                    PetOwnerCount = (int)command.ExecuteScalar();
                }

                // Close the database connection
                connection.Close();
            }
            return PetOwnerCount;
        }
        private void BindPetOwnerData()
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT PetOwner_ID, PetOwner_Name, PetOwner_Gender, PetOwner_Address, PetOwner_PhoneNo, PetOwner_EmergencyContact FROM PetOwner ORDER BY PetOwner_ID ASC";

                SqlCommand command = new SqlCommand(query, con);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int petownerID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            DeletePetOwner(petownerID);
            BindPetOwnerData();
        }

        private void DeletePetOwner(int petownerID)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Delete related records in Order table
                string deleteOrderQuery = "DELETE FROM [Order] WHERE PetOwner_ID = @PetOwnerID";
                SqlCommand deleteOrderCommand = new SqlCommand(deleteOrderQuery, con);
                deleteOrderCommand.Parameters.AddWithValue("@PetOwnerID", petownerID);
                deleteOrderCommand.ExecuteNonQuery();

                string deleteRecordsQuery = "DELETE FROM MedicalRecord WHERE PetOwner_ID = @PetOwnerID";
                SqlCommand deleteRecordsCommand = new SqlCommand(deleteRecordsQuery, con);
                deleteRecordsCommand.Parameters.AddWithValue("@PetOwnerID", petownerID);
                deleteRecordsCommand.ExecuteNonQuery();

                string deletePetOwnerQuery = "DELETE FROM PetOwner WHERE PetOwner_ID = @PetOwnerID";
                SqlCommand deletePetOwnerCommand = new SqlCommand(deletePetOwnerQuery, con);
                deletePetOwnerCommand.Parameters.AddWithValue("@PetOwnerID", petownerID);
                deletePetOwnerCommand.ExecuteNonQuery();
            }
        }

        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            // Get the petowner_ID from the command argument
            LinkButton lnkUpdate = (LinkButton)sender;
            string petownerID = lnkUpdate.CommandArgument;

            // Redirect to the ModifyPatient.aspx page with the PetOwner ID
            Response.Redirect("ModifyPatient.aspx?petownerID=" + petownerID);
        }

        protected void lnkView_Click(object sender, EventArgs e)
        {
            LinkButton lnkView = (LinkButton)sender;
            string petownerID = lnkView.CommandArgument;

            // Perform any desired actions when the "View" button is clicked
            // For example, you can redirect to a details page for the selected medicine ID

            Response.Redirect("TableMedicalRecord.aspx?petownerID=" + petownerID);
        }


    }
}