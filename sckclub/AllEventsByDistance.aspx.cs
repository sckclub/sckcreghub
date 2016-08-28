using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sckreg
{
    public partial class AllEventsByDistance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hyplnkHome.NavigateUrl = String.Format(hyplnkHome.NavigateUrl, Request.QueryString["qdistance"]);
  
        }
    }
}
