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
    public partial class AllEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid == null) { smeetid = "NAT15"; }
            using (SqlConnection Sqlcon2 = new SqlConnection(sqldsOrderEvents.ConnectionString))
            {
                lblHeaderMeet.Text = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            lblHeaderCoach.Text = smeetid;
            hyplnkHome.Visible = false;
            hyplnkReportsHome.NavigateUrl = String.Format(hyplnkReportsHome.NavigateUrl, smeetid);
            // provide filter buttons by age
            string sage = Request.QueryString["qage"];
            if (sage == null) { sage = "ALL"; }
            //Age Filters
            switch (sage)
            {
                case "Juniors":
                    hyplnkHome.Visible = false;
                    lblAge.Text = "Juniors ";
                    hyplnkReportsHome.Visible = false;
                    break;
                case "Masters":
                    hyplnkHome.Visible = false;
                    lblAge.Text = "Masters ";
                    hyplnkReportsHome.Visible = false;
                    break;
                case "ALL":
                    hyplnkHome.Visible = false;
                    hyplnkReportsHome.Visible = false;
                    lblAge.Text = "";
                    break;
                default:
                    lblAge.Text = "";
                    hyplnkReportsHome.Visible = true;
                    break;

            }
            // provide filter buttons by age
            hyplnkAgeJuniors.NavigateUrl = String.Format(hyplnkAgeJuniors.NavigateUrl, smeetid);
            hyplnkAgeMasters.NavigateUrl = String.Format(hyplnkAgeMasters.NavigateUrl,  smeetid);
            hyplnkAgeALL.NavigateUrl = String.Format(hyplnkAgeALL.NavigateUrl, smeetid);
            switch (sage)
            {
                case "Juniors":
                    hyplnkAgeJuniors.BackColor = System.Drawing.Color.Gray;
                    break;
                case "Masters":
                    hyplnkAgeMasters.BackColor = System.Drawing.Color.Gray;
                    break;
                case "ALL":
                    hyplnkAgeALL.BackColor = System.Drawing.Color.Gray;
                    break;
                default:
                    break;

            }

        }
    }
}
