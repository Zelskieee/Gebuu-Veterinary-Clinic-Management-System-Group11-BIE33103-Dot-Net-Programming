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
    public partial class Appointment1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string txtRow1 = "Appointments";
                string txtRow2 = "You Have " + GetAppointmentCountToday() + " Appointments Today";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null || lblRow1 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }

                BindAppointmentData();
            }
        }

        private int GetAppointmentCountToday()
        {
            int appointmentCount = 0;

            // Assuming you have a database table named 'Appointments' with a column 'AppointmentDate' to store the appointment date

            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Open the database connection
                connection.Open();

                // Create a SQL command to execute the query
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Appointment WHERE Appointment_Date = @Today", connection))
                {
                    // Set the parameter for the current date
                    command.Parameters.AddWithValue("@Today", DateTime.Today);

                    // Execute the query and retrieve the count
                    appointmentCount = (int)command.ExecuteScalar();
                }

                // Close the database connection
                connection.Close();
            }
            return appointmentCount;
        }
        private void BindAppointmentData()
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT Appointment_ID, Appointment_Name, Appointment_Date, Appointment_Time FROM Appointment ORDER BY Appointment_Date ASC, Appointment_Time ASC";

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
            int appointmentID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            DeleteAppointment(appointmentID);
            BindAppointmentData();
        }

        private void DeleteAppointment(int appointmentID)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "DELETE FROM Appointment WHERE Appointment_ID = @AppointmentID";

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@AppointmentID", appointmentID);

                command.ExecuteNonQuery();
            }
        }

        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            // Get the Appointment_ID from the command argument
            LinkButton lnkUpdate = (LinkButton)sender;
            string appointmentID = lnkUpdate.CommandArgument;

            // Redirect to the ModifyAppointment.aspx page with the appointment ID
            Response.Redirect("ModifyAppointment.aspx?appointmentID=" + appointmentID);
        }
    }
}