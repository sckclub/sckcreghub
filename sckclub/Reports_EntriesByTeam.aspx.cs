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
    public partial class Reports_EntriesByTeam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sCoachCode = Request.QueryString["qcc"]; // Code manually assigned Club/Coach Combination e.g., "f67b99"

            string steamid = Request.QueryString["qclub"];
            if (steamid == null) { steamid = "NOCLUB"; }
            string smeetid = Request.QueryString["qmeet"];
            if (String.IsNullOrEmpty(smeetid))
            {
                smeetid = "TH15";
            }
            string smeetname = "2014 Ted Houk Regatta ";
            if (smeetid == null) { smeetid = "TH14"; }

            using (SqlConnection Sqlcon2 = new SqlConnection(sqlsrcEntriesByTeam.ConnectionString))
            {
                smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            //right header slot
            lblHeaderMeet.Text = smeetname;
            lblHeaderCoach.Text = steamid;
            lblTeamName.Text = steamid;
            hyplnkTR15.NavigateUrl = String.Format(hyplnkTR15.NavigateUrl, sCoachCode);

        }
    }
}
