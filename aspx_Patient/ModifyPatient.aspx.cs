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
    public partial class ModifyPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["petownerID"] != null)
                {
                    string petownerID = Request.QueryString["petownerID"];
                    string txtRow1 = "Add New Pet Medical Record";
                    string txtRow2 = "Inserting " + GetPetOwnerName(petownerID) + " Pet's New Medical Record's Details";

                    Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                    Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                    if (lblRow1 != null || lblRow1 != null)
                    {
                        lblRow1.Text = txtRow1;
                        lblRow2.Text = txtRow2;
                    }

                    // Connect to the database and retrieve Pet Owner details
                    string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "SELECT PetOwner_ID, PetOwner_Name, PetOwner_Gender, PetOwner_Address, PetOwner_PhoneNo, PetOwner_EmergencyContact FROM PetOwner WHERE PetOwner_ID = @PetOwnerID";

                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@PetOwnerID", petownerID);

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            petownerID = reader["PetOwner_ID"].ToString();
                            txtBox_PetOwnerID.Text = petownerID;
                            string petownerName = reader["PetOwner_Name"].ToString();
                            txtBox_PetOwnerName.Text = petownerName;
                            string petownerGender = reader["PetOwner_Gender"].ToString();
                            ddl_PetOwnerGender.Text = petownerGender;
                            string petownerAddress = reader["PetOwner_Address"].ToString();
                            txtBox_PetOwnerAddress.Text = petownerAddress;
                            string petownerPhoneNo = reader["PetOwner_PhoneNo"].ToString();
                            txtBox_PetOwnerPhoneNo.Text = petownerPhoneNo;
                            string petownerEmergencyContact = reader["PetOwner_EmergencyContact"].ToString();
                            txtBox_PetOwnerEmergencyContact.Text = petownerEmergencyContact;

                        }

                        reader.Close();
                    }
                }
                else
                {
                
                }
            }
        }
        private string GetPetOwnerName(string petownerID)
        {
            string petownerName = string.Empty;
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            // Connect to your database and retrieve the last record ID
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT PetOwner_Name FROM PetOwner WHERE PetOwner_ID = @PetOwnerID;";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@PetOwnerID", petownerID);

                connection.Open();
                object result = command.ExecuteScalar();


                if (result != null && result != DBNull.Value)
                {
                    petownerName = result.ToString();
                }

                return petownerName;
            }
        }
        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string petownerID = txtBox_PetOwnerID.Text;
            string petownerName = txtBox_PetOwnerName.Text;
            string petownerGender = ddl_PetOwnerGender.Text;
            string petownerAddress = txtBox_PetOwnerAddress.Text;
            string petownerPhoneNo = txtBox_PetOwnerPhoneNo.Text;
            string petownerEmergencyContact = txtBox_PetOwnerEmergencyContact.Text;
            
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    string query = "UPDATE PetOwner SET PetOwner_Name = @PetOwner_Name, PetOwner_Gender = @PetOwner_Gender, PetOwner_Address = @PetOwner_Address, PetOwner_PhoneNo = @PetOwner_PhoneNo, PetOwner_EmergencyContact = @PetOwner_EmergencyContact WHERE PetOwner_ID = @PetOwner_ID";



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

                Response.Write("Data Updated");
                Response.Redirect("TablePatient.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }
    }
}