using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using sckregLib;

namespace sckreg
{
    public partial class Reports_TeamInvoices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid != null)
            {

                string smeetname = "2014 Ted Houk Regatta ";
                if (smeetid == null) { smeetid = "TH14"; }

                using (SqlConnection Sqlcon2 = new SqlConnection(sqldataTeamInvoices.ConnectionString))
                {
                    smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
                }
                //right header slot
                lblMeetName.Text = smeetname;
                lblHeaderMeet.Text = smeetname;
                lblHeaderCoach.Text = smeetid; ;
                hyplnkReportsHome.NavigateUrl = String.Format(hyplnkReportsHome.NavigateUrl, smeetid);
            }
        }
    }
}
