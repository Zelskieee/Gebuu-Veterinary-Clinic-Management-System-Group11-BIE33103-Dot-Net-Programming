using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gebuu.aspx_Inventory
{
    public partial class BatchSuccessInsertion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGoBackToTable_Click(object sender, EventArgs e)
        {
            Response.Redirect("TableInventory.aspx");
        }
    }
}