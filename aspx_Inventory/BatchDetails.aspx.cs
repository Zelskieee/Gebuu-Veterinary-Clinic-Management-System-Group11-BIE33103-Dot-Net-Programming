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
    public partial class BatchDetails : System.Web.UI.Page
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

                BindBatchData();
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

        private void BindBatchData()
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";
            string medID = Request.QueryString["medID"];

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT S.Batch_ID, B.Batch_ExpDate, S.Stock " +
                               "FROM Stock AS S " +
                               "JOIN Batch AS B ON S.Batch_ID = B.Batch_ID " +
                               "WHERE S.Med_ID = @MedID " +
                               "ORDER BY S.Batch_ID ASC";

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@MedID", medID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string batchID = GridView1.Rows[e.RowIndex].Cells[0].Text;

            DeleteBatch(batchID);
            BindBatchData();
        }


        private void DeleteBatch(string batchID)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string medID = Request.QueryString["medID"];

                // Delete the batch from the Stock table
                string deleteBatchQuery = "DELETE FROM Stock WHERE Batch_ID = @batchID AND Med_ID = @medID";
                SqlCommand deleteBatchCommand = new SqlCommand(deleteBatchQuery, con);
                deleteBatchCommand.Parameters.AddWithValue("@batchID", batchID);
                deleteBatchCommand.Parameters.AddWithValue("@medID", medID);
                deleteBatchCommand.ExecuteNonQuery();
            }
        }

        protected void btnDecreaseStock_Click(object sender, EventArgs e)
        {
            LinkButton btnDecreaseStock = (LinkButton)sender;
            string batchID = btnDecreaseStock.CommandArgument;
            int medID = int.Parse(Request.QueryString["medID"]);

            int stockID = GetStockID(batchID, medID);

            // Call a method to decrease the stock
            DecreaseStock(stockID);

            // Rebind the GridView to reflect the updated data
            BindBatchData();
        }

        private void DecreaseStock(int stockID)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Check if there is enough stock before decreasing
                string checkStockQuery = "SELECT Stock FROM Stock WHERE Stock_ID = @StockID";
                SqlCommand checkStockCommand = new SqlCommand(checkStockQuery, con);
                checkStockCommand.Parameters.AddWithValue("@StockID", stockID);

                int currentStock = Convert.ToInt32(checkStockCommand.ExecuteScalar());

                if (currentStock > 0)
                {
                    // Decrease the stock by 1 in the Stock table for the specific Stock_ID
                    string decreaseStockQuery = "UPDATE Stock SET Stock = Stock - 1 WHERE Stock_ID = @StockID AND Stock > 0";
                    SqlCommand decreaseStockCommand = new SqlCommand(decreaseStockQuery, con);
                    decreaseStockCommand.Parameters.AddWithValue("@StockID", stockID);

                    decreaseStockCommand.ExecuteNonQuery();
                }
            }
        }

    private int GetStockID(string batchID, int medID)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";
            int stockID = 0;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Retrieve the Stock_ID for the given Batch_ID and Med_ID
                string getStockIDQuery = "SELECT Stock_ID FROM Stock WHERE Batch_ID = @BatchID AND Med_ID = @MedID";
                SqlCommand getStockIDCommand = new SqlCommand(getStockIDQuery, con);
                getStockIDCommand.Parameters.AddWithValue("@BatchID", batchID);
                getStockIDCommand.Parameters.AddWithValue("@MedID", medID);

                object result = getStockIDCommand.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    stockID = Convert.ToInt32(result);
                }
            }

            return stockID;
        }



    }

}