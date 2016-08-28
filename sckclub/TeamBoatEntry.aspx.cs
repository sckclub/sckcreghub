using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using sckregLib;
using System.Text.RegularExpressions;

namespace sckreg
{
    public partial class TeamBoatEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string steamid = Request.QueryString["qclub"];
            if (steamid == null) { steamid = "NOCLUB"; }
            lblTeamID.Text = steamid;
            string smeetid = Request.QueryString["qmeet"];
            using (SqlConnection Sqlcon2 = new SqlConnection(sqldataTeamBoatsbyEvent.ConnectionString))
            {
                lblHeaderMeet.Text = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            string sPaddlerId = Request.QueryString["qpaddler"];
            string sPaddlerName = "NoPADDLR";
            if (sPaddlerId == null) { sPaddlerId = "NOPADDLER"; }
            using (SqlConnection Sqlcon3 = new SqlConnection(sqldataTeamBoatsbyEvent.ConnectionString))
            {
                sPaddlerName = clsSCKCREG.GetPaddlerName(Sqlcon3, sPaddlerId);
                lblPaddler.Text = sPaddlerName;
            }
            string sEventId = Request.QueryString["qev"];
            if (sEventId == null) { sEventId = "NOEVENT"; }
            int iSeats = -1; 
            string sEventCompetition="";
            using (SqlConnection Sqlcon4 = new SqlConnection(sqldataTeamBoatsbyEvent.ConnectionString))
            {
                lblEvent.Text = clsSCKCREG.GetEventName(Sqlcon4, sEventId, smeetid, ref iSeats, ref  sEventCompetition);
                lblBoatType.Text = sEventCompetition.ToString();
            }
            string sage = Request.QueryString["qage"];
            if (sage == null) { sage = "ALL"; }
            if (smeetid == null) { smeetid = "LPI14"; }
            if (smeetid == "MM14")
            {
                // for individual entries, only provide navigation back to paddler page
                hyplnkTeamEntries.Visible = false;
            }
            else
            {
                // Put query string values in Return Hyperlink
                hyplnkTeamEntries.NavigateUrl = String.Format(hyplnkTeamEntries.NavigateUrl, steamid, smeetid, sage);
            }
            // Put query string values in Return Hyperlink -- PaddlerEventsByPaddler.aspx?qmeet={0}&qclub={1}&qpaddler={2}&qfname={3}&qlname={4}
            hyplnkPaddlerPage.NavigateUrl = String.Format(hyplnkPaddlerPage.NavigateUrl, smeetid, steamid, Request.QueryString["qpaddler"].Trim(), sage);

            lblHeaderCoach.Text = steamid.ToUpper();
            // Populate the dropdowns
            lblThisPaddler.Text = sPaddlerName;
            

            if (!IsPostBack) 
            { 
                // when page first loaded, populate the dropdown
                PopPaddler2(smeetid, sEventId, steamid, sPaddlerId);
                //lnkButAddBoat.BackColor = System.Drawing.Color.Gray;
            }
            if (dropdownPaddler2.SelectedIndex > -1 && !IsPostBack)
            {
                
                txtBoatname.Text = sBoatNamefor2(lblThisPaddler.Text, dropdownPaddler2.SelectedItem.ToString());
            }
            //Action Buttons that post back:  TeamBoatEntry.aspx?qmeet={0}&qev={1}&qclub={2}&qpad={3}&qaction=ADD
            lnkButAddBoat.PostBackUrl = string.Format(lnkButAddBoat.PostBackUrl, smeetid, sEventId, steamid, sPaddlerId);
            lnkButDissolve2Boat.PostBackUrl = string.Format(lnkButDissolve2Boat.PostBackUrl, smeetid, sEventId, steamid, sPaddlerId);
            lnkButDelete2Boat.PostBackUrl = string.Format(lnkButDelete2Boat.PostBackUrl, smeetid, sEventId, steamid, sPaddlerId);
 
            lblMessage2Seater.Text = ""; // Message when saving/deleting/disolving 2 Seater Boats
        }

        public void PopPaddler2(string sMeetID, string sEventId, string sTeamID, string sPersonId)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection sqlconn = new SqlConnection(sqldataTeamBoatsbyEvent.ConnectionString);
            cmd.Connection = sqlconn;
            //Load everybody not in Event + Co-paddlers
            //cmd.CommandText = "sp_sPaddlersEligibleNotEnteredInEvent";
            // Load every body but the Focal Paddler
            cmd.CommandText = "sp_sPaddlersEligibleInEventOtherThanPaddler1";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@meetId", SqlDbType.VarChar, 25));
            cmd.Parameters.Add(new SqlParameter("@EventId", SqlDbType.VarChar, 25));
            cmd.Parameters.Add(new SqlParameter("@teamId", SqlDbType.VarChar, 25));
            cmd.Parameters.Add(new SqlParameter("@PersonId", SqlDbType.VarChar, 25));
            cmd.Parameters["@meetId"].Value = sMeetID.Trim();
            cmd.Parameters["@EventId"].Value = sEventId.Trim();
            cmd.Parameters["@teamId"].Value = sTeamID.Trim();
            cmd.Parameters["@PersonId"].Value = sPersonId.Trim();
            
