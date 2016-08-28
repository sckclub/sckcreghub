using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace sckreg
{
    public partial class Trials2015 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string smeetid = "TR15";
            string sClub = "Club not found";
            string sClubID = "NoClub";
            string sCoachName = "No Coach";
            string sCoachCode = Request.QueryString["qcc"]; // Code manually assigned Club/Coach Combination e.g., "f67b99"

            if (sCoachCode != null)
            {
                switch (sCoachCode.ToString())
                {
                    case "pjm15":
                        sCoachName = "Philip Coach ";
                        sClub = "Seattle Canoe and Kayak Club";
                        sClubID =  "SCKC";
                        break;
                    case "to15":
                        sCoachName = "Tamara Oki ";
                        sClub = "Seattle Canoe and Kayak Club";
                        sClubID = "SCKC";
                        break;
                    case "f67b99":
                        sCoachName = "Shaun Caven";
                        sClub = "Oklahoma Boathouse Foundation";
                        sClubID = "OKCRS";
                        break;
                    case "gh56ew":
                        sCoachName = "Tami Czuleger";
                        sClub = "Gig Harbor Canoe and Kayak Racing Team";
                        sClubID = "GHCKRT";
                        break;
                    case "ln98wl":
                        sCoachName = "Claudiu Ciur";
                        sClub = "Lanier Canoe and Kayak Club";
                        sClubID = "LCKC";
                        break;
                    case "sd15pz":
                        sCoachName = "Chris Barlow";
                        sClub = "San Diego Canoe and Kayak Team";
                        sClubID = "SDCKT";
                        break;
                    case "kc15gm":
                        sCoachName = "Dan Henderson";
                        sClub = "Kenmore~Cascade Canoe & Kayak Team";
                        sClubID = "KCnKC"; /*"KCCKT";  */
                        break;
                    case "kp15na":
                        sCoachName = "Frem Mechini";
                        sClub = "Keystone Paddlers";
                        sClubID = "KP";
                        break;
                    case "hc15ge":
                        sCoachName = "Zsolt Szadovszki";
                        sClub = "Hawaii Canoe Kayak Club";
                        sClubID = "HCKT";
                        break;
                    case "Ik15nf":
                        sCoachName = "Shelley Oates-Wilding";
                        sClub = "WYC Ikaika Hawaii Watermans";
                        sClubID = "IKAIKA";
                        break;
                    case "ua15US":
                        sCoachName = "Unaffiliated US";
                        sClub = "Unaffiliated Paddlers USA";
                        sClubID = "UA_US";
                        break;
                    case "ua15pa":
                        sCoachName = "Unaffiliated Paracanoeist";
                        sClub = "Unaffiliated Paracanoeists USA";
                        sClubID = "UAPara";
                        break;
                    case "bp15fx":
                        sCoachName = "Andy Taro";
                        sClub = "Berkeley Paddle and Rowing Club";
                        sClubID = "BPRC";
                        break;
                    case "fp15ho":
                        sCoachName = "Marlo Marcheco";
                        sClub = "Fortius Paddle Sports Club";
                        sClubID = "FPSC";
                        break;
                    case "bc15ds":
                        sCoachName = "Dan Baharav";
                        sClub = "Bellingham Canoe and Kayak Sprint Team";
                        sClubID = "BCKST";
                        break;
                    case "pa15ku":
                        sCoachName = "Todd Sekula";
                        sClub = "Port Aransas Kayak Club";
                        sClubID = "PAKC";
                        break;

                    case "wc15bw":
                        sCoachName = "Kathleen McNamee";
                        sClub = "Washington Canoe Club";
                        sClubID = "WCC";
                        break;
                    case "rc15nm":
                        sCoachName = "Marsh Jones";
                        sClub = "Rice Creek Boat Club";
                        sClubID = "RCBC";
                        break;
                    case "td15":
                        sCoachName = "Test Dummy";
                        sClub = "Dummy Paddlers";
                        sClubID = "Dummy";
                        break;
                    default:
                        sCoachName = "No Coach";
                        sClub = "NO Club at all";
                        sClubID = "NoClub";
                        break;
                }

            }
            // When Closed, hide all Entry Links
            if (sCoachName != "No Coach")
            {
                lblCoachName.Text = sCoachName;
                lblClubName.Text = sClub;
                lnkbutRegistration.PostBackUrl = String.Format(lnkbutRegistration.PostBackUrl, sClubID, smeetid, sCoachCode);
                lnkButtonReviewEntries.PostBackUrl = String.Format(lnkButtonReviewEntries.PostBackUrl, sClubID, smeetid, sCoachCode);
                divNoCoach.Visible = false;
            }
            else
            {
                divCoachIsHere.Visible = false;
            }
            // When Closed, hide all Entry Links
            divCoachIsHere.Visible = false;
            divNoCoach.Visible = false;
            lblCoachName2.Text = sCoachName;
            lblClubName2.Text = sClub;

        }
    }
}
