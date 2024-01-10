using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gebuu
{
    public partial class HomePage1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblRow1 = ((Header1)this.Master).FindControl("Lbl_row1") as Label;
            Label lblRow2 = ((Header1)this.Master).FindControl("Lbl_row2") as Label;
        }
    }
}