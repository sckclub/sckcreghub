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
    public partial class TeamboatEntriesReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid == null) { smeetid = "NAT15"; }
            string smeetname = "No Meet";
            using (SqlConnection Sqlcon2 = new SqlConnection(sqldsTeamBoats.ConnectionString))
            {
                smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            lblHeaderMeet.Text = smeetname;
            string steamid = Request.QueryString["qclub"];
            if (steamid == null) { steamid = "ALL"; }
            string sage = Request.QueryString["qage"];
            if (sage == null) { sage = "ALL"; }
            // Put query string values in Return Hyperlink
            if (steamid == "ALL")
            {
                hyplnkReportsHome.NavigateUrl = String.Format(hyplnkReportsHome.NavigateUrl, smeetid);
                hyplnkPaddlers.Visible = false;
                lblTeamDesc.Visible = false;
            }
            else
            {
                hypTeamPaddlers.NavigateUrl = String.Format(hypTeamPaddlers.NavigateUrl, steamid, smeetid, sage);
                hyplnkReportsHome.Visible = false;
            }
            string sStatus = Request.QueryString["qstatus"];  // ALL or INC Incomplete or COM Complete
            if (sStatus == null) { sStatus = "ALL";  }
            if (sStatus == "ALL") lblStatus.Text = "";
            if (sStatus == "INC") lblStatus.Text = " Incomplete boats ONLY";
            if (sStatus == "COM")
            {                 lblStatus.Text = " Complete boats ONLY";  }
            lnkbutComplete.PostBackUrl = String.Format(lnkbutComplete.PostBackUrl, smeetid, steamid, "COM");
            lnkbutIncomplete.PostBackUrl = String.Format(lnkbutIncomplete.PostBackUrl, smeetid, steamid, "INC");
            lnkbtnALL.PostBackUrl = String.Format(lnkbtnALL.PostBackUrl, smeetid, steamid, "ALL");
            // Put query string values in Return Hyperlink
            hyplnkPaddlers.NavigateUrl = String.Format(hyplnkPaddlers.NavigateUrl, steamid, smeetid, sage);
            lblHeaderCoach.Text = steamid.ToUpper();
            lblTeamID.Text = steamid.ToUpper();

        }
    }
}
