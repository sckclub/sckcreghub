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
    public partial class TeamEntries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string steamid = Request.QueryString["qclub"];
            if (steamid == null) { steamid = "NOCLUB"; }
            string sclubname ="NoClubName";
            using (SqlConnection Sqlcon3 = new SqlConnection(sqlTeamEntries.ConnectionString))
            {
                sclubname = clsSCKCREG.GetClubName(Sqlcon3, steamid);
            }
            string smeetid = Request.QueryString["qmeet"];
            string smeetshortname = "2014 TedHouk";
            if (smeetid == null) { smeetid = "LPI14"; }
            divInternational.Visible = false;
            divNational.Visible = false;
            string smeetname = "2014 Ted Houk Regatta ";
            string sage = Request.QueryString["qage"];
            if (sage == null) { sage = "ALL"; }
                        int iInvoiceID = 0;
                        int iMastersPara = 0;
                        int iPartial = 0;
                        int iFull = 0;
                        string sTotalFees = "";

            using (SqlConnection Sqlcon2 = new SqlConnection(sqlTeamEntries.ConnectionString))
            {
                smeetname = clsSCKCREG.GetMeetName(Sqlcon2, smeetid);
            }
            if (smeetid != null)
            {
                //Blue Box Header divs
                divTH.Visible = false;
                divNAT15.Visible = false;
                divNT16.Visible = false;
                //Payments divs
                divPaymentsTH16.Visible = false;
                divPaymentsNAT15.Visible = false;
                divPaymentsTH15.Visible = false;
                divPaymentsNT16.Visible = false;
                //Waivers Divs
                divwaiversTH16.Visible = false;
                divwaiversNAT15.Visible = false;
                divwaiversNT16.Visible = false;
                switch (smeetid.ToString())
                {
                    case "NT16":
                        smeetshortname = "2016 Nationals";
                        divNT16.Visible = true;
                        divPaymentsNT16.Visible = true;
                        divwaiversNT16.Visible = true;
                        int iErr2 = 0;
                        //Create record of calculated payments
                        using (SqlConnection Sqlcon4 = new SqlConnection(sqlTeamEntries.ConnectionString))
                        {
                            iErr2 = clsSCKCREG.Get3TierInvoiceCounts(Sqlcon4, smeetid, steamid, sage, ref iInvoiceID, ref iMastersPara, ref iPartial, ref iFull, ref sTotalFees);

                        }
                        break;
                    case "TH16":
                        smeetshortname = "2016 Ted Houk";
                        divTH15.Visible = true;
                        divPaymentsTH16.Visible = true;
                        divwaiversTH16.Visible = true;
                        break;
                    case "NAT15":
                        smeetshortname = "2015 Nationals";
                        divNAT15.Visible = true;
                        divPaymentsNAT15.Visible = true;
                        int iErr = 0;
                        //Create record of calculated payments
                         using (SqlConnection Sqlcon4 = new SqlConnection(sqlTeamEntries.ConnectionString))
                        {
                            iErr = clsSCKCREG.Get3TierInvoiceCounts(Sqlcon4, smeetid,  steamid, sage, ref iInvoiceID, ref iMastersPara, ref iPartial, ref iFull, ref sTotalFees);
                            
                        }

                        break;
                    case "TH15":
                        smeetshortname = "2015 Ted Houk";
                        divTH15.Visible = true;
                        divPaymentsTH15.Visible = true;
                        break;
                    case "TR15":
                        smeetshortname = "2015 US Trials";
                        divNational.Visible = true;
                        break;
                    case "LPI14":
                        smeetshortname = "2014 LPI";
                        divInternational.Visible = true;
                        break;
                    case "MM14":
                        smeetshortname = "2014 CMM";
                        divInternational.Visible = true;
                        break;
                    default:
                        smeetshortname = "2014 TedHouk";
                        divInternational.Visible = true;
                        break;
                }

                //header slots
                lblHeaderMeet.Text = smeetname;
                lblHeaderCoach.Text = steamid;
                lblShortRegatta.Text = smeetshortname;
                lblClub.Text = sclubname;


                // Put query string values in Return Hyperlink
                hypTeamPaddlers.NavigateUrl = String.Format(hypTeamPaddlers.NavigateUrl, steamid, smeetid, sage);
                // Put query string values in Return Hyperlink
                hyplnkPaddlers.NavigateUrl = String.Format(hyplnkPaddlers.NavigateUrl, steamid, smeetid, sage);
                // Payments HyperLink
                string sBatchID = iInvoiceID.ToString(); // "123456";
                string siFullEntries = iFull.ToString(); // "17";
                string siPartialEntries = iPartial.ToString();// "5";
                string siMastersEntries = iMastersPara.ToString(); // "12";
                
                  lnkbutPayments.PostBackUrl = String.Format(lnkbutPayments.PostBackUrl, sclubname, siFullEntries, siPartialEntries, siMastersEntries, sTotalFees, steamid, smeetid, sage);

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

                 //Dead
                lnkbutJuniors.PostBackUrl = String.Format(lnkbutJuniors.PostBackUrl, steamid, smeetid);
                 lnkbutMasters.PostBackUrl = String.Format(lnkbutMasters.PostBackUrl, steamid, smeetid);
                lnkbutALL.PostBackUrl = String.Format(lnkbutALL.PostBackUrl, steamid, smeetid);

           }
        }

        protected void lnkbutPayments_Click(object sender, EventArgs e)
        {
            string sQueryString = "";
            sQueryString = this.lnkbutPayments.PostBackUrl.Substring(17,  lnkbutPayments.PostBackUrl.ToString().Length - 17);
            //http://www.sdckt.net/team-payment?1={0}&2={1}&3={2}&4={3}&5={4}&6={5}

           System.Collections.Specialized.NameValueCollection sQScol = HttpUtility.ParseQueryString(sQueryString);
           string sClubName = sQScol["1"];
           int iFullCount = Convert.ToInt32(sQScol["2"]);
           int iPartialCount = Convert.ToInt32(sQScol["3"]); //NAT  Juniors/Seniors 1-3 events
           int iSpecialCount = Convert.ToInt32(sQScol["4"]); // NAT15: Masters and Paracanoe
           string sTotalFees = sQScol["5"];
           string sTeamId = sQScol["6"];
           string smeetId = sQScol["qmeet"];
           string sage = sQScol["qage"];
           int iRetVal = 0;

           string  sInvoiceID ="3472134";
           // Record this button press and its parameters
           using (SqlConnection Sqlcon1 = new SqlConnection(sqlTeamEntries.ConnectionString))
           {
               iRetVal = clsSCKCREG.Insert3TierInvoiceRecords(Sqlcon1, smeetId, sTeamId, sage, iFullCount, iPartialCount, iSpecialCount, sTotalFees);
           }
           if (iRetVal > 0) { sInvoiceID = iRetVal.ToString(); }
            string sSDCKTPaymentsURL="";
           switch (smeetId.ToString())
                {
               case "NT16":
                        sSDCKTPaymentsURL = "https://estore.riversportokc.org/Content/Commerce/Products/DisplayProducts.aspx?ProductGroupCode=2030&ProductCategoryCode=2172&1={0}&2={1}&3={2}&4={3}&5={4}&6={5}";
                       break;
               case "NAT15":
                       sSDCKTPaymentsURL = "http://www.sdckt.net/team-payment?1={0}&2={1}&3={2}&4={3}&5={4}&6={5}";
                       break;
                }
           sSDCKTPaymentsURL =  String.Format(sSDCKTPaymentsURL, sClubName, iFullCount, iPartialCount, iSpecialCount, sInvoiceID, sTeamId); 
            Response.Redirect(sSDCKTPaymentsURL, true);

        }



    }
}
