using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using sckregLib;
using System.Configuration;

namespace sckreg
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            string smeetname = "NO MEET";
            if (smeetid == null) { smeetid = "NT16"; }
            string sSCKCRegConnString = ConfigurationManager.ConnectionStrings["SCKCLUBConnectionString"].ConnectionString;
            using (SqlConnection Sqlcon2 = new SqlConnection(sSCKCRegConnString))
            {
                smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            //right header slot
            lblHeaderMeet.Text = smeetname;
            lblMeetName.Text = smeetname;
            lblHeaderCoach.Text = smeetid;
            hyplnkAllPaddlers.NavigateUrl = String.Format(hyplnkAllPaddlers.NavigateUrl, smeetid);
            hyplnkEntriesByTeam.NavigateUrl = String.Format(hyplnkEntriesByTeam.NavigateUrl, smeetid);
            hyplnkAllEvents.NavigateUrl = String.Format(hyplnkAllEvents.NavigateUrl, smeetid);
            hyplnkAllEntries.NavigateUrl = String.Format(hyplnkAllEntries.NavigateUrl, smeetid);
            hyplnkCoaches.NavigateUrl = String.Format(hyplnkCoaches.NavigateUrl, smeetid);
            hyplnkTeamInvoices.NavigateUrl = String.Format(hyplnkTeamInvoices.NavigateUrl, smeetid);
            hyplnkPaymentsPerTeam.NavigateUrl = String.Format(hyplnkPaymentsPerTeam.NavigateUrl, smeetid);

            hyplnkTeamBoats.NavigateUrl = String.Format(hyplnkTeamBoats.NavigateUrl, smeetid);

            //For JRaceman
            hyplnkJREvents.NavigateUrl = String.Format(hyplnkJREvents.NavigateUrl, smeetid);
            hyplnkJRPaddlers.NavigateUrl = String.Format(hyplnkJRPaddlers.NavigateUrl, smeetid);
            hyplnkJREntries.NavigateUrl = String.Format(hyplnkJREntries.NavigateUrl, smeetid);
            hyplnkJRMISC.NavigateUrl = String.Format(hyplnkJRMISC.NavigateUrl, smeetid);

        }
    }
}
