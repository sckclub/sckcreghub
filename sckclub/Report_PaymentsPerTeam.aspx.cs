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
    public partial class Report_PaymentsPerTeam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string steamid = Request.QueryString["qclub"];
            if (steamid == null) { steamid = "SCKC"; } else { steamid = steamid.Trim(); }
            //ddListTeamsID.SelectedValue = steamid.ToString();
            string smeetid = Request.QueryString["qmeet"];
            string smeetname = "Ted Houk 2014";
            if (smeetid == null) { smeetid = "NAT15"; }
            string sSCKCRegConnString = sqldataPaddlerEntrriesByTeam.ConnectionString;
            using (SqlConnection Sqlcon2 = new SqlConnection(sSCKCRegConnString))
            {
                smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            //right header slot
            lblHeaderMeet.Text = smeetname;
            lblTeam.Text = steamid;
            lblHeaderCoach.Text = smeetid;
            hyplnkReportsHome.NavigateUrl = String.Format(hyplnkReportsHome.NavigateUrl, smeetid);
        }

        protected void ddListTeamsID_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblTeam.Text = ddListTeamsID.SelectedValue.ToString();
        }
    }
}
