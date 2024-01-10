using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Gebuu.aspx_Inventory
{
    public partial class TableInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string txtRow1 = "Inventory";
                string txtRow2 = "List Of Medicine In Stock";

                Label lblRow1 = ((WithBackBtn)this.Master).FindControl("Lbl_row1") as Label;
                Label lblRow2 = ((WithBackBtn)this.Master).FindControl("Lbl_row2") as Label;
                if (lblRow1 != null && lblRow2 != null)
                {
                    lblRow1.Text = txtRow1;
                    lblRow2.Text = txtRow2;
                }

                BindInventoryData();
            }
        }
        private void BindInventoryData()
        {
            string connectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=DB_Gebuu; Integrated Security=True; Pooling=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT S.Med_ID, M.Med_Name, SUM(S.Stock) AS TotalStock " +
                               "FROM Stock AS S " +
                               "JOIN Medicine AS M ON S.Med_ID = M.Med_ID " +
                               "GROUP BY S.Med_ID, M.Med_Name " +
                               "ORDER BY S.Med_ID ASC";

                SqlCommand command = new SqlCommand(query, con);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }



        protected void lnkView_Click(object sender, EventArgs e)
        {
            // Get the Med_ID from the command argument
            LinkButton lnkUpdate = (LinkButton)sender;
            string medID = lnkUpdate.CommandArgument;

            // Redirect to the ModifyInventory.aspx page with the Med_ID
            Response.Redirect("BatchDetails.aspx?medID=" + medID);
        }


    }
}