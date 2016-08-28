using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using sckregLib;


namespace sckreg
{

    public partial class WebForm2 : System.Web.UI.Page
    {
 

        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid == null) { smeetid = "LPI14"; }
            using (SqlConnection Sqlcon2 = new SqlConnection(sqAllowedAndEntered.ConnectionString))
            {
                lblHeaderMeet.Text = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);                  
            }
            string sPaddlerId = Request.QueryString["qpaddler"];
            string sPaddlerName = "NoPADDLR";
            if (sPaddlerId == null) { sPaddlerId = "NOPADDLER"; }
            using (SqlConnection Sqlcon3 = new SqlConnection(sqAllowedAndEntered.ConnectionString))
            {
                sPaddlerName = clsSCKCREG.GetPaddlerName(Sqlcon3, sPaddlerId);

            }
            string sDISC = Request.QueryString["qDISC"];
            string steamid = Request.QueryString["qclub"];
            if (steamid == null) { steamid = "NOCLUB"; }
            lblPageTitle.Text = "Entries for " + sPaddlerName + " from " + steamid;
            // Put query string values in Return Hyperlink
            string sage = Request.QueryString["qage"];
            if (sage == null) { sage = "ALL"; }
            if(smeetid=="MM14")
            {
                // for individual entries, no Team page
                hypTeamPaddlers.Visible=false;
                hyplnkPaddlers.Visible = false;
                lnkIndivPayment.Visible = true;
                hyplnkOrderOfEvents.Visible = true;
                hyplnkOrderOfEvents.NavigateUrl = String.Format(hyplnkOrderOfEvents.NavigateUrl, steamid, smeetid);
                  lblEntryConstraints.Visible = true;
                //grdvPaddlerEvents.DataBind(); //Force summary to update too
                //Make payments button div visible
                divIndividualPayments.Visible = true;
                int rowCount = grdvPaddlerEvents.Rows.Count;
                if (rowCount == 0)
                {
                    lblIndivPayments.Visible = false;
                    lnkIndivPayment.BackColor = System.Drawing.Color.Gray;
                    lnkIndivPayment.Enabled = false;

                }
                else
                {
                    lblIndivPayments.Visible = true;
                    lnkIndivPayment.Enabled = true;
                    lnkIndivPayment.BackColor = System.Drawing.ColorTranslator.FromHtml("#0066CC");
                }
            }
            else
            {
                // Put query string values in Return Hyperlink
                hypTeamPaddlers.NavigateUrl = String.Format(hypTeamPaddlers.NavigateUrl, steamid, smeetid, sage);
                 divIndividualPayments.Visible = false;
                grdvPaddlerEvents.DataBind(); //Force summary to update too
                int rowCount = grdvPaddlerEvents.Rows.Count;
            }
            // Put query string values in Return Hyperlink
            hyplnkPaddlers.NavigateUrl = String.Format(hyplnkPaddlers.NavigateUrl, steamid, smeetid, sage);
            hyplnkPaddlers2.NavigateUrl = String.Format(hyplnkPaddlers2.NavigateUrl, steamid, smeetid, sage);
            lblMessage.Text = "";
            //right header slot
            lblHeaderCoach.Text = steamid.ToUpper();
            // Put query strings in Filter Buttons lnkbutKayak
            string sqPaddler = Request.QueryString["qpaddler"];
            lnkbutKayak.PostBackUrl = String.Format(lnkbutKayak.PostBackUrl, steamid, sqPaddler, smeetid, sage);
            // Put query strings in Filter Buttons lnkbutCanoe
            lnkbutCanoe.PostBackUrl = String.Format(lnkbutCanoe.PostBackUrl, steamid, sqPaddler, smeetid, sage);
            // Put query strings in Filter Buttons lnkbutPara
            lnkbutPara.PostBackUrl = String.Format(lnkbutPara.PostBackUrl, steamid, sqPaddler, smeetid, sage);
            // Put query strings in Filter Buttons lnkbutALL
            lnkbutALL.PostBackUrl = String.Format(lnkbutALL.PostBackUrl, steamid, sqPaddler, smeetid, sage);

        
        }

        protected void grvwAllowablePaddlerEvents_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvwAllowablePaddlerEvents.EditIndex = e.NewEditIndex;
            grvwAllowablePaddlerEvents.DataBind();
        }
        protected void grvwAllowablePaddlerEvents_RowCommand(object sender, GridViewCommandEventArgs e) 
        {
            if (e.CommandName == "DoUpdate")
            {
                // Update the Entries by adding or deleting a row
                // Retrieve the row index stored in the 
                // CommandArgument property.
                int iRowIndex = Convert.ToInt32(e.CommandArgument);
                //GridViewRow row = grvwAllowablePaddlerEvents.Rows[index];
                CheckBox bEntered = (CheckBox)grvwAllowablePaddlerEvents.Rows[iRowIndex].FindControl("cboxEditEntered");
                TextBox teamboat = (TextBox)grvwAllowablePaddlerEvents.Rows[iRowIndex].FindControl("txtboxEditteamboat");
                Label PaddlerID = (Label)grvwAllowablePaddlerEvents.Rows[iRowIndex].FindControl("lblEditPaddlerID");
                Label EventNum = (Label)grvwAllowablePaddlerEvents.Rows[iRowIndex].FindControl("lblEditEventNum");
                bool boolEntered = bEntered.Checked; // short flag for idenifiying boat when team boats
                string steamboat = (teamboat.Text.Length > 0) ? teamboat.Text : " "; 
                string sPaddlerID = PaddlerID.Text;
                string sEventNum = EventNum.Text;
                try
                {
                    string smeetid = Request.QueryString["qmeet"];
                    if (smeetid == null) { smeetid = "LPI14"; }

                    // Attempts to Add/Remove an Entry Record for this paddler, in this event, in this Meet
                    int retVal = 0;
                    lblMessage.Text = "";
                    using (SqlConnection Sqlcon = new SqlConnection(sqAllowedAndEntered.ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            Sqlcon.Open();
                            cmd.Connection = Sqlcon;
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "sp_idEntry";
                            cmd.Parameters.Add(new SqlParameter("@MeetID", SqlDbType.VarChar, 50));
                            cmd.Parameters.Add(new SqlParameter("@bEnterPaddler", SqlDbType.Bit, 0));
                            cmd.Parameters.Add(new SqlParameter("@personId", SqlDbType.VarChar, 50));
                            cmd.Parameters.Add(new SqlParameter("@eventId", SqlDbType.VarChar, 50));
                            cmd.Parameters.Add(new SqlParameter("@boatgroup", SqlDbType.VarChar, 10));
                            cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;
                            cmd.Parameters["@MeetID"].Value = smeetid; // "TH14";  //should be dynamic in future versions
                            cmd.Parameters["@bEnterPaddler"].Value = boolEntered.ToString();
                            cmd.Parameters["@personId"].Value = sPaddlerID.Trim();
                            cmd.Parameters["@eventId"].Value = sEventNum.Trim();
                            cmd.Parameters["@boatgroup"].Value = steamboat.Trim().Length > 1 ? steamboat.Trim() : " ";
                            cmd.ExecuteNonQuery();
                            retVal = (int)cmd.Parameters["@pIntErrDescOut"].Value;
                        }
                    }
                    if (retVal == 2)
                    {
                        lblMessage.Text = String.Format("Failed to remove entry for {0} in Event {1} ", sPaddlerID, sEventNum);
                    }
                    else
                    {
                        grvwAllowablePaddlerEvents.EditIndex = -1;
                        grvwAllowablePaddlerEvents.DataBind(); // Force Gridview refresh
                        lblMessage.Text = "Entry successfully updated!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        try{
                            grdvPaddlerEvents.DataBind(); //Force summary to update too
                        }
                        catch(Exception ex)
                        {
                             Response.Write(ex.Message);
                        }  
                        int rowCount = grdvPaddlerEvents.Rows.Count;
                        if (rowCount == 0)
                        {
                            lblIndivPayments.Visible = false;
                            lnkIndivPayment.BackColor = System.Drawing.Color.Gray;
                            lnkIndivPayment.Enabled = false;
                        }
                        else {
                            lblIndivPayments.Visible = true;
                            lnkIndivPayment.Enabled = true;
                            lnkIndivPayment.BackColor = System.Drawing.ColorTranslator.FromHtml("#0066CC");
                        }
                    }
                }
                catch (Exception excp)
                {                 
                    lblMessage.Text = String.Format("Entry not updated - {0}", excp.Message);
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        protected void grvwAllowablePaddlerEvents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            CheckBox bEntered = (CheckBox)grvwAllowablePaddlerEvents.Rows[e.RowIndex].FindControl("cboxEditEntered");
            TextBox teamboat = (TextBox)grvwAllowablePaddlerEvents.Rows[e.RowIndex].FindControl("txtboxEditteamboat");
            Label PaddlerID = (Label)grvwAllowablePaddlerEvents.Rows[e.RowIndex].FindControl("lblEditPaddlerID");
            Label EventNum = (Label)grvwAllowablePaddlerEvents.Rows[e.RowIndex].FindControl("lblEditEventNum");
            bool boolEntered = bEntered.Checked; // short flag for idenifiying boat when team boats
            string steamboat = teamboat.Text;
            string sPaddlerID = PaddlerID.Text;
            string sEventNum = EventNum.Text; // typically E103
            // Set up commands here - see paddlers code behind
            sqAllowedAndEntered.UpdateParameters.Clear();
            sqAllowedAndEntered.UpdateParameters.Add(new Parameter("MeetID", TypeCode.String, "TH14"));
            //sqAllowedAndEntered.UpdateParameters["MeetID"].DefaultValue= "TH14";
           //sqAllowedAndEntered.UpdateParameters["bEnterPaddler"].DefaultValue = boolEntered.ToString();
            sqAllowedAndEntered.UpdateParameters.Add(new Parameter("bEnterPaddler", TypeCode.String, boolEntered.ToString()));
           sqAllowedAndEntered.UpdateParameters.Add(new Parameter("personId", TypeCode.String, sPaddlerID));
           sqAllowedAndEntered.UpdateParameters.Add(new Parameter("eventId", TypeCode.String, sEventNum));
           sqAllowedAndEntered.UpdateParameters.Add(new Parameter("boatgroup", TypeCode.String, steamboat));
           //sqAllowedAndEntered.UpdateParameters.Add(new Parameter("personId", TypeCode.String, sEventNum));

           //       </UpdateParameters>
            //<asp:Parameter Name="MeetID" Type="String" />
            //<asp:Parameter Name="bEnterPaddler" Type="Boolean" />
            //<asp:Parameter Name="personId" Type="String" />
            //<asp:Parameter Name="eventId" Type="String" />
            //<asp:Parameter Name="boatgroup" Type="String" />
            //<asp:Parameter Direction="InputOutput" Name="pIntErrDescOut" Type="Int32" />
 
             sqAllowedAndEntered.DataBind();
            grvwAllowablePaddlerEvents.EditIndex = -1;
            grvwAllowablePaddlerEvents.DataBind();
        }
    
        protected void grvwAllowablePaddlerEvents_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvwAllowablePaddlerEvents.EditIndex = -1;
            grvwAllowablePaddlerEvents.DataBind();
        }
        protected void gvPaddler_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grvwAllowablePaddlerEvents_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

    
}
