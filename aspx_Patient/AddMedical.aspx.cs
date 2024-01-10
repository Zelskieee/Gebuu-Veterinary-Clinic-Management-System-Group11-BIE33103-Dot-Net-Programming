using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Gebuu.aspx_Patient
{
    public partial class AddMedical : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string petownerID = Request.QueryString["petownerID"];
            txtBox_PetOwnerID.Text = petownerID;

            if (!IsPostBack)
            {
                string txtRow1 = "Add New Medical Record";
                string txtRow2 = "Inserting " + GetPetOwnerName(petownerID) +"'s New Medical Record's Details";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null || lblRow1 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }

                // Get the last record ID from the database
                int lastRecordID = GetLastRecordID();

                // Generate the new record ID by incrementing the last record ID
                int newRecordID = lastRecordID + 1;

                // Set the record ID to the TextBox control
                txtBox_RecordID.Text = newRecordID.ToString();

            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string recordID = txtBox_RecordID.Text;
            string petownerID = txtBox_PetOwnerID.Text;
            string vetID = ddl_VetID.Text;
            string recordDate = txtBox_RecordDate.Text;
            string recordTime = txtBox_RecordTime.Text;
            string recordReason = txtBox_RecordReason.Text;

            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    string query = "INSERT INTO MedicalRecord (Record_ID, Vet_ID, Record_Date, Record_Time, Record_Reason, PetOwner_ID) " +
               "VALUES (@Record_ID, @Vet_ID, @Record_Date, @Record_Time, @Record_Reason, (SELECT PetOwner_ID FROM PetOwner WHERE PetOwner_ID = @PetOwner_ID))";


                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Record_ID", recordID);
                        cmd.Parameters.AddWithValue("@PetOwner_ID", petownerID);
                        cmd.Parameters.AddWithValue("@Vet_ID", vetID);
                        cmd.Parameters.AddWithValue("@Record_Date", recordDate);
                        cmd.Parameters.AddWithValue("@Record_Time", recordTime);
                        cmd.Parameters.AddWithValue("@Record_Reason", recordReason);

                        cmd.ExecuteNonQuery();
                    }
                }
                // Redirect to SuccessInsertion.aspx after data is inserted
                Response.Redirect("PatientSuccessInsertion.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            Response.Redirect(Request.UrlReferrer.ToString());
        }

        private int GetLastRecordID()
        {
            int lastRecordID = 0;
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            // Connect to your database and retrieve the last record ID
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 Record_ID FROM MedicalRecord ORDER BY Record_ID DESC";
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    lastRecordID = Convert.ToInt32(result);
                }
            }

            return lastRecordID;
        }

        private string GetPetOwnerName(string petownerID)
        {
            string petownerName = string.Empty;
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            // Connect to your database and retrieve the last record ID

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT PetOwner_Name FROM PetOwner WHERE PetOwner_ID = @PetOwnerID;";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Assuming PetOwnerID is an integer; adjust SqlDbType and size accordingly
                    command.Parameters.AddWithValue("@PetOwnerID", petownerID);

                    connection.Open();

                    // Check if the connection is open before executing the command
                    if (connection.State == ConnectionState.Open)
                    {
                        object result = command.ExecuteScalar();

                        if (result != null && result != DBNull.Value)
                        {
                            petownerName = result.ToString();
                        }
                    }
                    else
                    {
                        // Handle the case where the connection could not be opened
                        Console.WriteLine("Connection could not be opened.");
                    }
                }
            }

            return petownerName;

        }
    }
}