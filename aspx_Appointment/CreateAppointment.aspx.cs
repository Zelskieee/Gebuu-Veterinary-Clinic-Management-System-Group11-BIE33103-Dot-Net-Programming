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
    public partial class CreateAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string txtRow1 = "Create New Appointment";
                string txtRow2 = "Schedule A New Appointment";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null || lblRow1 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }

                // Get the last appointment ID from the database
                int lastAppointmentID = GetLastAppointmentID();

                // Generate the new appointment ID by incrementing the last appointment ID
                int newAppointmentID = lastAppointmentID + 1;

                // Set the appointment ID to the TextBox control
                txtBox_AppointmentID.Text = newAppointmentID.ToString();
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string appointmentID = txtBox_AppointmentID.Text;
            string appointmentName = txtBox_AppointmentName.Text;
            string appointmentDate = txtBox_AppointmentDate.Text;
            string appointmentTime = txtBox_AppointmentTime.Text;

            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    string query = "INSERT INTO Appointment (Appointment_ID, Appointment_Name, Appointment_Date, Appointment_Time) " +
                                   "VALUES (@Appointment_ID, @Appointment_Name, CONVERT(datetime, @Appointment_Date), CONVERT(time(7), @Appointment_Time))";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Appointment_ID", appointmentID);
                        cmd.Parameters.AddWithValue("@Appointment_Name", appointmentName);
                        cmd.Parameters.AddWithValue("@Appointment_Date", appointmentDate);
                        cmd.Parameters.AddWithValue("@Appointment_Time", appointmentTime);

                        cmd.ExecuteNonQuery();
                    }
                }

                // Redirect to SuccessInsertion.aspx after data is inserted
                Response.Redirect("AppointmentSuccessInsertion.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            Response.Redirect(Request.UrlReferrer.ToString());
        }

        private int GetLastAppointmentID()
        {
            int lastAppointmentID = 0;
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            // Connect to your database and retrieve the last appointment ID
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 Appointment_ID FROM Appointment ORDER BY Appointment_ID DESC";
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    lastAppointmentID = Convert.ToInt32(result);
                }
            }

            return lastAppointmentID;
        }
    }
}