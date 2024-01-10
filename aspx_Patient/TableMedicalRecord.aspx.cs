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

namespace Gebuu.aspx_Patient
{
    public partial class TableMedicalRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string txtRow1 = "Pet Medical Record";
                string txtRow2 = "You are Viewing " + GetPetOwner_Name() + " Pet's Medical Record";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null || lblRow1 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }
                BindMedicalRecordData();
            }
        }

        private string GetPetOwner_Name()
        {
            string petownerID = Request.QueryString["petownerID"];
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

            private void BindMedicalRecordData()
            {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT Record_ID, Vet_ID, Record_Date, Record_Time, Record_Reason, PetOwner_ID FROM MedicalRecord WHERE PetOwner_ID = @PetOwnerID ORDER BY Record_Date ASC, Record_Time ASC";

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@PetOwnerID", Request.QueryString["petownerID"]);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int recordID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            DeleteMedicalRecord(recordID);
            BindMedicalRecordData();
        }

        private void DeleteMedicalRecord(int recordID)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "DELETE FROM MedicalRecord WHERE Record_ID = @RecordID";

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@RecordID", recordID);

                command.ExecuteNonQuery();
            }
        }

        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            // Get the Record_ID and PetOwner_ID from the command argument
            LinkButton lnkUpdate = (LinkButton)sender;
            string recordID = lnkUpdate.CommandArgument;

            // Redirect to the ModifyAppointment.aspx page with the appointment ID and PetOwner ID
            Response.Redirect("ModifyMedicalRecord.aspx?recordID=" + recordID);
        }


    }
}