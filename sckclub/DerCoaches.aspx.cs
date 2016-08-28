using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using sckregLib;

namespace sckclub
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            string smeetname = "2015 National Championships ";
            if (smeetid == null) { smeetid = "NAT15"; }

            using (SqlConnection Sqlcon2 = new SqlConnection(SqlDS_Coaches.ConnectionString))
            {
                smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }

            lblMeetName.Text = smeetname;
            divForCoaches.Visible = false;
            hyplnkReportsHome.NavigateUrl = String.Format(hyplnkReportsHome.NavigateUrl, smeetid);
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
