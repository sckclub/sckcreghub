﻿using System;
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
    public partial class AllPaddlers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid != null)
            {

                string smeetname = "2014 Ted Houk Regatta ";
                if (smeetid == null) { smeetid = "LPI14"; }

                using (SqlConnection Sqlcon2 = new SqlConnection(sqlALLPaddlers.ConnectionString))
                {
                    smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
                }
                lblMeetName.Text = smeetname;
                //right header slot
                lblHeaderMeet.Text = smeetname;
                lblHeaderCoach.Text = smeetid;
                hyplnkReportsHome.NavigateUrl = String.Format(hyplnkReportsHome.NavigateUrl, smeetid);

            }
        }
    }
}
