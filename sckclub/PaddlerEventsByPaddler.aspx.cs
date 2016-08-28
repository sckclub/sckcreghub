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
    public partial class PaddlerEventsByPaddler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid == null) { smeetid = "LPI14"; }
            using (SqlConnection Sqlcon2 = new SqlConnection(sqldsPaddlerEntries.ConnectionString))
            {
                lblHeaderMeet.Text = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            string sage = Request.QueryString["qage"];
            if (sage == null) { sage = "ALL"; }
            string steamid = Request.QueryString["qclub"];           
            if (steamid == null) { steamid = "NOCLUB"; }
            if (smeetid == "MM14")
            {
                // for individual entries, only provide navigation back to paddler page
                hyplnkTeamEntries.Visible = false;
            }
            else
            {
                // Put query string values in Return Hyperlink
                hyplnkTeamEntries.NavigateUrl = String.Format(hyplnkTeamEntries.NavigateUrl, steamid, smeetid, sage);
            }
            // Put query string values in Return Hyperlink
            hyplnkPaddlerPage.NavigateUrl = String.Format(hyplnkPaddlerPage.NavigateUrl, steamid, Request.QueryString["qpaddler"].Trim(), Request.QueryString["qfname"].Trim(), Request.QueryString["qlname"], smeetid, sage);
            lblHeaderCoach.Text = steamid.ToUpper();
        }
    }
}
