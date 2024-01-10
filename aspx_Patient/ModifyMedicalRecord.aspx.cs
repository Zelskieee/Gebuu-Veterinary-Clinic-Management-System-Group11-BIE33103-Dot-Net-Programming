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
    public partial class ModifyMedicalRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["RecordID"] != null)
                {
                    string recordID = Request.QueryString["RecordID"];

                    // Connect to the database and retrieve medical record details
                    string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "SELECT Record_ID, PetOwner_ID, Vet_ID, Record_Date, Record_Time, Record_Reason FROM MedicalRecord WHERE Record_ID = @RecordID";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@RecordID", recordID);

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            recordID = reader["Record_ID"].ToString();
                            txtBox_RecordID.Text = recordID;

                            string petownerID = reader["PetOwner_ID"].ToString();
                            txtBox_PetOwnerID.Text = petownerID; // Update the ID of the PetOwner field with the retrieved PetOwner_ID

                            string vetID = reader["Vet_ID"].ToString();
                            ddl_VetID.Text = vetID;
                            string recordDate = Convert.ToDateTime(reader["Record_Date"]).ToString("yyyy-MM-dd");
                            txtBox_RecordDate.Text = recordDate;

                            TimeSpan recordTime = (TimeSpan)reader["Record_Time"];
                            txtBox_RecordTime.Text = recordTime.ToString("hh\\:mm\\:ss");

                            string recordReason = reader["Record_Reason"].ToString();
                            txtBox_RecordReason.Text = recordReason;
                        }

                        reader.Close();

                        string txtRow1 = "Pet Medical Record";
                        string txtRow2 = "You are Editting " + GetPetOwner_Name(txtBox_PetOwnerID.Text) + " Pet's Medical Record";

                        Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                        Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                        if (lblRow1 != null || lblRow1 != null)
                        {
                            lblRow1.Text = txtRow1;
                            lblRow2.Text = txtRow2;
                        }
                    }
                }
                else
                {
                    // Handle the case when recordID is not provided in the query string
                }
            }
        }

        private string GetPetOwner_Name(string petownerID)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT PetOwner_Name FROM PetOwner WHERE PetOwner_ID = @PetOwnerID";

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@PetOwnerID", petownerID);

                string petownerName = command.ExecuteScalar()?.ToString();

                return petownerName;
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string recordID = txtBox_RecordID.Text;
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

                    string query = "UPDATE MedicalRecord SET Vet_ID = @Vet_ID, Record_Date = CONVERT(datetime, @Record_Date), Record_Time = CONVERT(time(7), @Record_Time), Record_Reason = @Record_Reason WHERE Record_ID = @Record_ID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Record_ID", recordID);
                        cmd.Parameters.AddWithValue("@Vet_ID", vetID);
                        cmd.Parameters.AddWithValue("@Record_Date", recordDate);
                        cmd.Parameters.AddWithValue("@Record_Time", recordTime);
                        cmd.Parameters.AddWithValue("@Record_Reason", recordReason);

                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write("Data Updated");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

    }
}