            cmd.Connection.Open();

            SqlDataReader ddlValues;
            ddlValues = cmd.ExecuteReader();

            dropdownPaddler2.DataSource = ddlValues;
            dropdownPaddler2.DataValueField = "PaddlerID";
            dropdownPaddler2.DataTextField = "PaddlerName";
            dropdownPaddler2.DataBind();

            dropdownPaddler2.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            ddlValues.Close();

            // Now check if the paddler is laready in a boat'  ONLY WORKS FOR 2 SEATER
            string sPaddler2ID = "NOPADDLER";
            string sBoatName = "NOBOATNAME";
            cmd.CommandText = "sp_sGetBoatPartners";
          //uses The same Parameter as the last SP 
            SqlDataReader ddlValues2;
            ddlValues2 = cmd.ExecuteReader();
            if (ddlValues2.HasRows)
            {
                while (ddlValues2.Read())
                {
                    sBoatName = ddlValues2.GetString(1);
                    sPaddler2ID = ddlValues2.GetString(2);
                }
                txtBoatname.Text = sBoatName;
                //dropdownPaddler2.SelectedValue = sPaddler2ID;  // this didn't seem to work
                dropdownPaddler2.Items.FindByValue(sPaddler2ID).Selected = true;
            }
            else
            {
                dropdownPaddler2.SelectedIndex = 0;
            }
            ddlValues2.Close();
            
            

