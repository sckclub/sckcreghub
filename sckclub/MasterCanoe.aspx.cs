using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace sckreg
{
    public partial class MasterCanoe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblAddFindMessage.Text="";
        }

        protected void butAddFind_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //lblAddFindMessage.Text = "You pressed the button";
            string smeetid = Request.QueryString["qmeet"];
            if (smeetid == null) smeetid="MM14";
                TextBox lastName = null;
                // Make sure the MM/DD/YYYY DOB string is as valid DateTime
                try
                {
                    //int iDay = Convert.ToInt32(txtDOB.Text.Substring(4,2));
                    //int iMonth = Convert.ToInt32(txtDOB.Text.Substring(1,2));
                    //int iYear = Convert.ToInt32(txtDOB.Text.Substring(7,4));
                    DateTime dtDOB = Convert.ToDateTime(txtDOB.Text);
                    try
                    {

                        // Attempts to Add new Paddler to Club's records
                        int retVal = 0;
                        lastName = txtLast;
                        TextBox firstName = txtFirst;
                        TextBox Team = txtTeam;
                        DropDownList genderId = DdropGender;
                        TextBox birthday = txtDOB;
                        TextBox Country = txtCountry;

                        using (SqlConnection Sqlcon = new SqlConnection(sqlDSPaddlers.ConnectionString))
                        {
                            using (SqlCommand cmd = new SqlCommand())
                            {
                                Sqlcon.Open();
                                cmd.Connection = Sqlcon;
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.CommandText = "sp_iPaddlerAddFind";
                                cmd.Parameters.Add(new SqlParameter("@MeetId", SqlDbType.VarChar, 50));
                                cmd.Parameters.Add(new SqlParameter("@Last", SqlDbType.VarChar, 50));
                                cmd.Parameters.Add(new SqlParameter("@First", SqlDbType.VarChar, 50));
                                cmd.Parameters.Add(new SqlParameter("@GenderId", SqlDbType.VarChar, 2));
                                cmd.Parameters.Add(new SqlParameter("@DOB", SqlDbType.DateTime, 100));
                                cmd.Parameters.Add(new SqlParameter("@Team", SqlDbType.VarChar, 100));
                                cmd.Parameters.Add(new SqlParameter("@Country", SqlDbType.VarChar, 100));
                                cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;
                                cmd.Parameters["@MeetId"].Value = smeetid;
                                cmd.Parameters["@Last"].Value = lastName.Text.Trim();
                                cmd.Parameters["@First"].Value = firstName.Text.Trim();
                                cmd.Parameters["@GenderId"].Value = genderId.SelectedValue;
                                cmd.Parameters["@DOB"].Value = birthday.Text.Trim();
                                cmd.Parameters["@Team"].Value = Team.Text.Trim();
                                cmd.Parameters["@Country"].Value = Country.Text.Trim();
                                cmd.ExecuteNonQuery();
                                retVal = (int)cmd.Parameters["@pIntErrDescOut"].Value;
                            }
                        }
                        // Make Paddler Table elements visible
                        lblPaddlerFound.Visible = true;
                        if (retVal == 2)
                        {
                            lblAddFindMessage.Text = String.Format("Paddler with same name and date of birth found.", Team.Text.Trim(), lastName.Text.Substring(0, 2), firstName.Text.Substring(0, 2));
                            lblAddFindMessage.ForeColor = System.Drawing.Color.Maroon;
                        }
                        else
                        {
                            
                            grdPaddler.EditIndex = -1;
                            grdPaddler.DataBind(); // Force Gridview refresh
                            lblAddFindMessage.Text = "Paddler added successfully!";
                            lblAddFindMessage.ForeColor = System.Drawing.Color.Green;
                        }
                    }
                    catch (Exception excp)
                    {
                        if (lastName.Text.Length == 0)
                        {
                            lblAddFindMessage.Text = String.Format("Paddler not added - Last Name missing");
                            lblAddFindMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            lblAddFindMessage.Text = String.Format("Paddler not added - {0}", excp.Message);
                            lblAddFindMessage.ForeColor = System.Drawing.Color.Red;
                        }

                    }
                } //check 33/44/1999 is a date
                catch {
                    //Though this catch works, the grdPaddler will try and load any way and blow on date time
                    // grdPaddler.Enabled = false; this didn't work
                    txtDOB.Text = "1/1/1901";  //so give it a valid date it will never find PJMFIX - ugly and maybe not internation safe
                    lblAddFindMessage.Text = String.Format("Please add a valid date for your date of birth");
                    lblAddFindMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
