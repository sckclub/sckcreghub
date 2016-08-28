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
    public partial class TH15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = "TH16"; // This sets the meetID for all pages that conenct from this one
            string sClub = "Club not found";
            string sClubID = "NoClub";
            string sCoachName = "No Coach";
            string sCoachCode = Request.QueryString["qcc"]; // Code manually assigned Club/Coach Combination e.g., "f67b99"


            string sqcc = Request.QueryString["qcc"];
            if (sqcc == null) { sqcc = "noqcc"; }
            string sSCKCRegConnString = ConfigurationManager.ConnectionStrings["SCKCLUBConnectionString"].ConnectionString;
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
                lnkbutRegistration.PostBackUrl = String.Format(lnkbutRegistration.PostBackUrl, sClubID, smeetid, sCoachCode);
                //lnkButtonReviewEntries.PostBackUrl = String.Format(lnkButtonReviewEntries.PostBackUrl, sClubID, smeetid, sCoachCode);
                divNoCoach.Visible = false;
            }
            else
            {
                divCoachIsHere.Visible = false;
                lnkButtonReviewEntries.Visible = false;
            }
            Boolean bIsClosed = true;
            if (bIsClosed == true)
            {
                // When Closed, hide all Entry Links
                divCoachIsHere.Visible = false;
                divNoCoach.Visible = false;
                divClosed.Visible = true;
                lblCoachName2.Text = sCoachName;
                lblClubName2.Text = sClub;
                lnkButtonReviewEntries.PostBackUrl = String.Format(lnkButtonReviewEntries.PostBackUrl, sClubID, smeetid, sCoachCode);

            }
        }
    }
}
