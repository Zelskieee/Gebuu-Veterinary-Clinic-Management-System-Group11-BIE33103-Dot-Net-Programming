using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Gebuu.aspx_Room
{
    public partial class TableRoom1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string txtRow1 = "Admit Pet Owner to Room";
                string txtRow2 = "Pet Owner to their Respective Rooms";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null || lblRow1 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }

                BindOrderData();
            }
        }


        private void BindOrderData()
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT o.Order_ID, o.PetOwner_ID, o.Room_ID FROM [Order] o;";

                SqlCommand command = new SqlCommand(query, con);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }




        protected void AdmitToRoom1(object sender, EventArgs e)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Check if the highest Order_ID already has a non-null Room_ID for Room 1
                string checkRoomIDQuery = "SELECT CASE WHEN Room_ID IS NULL THEN 1 ELSE 0 END FROM [Order] WHERE Order_ID = (SELECT MAX(Order_ID) FROM [Order])";

                SqlCommand checkRoomIDCommand = new SqlCommand(checkRoomIDQuery, con);
                int roomIDResult = (int)checkRoomIDCommand.ExecuteScalar();

                // If the Room_ID is not null, do nothing and return
                if (roomIDResult == 0)
                {
                    RoomErrorMessageLabel.Text = "Cannot admit to Room 1. Room is already assigned.";
                    RoomErrorMessageLabel.Visible = true;
                    return;
                }

                    // Retrieve the lowest Order_ID with a NULL Room_ID from the Order table
                    string getMaxOrderIDQuery = "SELECT MIN(Order_ID) FROM [Order] WHERE Room_ID IS NULL";

                SqlCommand getMaxOrderIDCommand = new SqlCommand(getMaxOrderIDQuery, con);
                int orderID = (int)getMaxOrderIDCommand.ExecuteScalar();

                // Update the Order table with the retrieved Order_ID for Room 1
                string updateOrderQuery = "UPDATE [Order] SET Room_ID = 1 WHERE Order_ID = @OrderID";

                SqlCommand updateOrderCommand = new SqlCommand(updateOrderQuery, con);
                updateOrderCommand.Parameters.AddWithValue("@OrderID", orderID);
                updateOrderCommand.ExecuteNonQuery();
            }

            Response.Redirect(Request.RawUrl);
        }



        protected void AdmitToRoom2(object sender, EventArgs e)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Check if the highest Order_ID already has a non-null Room_ID for Room 1
                string checkRoomIDQuery = "SELECT CASE WHEN Room_ID IS NULL THEN 1 ELSE 0 END FROM [Order] WHERE Order_ID = (SELECT MAX(Order_ID) FROM [Order])";

                SqlCommand checkRoomIDCommand = new SqlCommand(checkRoomIDQuery, con);
                int roomIDResult = (int)checkRoomIDCommand.ExecuteScalar();

                // If the Room_ID is not null, do nothing and return
                if (roomIDResult == 0)
                {
                    RoomErrorMessageLabel.Text = "Cannot admit to Room 2. Room is already assigned.";
                    RoomErrorMessageLabel.Visible = true;
                    return;
                }

                    // Retrieve the lowest Order_ID with a NULL Room_ID from the Order table
                    string getMaxOrderIDQuery = "SELECT MIN(Order_ID) FROM [Order] WHERE Room_ID IS NULL";

                SqlCommand getMaxOrderIDCommand = new SqlCommand(getMaxOrderIDQuery, con);
                int orderID = (int)getMaxOrderIDCommand.ExecuteScalar();


                // Update the Order table with the retrieved Order_ID for Room 2
                string updateOrderQuery = "UPDATE [Order] SET Room_ID = 2 WHERE Order_ID = @OrderID";

                SqlCommand updateOrderCommand = new SqlCommand(updateOrderQuery, con);
                updateOrderCommand.Parameters.AddWithValue("@OrderID", orderID);
                updateOrderCommand.ExecuteNonQuery();
            }

            Response.Redirect(Request.RawUrl);
        }


        protected void RedirectToPage(object sender, EventArgs e)
        {
            Response.Redirect("DoctorInfo.aspx");
        }


    }
}