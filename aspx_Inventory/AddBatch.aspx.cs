using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Gebuu.aspx_Inventory
{
    public partial class AddBatch : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string medID = Request.QueryString["medID"];
                string txtRow1 = "Batch Details";
                string txtRow2 = "You are Viewing " + GetMedicationName(medID) + " Batch Details";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null && lblRow2 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }
            }
        }
        public string GetMedicationName(string medID)
        {
            string medName = string.Empty;

            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT Med_Name FROM Medicine WHERE Med_ID = @MedID";

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@MedID", medID);

                medName = command.ExecuteScalar()?.ToString();
            }

            return medName;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["medID"], out int medID))
            {
                string batchID = txtBox_BatchID.Text;
                string batchExpDate = txtBox_BatchExpDate.Text;
                int stock = Convert.ToInt32(txtBox_Stock.Text);

                string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

                try
                {
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();

                        // Insert the new batch into the Batch table
                        string batchQuery = "INSERT INTO Batch (Batch_ID, Batch_ExpDate) " +
                                            "VALUES (@Batch_ID, @Batch_ExpDate)";

                        using (SqlCommand batchCommand = new SqlCommand(batchQuery, con))
                        {
                            batchCommand.Parameters.AddWithValue("@Batch_ID", batchID);
                            batchCommand.Parameters.AddWithValue("@Batch_ExpDate", batchExpDate);

                            batchCommand.ExecuteNonQuery();
                        }

                        // Insert the stock for the new batch in the Stock table
                        string stockQuery = "INSERT INTO Stock (Med_ID, Batch_ID, Stock) " +
                                            "VALUES (@Med_ID, @Batch_ID, @Stock)";

                        using (SqlCommand stockCommand = new SqlCommand(stockQuery, con))
                        {
                            stockCommand.Parameters.AddWithValue("@Med_ID", medID);
                            stockCommand.Parameters.AddWithValue("@Batch_ID", batchID);
                            stockCommand.Parameters.AddWithValue("@Stock", stock);

                            stockCommand.ExecuteNonQuery();
                        }

                        // Redirect to SuccessInsertion.aspx after data is inserted
                        Response.Redirect("BatchSuccessInsertion.aspx");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
            else
            {
                Response.Write("Invalid medID parameter.");
            }
        }


    }
}
