using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace Gebuu
{
    public partial class CreatePatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string txtRow1 = "Add New Pet Owner";
                string txtRow2 = "Insert Pet Owner's Details";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null || lblRow1 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }

                // Get the last PetOwner ID from the database
                int lastPetOwnerID = GetLastPetOwnerID();

                // Generate the new PetOwner ID by incrementing the last pet owner ID
                int newPetOwnerID = lastPetOwnerID + 1;

                // Set the PetOwner ID to the TextBox control
                txtBox_PetOwnerID.Text = newPetOwnerID.ToString();
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string petownerID = txtBox_PetOwnerID.Text;
            string petownerName = txtBox_PetOwnerName.Text;
            string petownerGender = ddl_PetOwnerGender.SelectedValue;
            string petownerAddress = txtBox_PetOwnerAddress.Text;
            string petownerPhoneNo = txtBox_PetOwnerPhoneNo.Text;
            string petownerEmergencyContact = txtBox_PetOwnerEmergencyContact.Text;

            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    string query = "INSERT INTO PetOwner (PetOwner_ID, PetOwner_Name, PetOwner_Gender, PetOwner_Address, PetOwner_PhoneNo, PetOwner_EmergencyContact) " +
                                   "VALUES (@PetOwner_ID, @PetOwner_Name, @PetOwner_Gender, @PetOwner_Address, @PetOwner_PhoneNo, @PetOwner_EmergencyContact)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PetOwner_ID", petownerID);
                        cmd.Parameters.AddWithValue("@PetOwner_Name", petownerName);
                        cmd.Parameters.AddWithValue("@PetOwner_Gender", petownerGender);
                        cmd.Parameters.AddWithValue("@PetOwner_Address", petownerAddress);
                        cmd.Parameters.AddWithValue("@PetOwner_PhoneNo", petownerPhoneNo);
                        cmd.Parameters.AddWithValue("@PetOwner_EmergencyContact", petownerEmergencyContact);

                        cmd.ExecuteNonQuery();
                    }
                }

                Button button = (Button)sender;
                string petownerId = button.CommandArgument;
                Response.Redirect($"AddMedical.aspx?petownerID={petownerID}");

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        private int GetLastPetOwnerID()
        {
            int lastPetOwnerID = 0;
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            // Connect to your database and retrieve the last PetOwner ID
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 PetOwner_ID FROM PetOwner ORDER BY PetOwner_ID DESC";
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    lastPetOwnerID = Convert.ToInt32(result);
                }
            }

            return lastPetOwnerID;
        }
    }
}