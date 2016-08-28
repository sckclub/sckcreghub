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
    public partial class Reports_JR_Entries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            string smeetname = "Ted Houk 2014";
            if (smeetid == null) { smeetid = "NAT15"; }
            using (SqlConnection Sqlcon2 = new SqlConnection(sqlsrvJREntries.ConnectionString))
            {
                smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            //lblMeetName.Text = smeetid;
            //right header slot
            lblHeaderMeet.Text = smeetname;
            lblHeaderCoach.Text = smeetid;
            hyplnkReportsHome.NavigateUrl = String.Format(hyplnkReportsHome.NavigateUrl, smeetid);
        }
    }
}
