<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NAT16.aspx.cs" Inherits="sckreg.NAT16" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>2016 USACK National ChampionShips Online Registration</title> 
    <link rel="Stylesheet" type="text/css" href="sckclub.css" />     
         <style type="text/css">  
             .clsOPEN  {  text-align: center; visibility:visible; }
             .clsCLOSED  {  text-align: center; visibility:visible; display:inherit;}
             .clsImage {  text-align: center; visibility:visible; }
             #divNoCoach {  visibility:visible; }
             h2 {color:black;}
             .clsfooter{text-align: center;}
              .divImage{text-align: left;}
        </style>
        <style type="text/css">
         .style1
         {
              text-align: left;
         }
     table.MsoNormalTable
	{font-size:10.0pt;
	font-family:"Times New Roman",serif;
         }
            .style2
            {
                font-size:x-large; padding:20, 20,20,20:
            }
         </style>
        <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'UA-53227111-2']);
          _gaq.push(['_trackPageview']);

          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
           })();

       </script>
</head>
<body>
    <div class="divHeader" >
        <div id="idHeaderIMG">
            <img src="imgs/favicon.ico"  alt="paddler icon"  />
        </div>
        <div class="divHeaderText">
            <asp:Label ID="lblHeaderMeet" runat="server" ForeColor="White" CssClass="lblHeaderMeet">2016 USA Canoe/Kayak Flatwater Sprint Team Trials</asp:Label>
            <asp:Label ID="lblHeaderCoach" runat="server"  CssClass="lblHeaderCoach">Slow Coach</asp:Label>
        </div>
    </div>
        <h1 style="text-align:center;" >Online Registration for the <asp:Label ID="lblMeetName" runat="server" Text="[lblMeetingLabel]"></asp:Label>&nbsp;</h1>
        <h2  style="text-align:center; display:inherit;"> 
            Venue: <asp:Label ID="lblMeetLocation" runat="server" Text="lblMeetLocation"></asp:Label> &nbsp;</h2>
    <form id="form1" runat="server">
    <div style="text-align:center;">
        <center>
        <table>
            <tr>
            <td>
            <asp:Image ID="Image1" runat="server" Height="188px" 
        ImageUrl="~/imgs/usack16.jpeg" Width="213px" />
            </td>
                       <td style="text-align:center;">
                               
            <span class="style2">Online registration opened June 22nd and closed midnight, July 6th, 2016</span>
            </td>
                       <td>
             <asp:Image ID="Image2" runat="server" Height="212px" 
        ImageUrl="~/imgs/NAT16logo.gif" Width="213px" />
            </td>
            </tr></table>
    .   </center>
        
    </div>



 <div style="width: 900px; margin:0 auto; ">
                <div id="divClosed" runat="server" class="clsCLOSED">
                     <h3> Entries</h3>
             An Excel workbook with entries for all paddlers will be sent to Team Coaches by Jul 12th 
 
                        <h3>Boat building Virtual Meeting</h3>
                        A Boat Building virtual meeting will be held a week before the regatta.<br />
                        Details will be sent to all entries coaches two weeks prior to regatta.<br /><br/>
                    If you have any questions please <a href="mailto:moverton@okcbf.org">email Mia Overton</a>, OKCBF LOC.
                    <br />
                
                    
                    <div  id="divEntriesReview" runat="server">
                     <h3>Review your entries</h3>
                         Click <asp:HyperLink ID="hyplnkEntriesReview" runat="server" 
                         NavigateUrl="~/Reports_EntriesByTeam.aspx?qmeet={0}&qclub={1}&qcc={2}" style="font-weight: 700">here</asp:HyperLink> to review your club's entries.
                    </div>
               </div>
             <div class="clsOPEN" >
             
                 <div id="divCoachIsHere" runat="server" style = "border:1px solid blue; text-align: center;">
                    <h3>Entries</h3>
                    <p>
                    Entries Coach: <asp:Label ID="lblCoachName" runat="server" Text="coachname"></asp:Label><br />
                    Club or Team: <asp:Label ID="lblClubName" runat="server" Text="clubname"></asp:Label> <br /><br />
                    
                                   <asp:LinkButton ID="lnkbutRegisterJuniors" runat="server" BackColor="#0066CC" 
                           BorderColor="#666666" BorderStyle="Groove" Font-Bold="True" ForeColor="White" 
                           
                            PostBackUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&amp;qcc={2}&qage=Juniors" 
                            ToolTip="This choice is just for convenience - you can switch between Juniors/Seniors and Masters registration anytime as you proceed.">Click here to register your Junior and Senior paddlers</asp:LinkButton>
                           
                           <asp:LinkButton ID="lnkbutRegisterMasters" runat="server" BackColor="#0066CC" 
                           BorderColor="#666666" BorderStyle="Groove" Font-Bold="True" ForeColor="White" 
                           PostBackUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&qcc={2}&qage=Masters"
                           ToolTip="This choice is just for convenience - you can switch between Juniors/Seniors and Masters registration anytime as you proceed.">Click here to register your Master Paddlers</asp:LinkButton>
                           
                           <asp:LinkButton ID="lnkbutRegisterALL" runat="server" BackColor="#0066CC" 
                           BorderColor="#666666" BorderStyle="Groove" Font-Bold="True" ForeColor="White" 
                           PostBackUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&qcc={2}&qage=ALL"
                           ToolTip="Click here to see a roster of any paddlers from your clucb that have been entered in the system from past regattas.">Click here to start entering your paddlers.</asp:LinkButton>

                     <br />      
                    </p>
                </div>
                <div id="divNoCoach" runat="server" style = "border:1px solid red; padding: 20px 40px 10px 40px;">
                 
                    If you are a <b>coach </b>and reading this message, you need to register yourself as the entries coach for your club or team.  
                    To do so, please send an email to <a href="mailto:philipmurphy@wonderanimal.com?subject=Request to be online entries coach for 2016 Nationals">PhilipMurphy</a>, who is the competition secretary for the event.
                     Be sure to include:
                     <ul>
                     <li class="style1">
                        Your full name - e.g. Neil Bransfield
                     </li>
                     <li class="style1">
                        The email you want us to use to contact you at during online enrollment
                     </li>
                     <li class="style1">
                        Your club's full name - e.g. Seattle Canoe and Kayak Club
                     </li>
                     <li class="style1">
                        Your club's short name (which is used in lane assignments and results)  - e.g. Seattle
                     </li> 
                      <li class="style1">
                        Your club's acronym (which is used internally and for a few reports and results)  - e.g. SCKC
                     </li>                
                     </ul>
                  <p>
                    If you are an <b>individual paddler and NOT a member of a club</b>, you need to register to enter your self for Nationals,  To do so, please request to register yourself by sending an email to 
                    <a href="mailto:philipmurphy@wonderanimal.com?subject=NAT15%20UserID Request">Philip Murphy</a>
                  </p>   
                </div>


                 <div id="idOrderOfEvents" style="text-align:center;">
                 
                    <h3>Order of Events</h3>

                     Click <asp:HyperLink ID="hyplnkOrderOfEvents" runat="server" 
                         NavigateUrl="Events.aspx?qmeet=NT16" Target="_blank" style="font-weight: 700">here to see the Order of Events</asp:HyperLink>.
                 
                 </div>
            <div id="idDicCenter" style="text-align:center; visibility:hidden;" >
                    <h3>Entry Fees</h3>
                    <p>The non-refundable entry fee per athelete is $75.00 for athletes entered in 1-3 events, $150.00 for those entered in 4 or more events.</p>
            </div>
            <div style="display:inherit;">
                     <h3>General Information</h3>
                     <p>
                     For general information on the 2016 USA C/K Sprint National Championships
                     
                      <asp:HyperLink ID="HyperLink4" runat="server" 
                         NavigateUrl="http://boathousedistrict.org/festivals-races/usa-canoekayak-sprint-national-championships/" Target="_blank" style="font-weight: 700">click here</asp:HyperLink>.

                            <br />
                      </p>
             </div>
                
                 <p visible='true'>
                    If you have any questions about online registration, please <a href="mailto:philipmurphy@wonderanimal.com">email Philip Murphy</a>, the online registration manager.
                    <br />
                    If you have any questions about the Championships, please <a href="mailto:moverton@okcbf.org">email Mia Overton</a>, the regatta director at OKCBF.
                 </p>   
         </div>

                
            
             <div style="text-align:center;">

                Page last Updated July 6th, 2016
                    <br />
                    Copyright Seattle Canoe and Kayak Club 2016
            </div>

    </div>
    </form>
</body>
</html>
