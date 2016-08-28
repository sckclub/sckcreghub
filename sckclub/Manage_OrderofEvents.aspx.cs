using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sckreg
{
    public partial class Manage_OrderofEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid != null)
            {
                lblMeet.Text = smeetid.ToString() == "LPI14" ? "2014 Lake Placid International Regatta " : "Ted Houk 2014 ";
            }
        }
    }
}
