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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            string smeetname = "2015 National Championships ";
            if (smeetid == null) { smeetid = "NAT15"; }
         
            using (SqlConnection Sqlcon2 = new SqlConnection(sqldsEvents.ConnectionString))
            {
                smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }

            lblMeetName.Text = smeetname;
            lblMeetName.Visible = false; //now shown in header ribbon
            //right header slot
            lblHeaderMeet.Text = smeetname;
            lblHeaderCoach.Text = smeetid;
             
            // Handling Masters Vs Juniors VS Para vs ALL
            string sage = Request.QueryString["qage"];
            if (sage == null) { sage = "ALL"; }  // default to showing all events
            // Dress Age Filter buttons
            lnkButJuniors.PostBackUrl = String.Format(lnkButJuniors.PostBackUrl, smeetid);
            lnkButPara.PostBackUrl = String.Format(lnkButPara.PostBackUrl, smeetid);
            lnkButMasters.PostBackUrl = String.Format(lnkButMasters.PostBackUrl, smeetid);
            lnkButALL.PostBackUrl = String.Format(lnkButALL.PostBackUrl, smeetid);

        }
    }
}
