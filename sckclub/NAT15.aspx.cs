using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using sckregLib;

namespace sckreg
{
    public partial class NAT15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sClub = "Club not found";
            string sClubID = "NoClub";
            string sCoachName = "No Coach";
            string sCoachCode = Request.QueryString["qcc"]; // Code manually assigned Club/Coach Combination e.g., "f67b99"
            string sMeetName = "";
            string sMeetLocation = "";
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid == null) { smeetid = "NAT15"; }
            string sSCKCRegConnString = ConfigurationManager.ConnectionStrings["SCKCLUBConnectionString"].ConnectionString;
            using (SqlConnection Sqlcon3 = new SqlConnection(sSCKCRegConnString))
            {
                sMeetName = clsSCKCREG.GetMeetName(Sqlcon3, smeetid, ref sMeetLocation);
            }
            lblMeetName.Text = sMeetName;
            lblMeetLocation.Text = sMeetLocation;

            // Get Coach Name and Club
            string sqcc = Request.QueryString["qcc"];
            if (sqcc == null) { sqcc = "noqcc"; }
            using (SqlConnection Sqlcon2 = new SqlConnection(sSCKCRegConnString))
            {
                if (!clsSCKCREG.IsEntriesCoach(Sqlcon2, smeetid, sqcc, ref sCoachName, ref sClubID, ref sClub))
                {
                    sCoachName = "No Coach";
                }
            }
            // When Closed, hide all Entry Links
            if (sCoachName != "No Coach")
            {
                lblCoachName.Text = sCoachName;
                lblClubName.Text = sClub;
                lnkbutRegisterJuniors.PostBackUrl = String.Format(lnkbutRegisterJuniors.PostBackUrl, sClubID, smeetid, sCoachCode);
                lnkbutRegisterMasters.PostBackUrl = String.Format(lnkbutRegisterMasters.PostBackUrl, sClubID, smeetid, sCoachCode);
                //lnkButtonReviewEntries.PostBackUrl = String.Format(lnkButtonReviewEntries.PostBackUrl, sClubID, smeetid, sCoachCode);
                divNoCoach.Visible = false;
            }
            else
            {
                divCoachIsHere.Visible = false;
                //divCoachIsHere.Style=
                bool bPreRelease = false;
                divNoCoach.Visible = !bPreRelease;  // Hide during pre-release
            }
            Boolean bIsClosed = true;
            if (bIsClosed == true)
            {
                // When Closed, hide all Entry Links
                divCoachIsHere.Visible = false;
                divNoCoach.Visible = false;
                //lblCoachName2.Text = sCoachName;
                //lblClubName2.Text = sClub;
            }

        }
    }
}
