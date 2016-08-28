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
    public partial class EventEntries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string smeetid = Request.QueryString["qmeet"];
            string smeetname = "Ted Houk 2014";
            if (smeetid == null) { smeetid = "LPI14"; }
             using (SqlConnection Sqlcon2 = new SqlConnection(sqldsEventsByBoat.ConnectionString))
            {
                smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }

                lblMeetName.Text = smeetname;
                lblMeetName.Visible = false; //now shown in header ribbon
                //right header slot
                lblHeaderMeet.Text = smeetname;
                lblHeaderCoach.Text = smeetid;
            // Return filter buttons by age
                string sage = Request.QueryString["qage"];
                if (sage == null) { sage = "ALL"; }
            // Put query string values in Return Hyperlink
            hyplnkAllEventsByDistance2.NavigateUrl = String.Format(hyplnkAllEventsByDistance2.NavigateUrl, Request.QueryString["qdistance"]);
            hyplnkAllEventsByDistance2.Visible = false;
            hyplnkAllEvents.NavigateUrl = String.Format(hyplnkAllEvents.NavigateUrl, smeetid, sage);

        }
    }
}