            cmd.Connection.Close();
            cmd.Connection.Dispose();
        }
        public string sBoatNamefor2(string pspaddler1, string psPaddler2)
        {
            //ASSUME the names are sperated by spaces
            if (psPaddler2.Trim().Length == 0) { psPaddler2 = "Ne ed"; }
            string sBothNames = pspaddler1 + " " + psPaddler2;
            char[] delimchar = { ' ' };
            string[] words = sBothNames.Split(delimchar);
            string sTag = "";
            //string pattern = "[a - z] + ";
            //Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase);
            string s1 = string.Empty;
            foreach (string s in words)
            {

                s1 = Regex.Replace(s, "[^a-zA-Z]+", string.Empty);
                if (s1.Length > 2)
                {
                    sTag = sTag + s1.Substring(0, 2).Trim();
                }
                else sTag = sTag + s1.Trim();
            }
            if (sTag.Length > 10) sTag = sTag.Substring(0, 10);
            return sTag;
        }
        protected void dropdownPaddler2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Update the BoatName based on the paddler names
            txtBoatname.Text=sBoatNamefor2(lblThisPaddler.Text, dropdownPaddler2.SelectedItem.ToString());
            if (dropdownPaddler2.SelectedIndex > 0)
            {
                lnkButAddBoat.Enabled = true;
                lnkButAddBoat.BackColor = System.Drawing.Color.Blue;
            }
            else
            {
                //lnkButAddBoat.Enabled = false;
                //lnkButAddBoat.BackColor = System.Drawing.Color.Gray;
            }
        }
        protected void lnkButAddBoat_Click(object sender, EventArgs e)
        {
            //Store the two paddler's entries
            using (SqlConnection Sqlcon2 = new SqlConnection(sqldataTeamBoatsbyEvent.ConnectionString))
            {

                string smeetid = Request.QueryString["qmeet"];
                string sPaddlerId = Request.QueryString["qpaddler"];
                string sEventId = Request.QueryString["qev"];
                string steamid = Request.QueryString["qclub"];
                if (steamid == null) { steamid = "NOCLUB"; }
                string sBoatName = txtBoatname.Text;
                string sPaddler2Id = dropdownPaddler2.SelectedValue;
                string sErr =""; string sErrDrops ="";
                System.Drawing.Color cMessageColor = System.Drawing.Color.Green;
                // First Drop all co paddlers in this paddler's boat - they will still be entered but with tag
                int Err2 = clsSCKCREG.Drop_BoatCoPaddlers(Sqlcon2, smeetid, sEventId, steamid, sPaddlerId, ref sErrDrops);
                // Now update with new BoatNames
                int iErr = clsSCKCREG.Save_PaddlerEntry(Sqlcon2, smeetid,  sPaddlerId, sEventId, sBoatName, ref sErr);

                if (sPaddler2Id.Trim().Length > 1 && (iErr == 0 | iErr==3))  // If all for the 1st paddler, proceed to save the entry for the 2nd
                {
                    iErr = clsSCKCREG.Save_PaddlerEntry(Sqlcon2, smeetid, sPaddler2Id, sEventId, sBoatName, ref sErr);
                }               
                switch (iErr)
                {
                    case 0:
                        sErr = "Entries successfully updated";
                        break;
                    case 2:
                        // Failed to delete an entry that needed to be deleted - error in sErr already
                        cMessageColor = System.Drawing.Color.Red;
                        break;
                    case 3:
                        // Entry already there all good - message in sErr already
                        cMessageColor = System.Drawing.Color.Blue;
                        break;
                    default:
                        sErr = "Unexpected Response";
                        cMessageColor = System.Drawing.Color.Blue;
                        break;
                }
                lblMessage2Seater.Text = sErr + " " + sErrDrops;
                lblMessage2Seater.ForeColor = cMessageColor;
                grdviewTeamBoarsInEvent.DataBind();  //update the table on top with the new entries info
            }
        }

        protected void lnkButDissolve2Boat_Click(object sender, EventArgs e)
        {
            //Keep the two paddler's entries, but remove the boat and leave them as single entries
            using (SqlConnection Sqlcon2 = new SqlConnection(sqldataTeamBoatsbyEvent.ConnectionString))
            {
                string smeetid = Request.QueryString["qmeet"];
                string sPaddlerId = Request.QueryString["qpaddler"];
                string sEventId = Request.QueryString["qev"];
                string steamid = Request.QueryString["qclub"];
                if (steamid == null) { steamid = "NOCLUB"; }
                string sBoatName = txtBoatname.Text;
                //string sPaddler2Id = dropdownPaddler2.SelectedValue;
                string sErrDrops = "";
                System.Drawing.Color cMessageColor = System.Drawing.Color.Green;
                // First Drop all co paddlers in this paddler's boat - they will still be entered but with tag
                int Err2 = clsSCKCREG.Drop_BoatCoPaddlers(Sqlcon2, smeetid, sEventId, steamid, sPaddlerId, ref sErrDrops);

                switch (Err2)
                {
                    case 0:

                        // Failed to delete an entry that needed to be deleted - error in sErrDrops already
                        cMessageColor = System.Drawing.Color.Red;
                        break;
                    default:
                        sErrDrops = "Success: " + Err2.ToString() + " paddlers released from this boat";
                        cMessageColor = System.Drawing.Color.Blue;
                        break;
                }
                lblMessage2Seater.Text =  sErrDrops;
                lblMessage2Seater.ForeColor = cMessageColor;
                grdviewTeamBoarsInEvent.DataBind();  //update the table on top with the new entries info
                dropdownPaddler2.SelectedIndex=0; // set to empty
                txtBoatname.Text = sBoatNamefor2(lblThisPaddler.Text, "");
            }
        }

        protected void lnkButDelete2Boat_Click(object sender, EventArgs e)
        {
            //Deletes current entries from Event entrirely
            using (SqlConnection Sqlcon2 = new SqlConnection(sqldataTeamBoatsbyEvent.ConnectionString))
            {

                string smeetid = Request.QueryString["qmeet"];
                string sPaddlerId = Request.QueryString["qpaddler"];
                string sEventId = Request.QueryString["qev"];
                string steamid = Request.QueryString["qclub"];
                if (steamid == null) { steamid = "NOCLUB"; }
                string sPaddler2Id = dropdownPaddler2.SelectedValue;
                string sErr = ""; string sErrDrops = "";
                System.Drawing.Color cMessageColor = System.Drawing.Color.Green;
                // Remove 1st Paddler
                int iErr = clsSCKCREG.Delete_PaddlerEntry(Sqlcon2, smeetid, sPaddlerId, sEventId, ref sErr);

                if (sPaddler2Id.Trim().Length > 1 && (iErr == 0 | iErr == 3))  // If all for the 1st paddler, proceed to save the entry for the 2nd
                {
                    iErr = clsSCKCREG.Delete_PaddlerEntry(Sqlcon2, smeetid, sPaddler2Id, sEventId,  ref sErr);
                }
                switch (iErr)
                {
                    case 0:
                        sErr = "Entries successfully removed";
                        break;
                    case 2:
                        // Failed to delete an entry that needed to be deleted - error in sErr already
                        cMessageColor = System.Drawing.Color.Red;
                        break;
                    case 3:
                        // Entry already there all good - message in sErr already
                        cMessageColor = System.Drawing.Color.Blue;
                        break;
                    default:
                        sErr = "Unexpected Response";
                        cMessageColor = System.Drawing.Color.Blue;
                        break;
                }
                lblMessage2Seater.Text = sErr + " " + sErrDrops;
                lblMessage2Seater.ForeColor = cMessageColor;
                grdviewTeamBoarsInEvent.DataBind();  //update the table on top with the new entries info
                dropdownPaddler2.SelectedIndex = 0; // set to empty
                txtBoatname.Text = sBoatNamefor2(lblThisPaddler.Text, "");
            }
        }


    }
}
