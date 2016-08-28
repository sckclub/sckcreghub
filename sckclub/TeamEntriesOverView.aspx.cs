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
    public partial class TeamEntriesOverView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           // lblMeetName.Text = smeetid.ToString() == "LPI14" ? "2014 Lake Placid International Regatta " : "Ted Houk 2014 ";
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid == null) { smeetid = "LPI14"; }
            using (SqlConnection Sqlcon2 = new SqlConnection(sqlTeamsEntriesOverView.ConnectionString))
            {
                lblHeaderMeet.Text = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            lblMeetName.Text = lblHeaderMeet.Text;
            lblMeetName.Visible = false; //now shown in header ribbon
            //right header slot
            lblHeaderCoach.Text = smeetid;
            /*
            // I belive itis bad practice to data bind on load, becaose RowsCoomand  but
            //gvTeamTotals.DataBind();
            gvTeamTotals.Rows[gvTeamTotals.Rows.Count - 1].Font.Bold = true;
            gvTeamTotals.Rows[gvTeamTotals.Rows.Count - 1].Cells[0].Text = "xTotals";
            */
            ViewState["gvTeamTotalsCOUNT"] = gvTeamTotals.Rows.Count;  // will need reapply on sort
            hyplnkReportsHome.NavigateUrl = String.Format(hyplnkReportsHome.NavigateUrl, smeetid);
            hyplnkReportsHome.Visible = true;  // UNITL MAIN REPORTS PAGE IS READY

            
        }

        protected void gvTeamTotals_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvTeamTotals_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            /* •——————————————————————————————————————————————————————•
               | This code to reapply bolding of last column                                                  |
               •——————————————————————————————————————————————————————• */
            /*int igvRowCount = (Convert.ToInt32(ViewState["gvTeamTotalsCOUNT"]));
            // Cells[0] are all empty for the hyperlink column!
            if (e.Row.Cells[2].Text == "Totals")
            {
             
                GridViewRow Row = e.Row;
                Row.Font.Bold = true;
                Row.Cells[0].Text = "Totals";  // GetDataItem rid of hyperlinked Totals
                //Row.Cells[0]. = false;
               
            }
             */
        }
    }
}
