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
using System.Text.RegularExpressions;

namespace sckreg
{
    public partial class Paddlers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid == null) { smeetid = "LPI14"; }
            string steamid = Request.QueryString["qclub"];
            if (steamid == null) { steamid = "NOCLUB"; } else { steamid = steamid.Trim(); }
            string sqcc = Request.QueryString["qcc"];
            if (sqcc == null) { sqcc = "noqcc"; }
            using (SqlConnection Sqlcon2 = new SqlConnection(sqlDSPaddlers.ConnectionString))
            {
                lblHeaderMeet.Text = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            using (SqlConnection Sqlcon3 = new SqlConnection(sqlDSPaddlers.ConnectionString))
            {
                string sCoachName = "TeamID: " +steamid; // in case qcc value not available, default to the teamId
                if (sqcc != "noqcc") { sCoachName = "Entries Coach: " + clsSCKCREG.GetCoachName(Sqlcon3, sqcc); }
                lblHeaderCoach.Text =  sCoachName;
            }
            // provide filter buttons by age
            string sage = Request.QueryString["qage"];
            if (sage == null) { sage = "ALL"; }
            //Age Filters
            hyplnkAgeJuniors.NavigateUrl = String.Format(hyplnkAgeJuniors.NavigateUrl, steamid, smeetid);
            hyplnkAgeMasters.NavigateUrl = String.Format(hyplnkAgeMasters.NavigateUrl, steamid, smeetid);
            hyplnkAgeALL.NavigateUrl = String.Format(hyplnkAgeALL.NavigateUrl, steamid, smeetid);
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

            //DEAD  if (sqAge == null) { smeetid = "A"; }
            lnkbutJuniors.PostBackUrl = String.Format(lnkbutJuniors.PostBackUrl, steamid, smeetid);
            lnkbutMasters.PostBackUrl = String.Format(lnkbutMasters.PostBackUrl, steamid, smeetid);
            lnkbutALL.PostBackUrl = String.Format(lnkbutALL.PostBackUrl, steamid, smeetid);
            // Put query string values in Return Hyperlink
            hyplnkEvents.NavigateUrl = String.Format(hyplnkEvents.NavigateUrl, steamid, smeetid, sage);
            hypLinkTeamBoats.NavigateUrl = String.Format(hypLinkTeamBoats.NavigateUrl, steamid, smeetid, sage);
            hyplnkTeamEntries.NavigateUrl = String.Format(hyplnkTeamEntries.NavigateUrl, steamid, smeetid, sage);
            hyplnkTeamEntries0.NavigateUrl = String.Format(hyplnkTeamEntries0.NavigateUrl, steamid, smeetid, sage);
            
            lblMessage.Text="";
            lblMembership.Visible = false;
        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox lastName=null;
                try
                {

                    // Attempts to Add new Paddler to Club's records
                    int retVal = 0;
                    lastName = (TextBox)GridView2.FooterRow.FindControl("txtNewlastName");
                    TextBox firstName = (TextBox)GridView2.FooterRow.FindControl("txtNewfirstName");
                    TextBox teamId = (TextBox)GridView2.FooterRow.FindControl("txtNewteamId");
                    DropDownList genderid = (DropDownList)GridView2.FooterRow.FindControl("txtNewgenderid");
                    TextBox birthday = (TextBox)GridView2.FooterRow.FindControl("txtNewbirthday");
    
                    using (SqlConnection Sqlcon = new SqlConnection(sqlDSPaddlers.ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            Sqlcon.Open();
                            cmd.Connection = Sqlcon;
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "iPaddler";
                            cmd.Parameters.Add(new SqlParameter("@lastName", SqlDbType.VarChar, 250));
                            cmd.Parameters.Add(new SqlParameter("@firstName", SqlDbType.VarChar, 250));
                            cmd.Parameters.Add(new SqlParameter("@teamId", SqlDbType.VarChar, 250));
                            cmd.Parameters.Add(new SqlParameter("@birthday", SqlDbType.DateTime, 100));
                            cmd.Parameters.Add(new SqlParameter("@genderid", SqlDbType.VarChar, 1));
                            cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;
                            cmd.Parameters["@lastName"].Value = lastName.Text.Trim();
                            cmd.Parameters["@firstName"].Value = firstName.Text.Trim();
                            cmd.Parameters["@teamId"].Value = teamId.Text.Trim();
                            cmd.Parameters["@birthday"].Value = birthday.Text.Trim();
                            cmd.Parameters["@genderid"].Value = genderid.SelectedValue;
                            cmd.ExecuteNonQuery();
                            retVal = (int)cmd.Parameters["@pIntErrDescOut"].Value;
                        }
                    }
                    if (retVal == 2)
                    {
                        lblMessage.Text = String.Format("Paddler not added - id {0}.{1}{2} already exists!", teamId.Text.Trim(), lastName.Text.Substring(0, 2), firstName.Text.Substring(0, 2));
                        lblMessage.ForeColor = System.Drawing.Color.Maroon;
                    }
                    else
                    {
                        GridView2.EditIndex = -1;
                        GridView2.DataBind(); // Force Gridview refresh
                        lblMessage.Text = "Paddler added successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                }
                catch (Exception excp)
                {
                    if (lastName.Text.Length == 0)
                    {
                        lblMessage.Text = String.Format("Paddler not added - Last Name missing");
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblMessage.Text = String.Format("Paddler not added - {0}", excp.Message);
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }

                }

            }
        }

 

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
            // we will put the teamId from the query string in the Add teamID textbox in the footer
                //TextBox TBteamId = (TextBox)GridView2.FooterRow.FindControl("txtNewteamId");
                //TextBox TBteamId = (TextBox) GridView2.FindControl("txtNewteamId");
                //TextBox TBteamId = (TextBox)GridView2.FooterRow.FindControl("teamId");
                //TBteamId.Text = Request.QueryString["qclub"];
            }
        }

        protected void lnkbutJuniors_Click(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
