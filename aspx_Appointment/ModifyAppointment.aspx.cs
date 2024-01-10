using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Gebuu.aspx_Appointment
{
    public partial class ModifyAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string txtRow1 = "Modify Appointment";
                string txtRow2 = "Edit The Appointment Details";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null || lblRow1 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }
                if (Request.QueryString["appointmentID"] != null)
                {
                    string appointmentID = Request.QueryString["appointmentID"];

                    // Connect to the database and retrieve appointment details
                    string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "SELECT Appointment_ID, Appointment_Name, Appointment_Date, Appointment_Time FROM Appointment WHERE Appointment_ID = @AppointmentID";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@AppointmentID", appointmentID);

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            appointmentID = reader["Appointment_ID"].ToString();
                            txtBox_AppointmentID.Text = appointmentID;
                            string appointmentName = reader["Appointment_Name"].ToString();
                            txtBox_AppointmentName.Text = appointmentName;
                            string appointmentDate = Convert.ToDateTime(reader["Appointment_Date"]).ToString("yyyy-MM-dd");
                            txtBox_AppointmentDate.Text = appointmentDate;

                            TimeSpan appointmentTime = (TimeSpan)reader["Appointment_Time"];
                            txtBox_AppointmentTime.Text = appointmentTime.ToString("hh\\:mm\\:ss");
                        }

                        reader.Close();
                    }
                }
                else
                {
                    // Handle the case when appointmentID is not provided in the query string
                }
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

                    string query = "UPDATE Appointment SET Appointment_Name = @Appointment_Name, Appointment_Date = CONVERT(datetime, @Appointment_Date), Appointment_Time = CONVERT(time(7), @Appointment_Time) WHERE Appointment_ID = @Appointment_ID";


                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Appointment_ID", appointmentID);
                        cmd.Parameters.AddWithValue("@Appointment_Name", appointmentName);
                        cmd.Parameters.AddWithValue("@Appointment_Date", appointmentDate);
                        cmd.Parameters.AddWithValue("@Appointment_Time", appointmentTime);

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