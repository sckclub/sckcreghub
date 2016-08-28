<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NAT15.aspx.cs" Inherits="sckreg.NAT15" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>2015 USACK National ChampionShips Online Registration</title>       
         <style type="text/css">  
             .clsOPEN  {  text-align: center; visibility:collapse; }
             .clsCLOSED  {  text-align: center; visibility:visible; }
             .clsImage {  text-align: center; visibility:collapse; }
             #divNoCoach {  visibility:visible; }
             h2 {color:green;}
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
        <h1 align="center" >Online Registration for the <asp:Label ID="lblMeetName" runat="server" Text="[lblMeetingLabel]"></asp:Label>&nbsp;</h1>
        <h2 align="center" style="display:none;"> 
            Venue: <asp:Label ID="lblMeetLocation" runat="server" Text="lblMeetLocation"></asp:Label> &nbsp;</h2>
    <h3 align="center" > Online Registration opened June 1st, 2015, and closed at Midnight PDT on June 30th, 2015 </h3>


    <form id="form1" runat="server">
 <div style="width: 900px; margin:0 auto; ">
                <div class="clsCLOSED">
                 <h2>Registration for the 2015 USA Canoe/Kayak Sprint National Championships has closed</h2>
    
                     <h3>Contact</h3>
                    If you have any questions about entries, schedules etc, please <a href="mailto:cmorrison@sdckt.net">email Catriona Miller</a>, LOC.
                    <br />
                    If you have any questions about memberships numbers, fees, etc <a href="mailto:ktruesdale@sdckt.net">email Ken Trusdale</a>, LOC.
               
                     <h3>Draft Order of Events</h3>

                     Click <asp:HyperLink ID="HyperLink2" runat="server" 
                         NavigateUrl="http://www.sdckt.net/order-of-events?qmeet=NAT15" Target="_blank" style="font-weight: 700">here to see the Order of Events</asp:HyperLink>.
 
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
                     <br />      
                    </p>
                </div>
                <div id="divNoCoach" runat="server" style = "border:1px solid red; padding: 20px 40px 10px 40px;">
                 
                    If you are a <b>coach </b>and reading this message, you need to register yourself as the entries coach for your club or team.  To do so, please send an email to <a href="mailto:philipmurphy@wonderanimal.com?subject=Request to be online entries coach for 2015 Nationals">PhilipMurphy</a>, who is the competition secretary for the event.
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
                        Your club's short name (which is used in lane assignments and results)  - e.g. SCKC
                     </li>                
                     </ul>
                  <p>
                    If you are an <b>individual paddler and NOT a member of a club</b>, you need to register to enter your self for Nationals,  To do so, please request to register yourself by sending an email to 
                    <a href="mailto:philipmurphy@wonderanimal.com?subject=NAT15%20UserID Request">Philip Murphy</a>
                  </p>   
                </div>


                 <div id="idOrderOfEvents" align="center">
                 
                    <h3>Events</h3>

                     Click <asp:HyperLink ID="hyplnkOrderOfEvents" runat="server" 
                         NavigateUrl="http://www.sdckt.net/order-of-events?qmeet=NAT15" Target="_blank" style="font-weight: 700">here to see the Order of Events</asp:HyperLink>.
                 
                 </div>
            <div id="idDicCenter" align="center" >
                    <h3>Entry Fees</h3>
                    <p>The non-refundable entry fee per athelete is $145.00 for Junior/Senior 4-9 races, $72.50 for Junior/Senior 1-3 races, and Masters and Paracanoeists it is $55.</p>
            </div>
            <div style="display:none;">
                     <h3>General Information</h3>
                     <p>
                     
                              For all information about the USA C/K Sprint National Championships
                 <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="http://www.sdckt.net/2015">click here</asp:HyperLink> &nbsp;.
                            <br />
                      </p>
             </div>
                
                 <p visible='true'>
                    If you have any questions about online registration, please <a href="mailto:philipmurphy@wonderanimal.com">email Philip Murphy</a>, the online registration manager.
                    <br />
                    If you have any questions about the Championships, please <a href="mailto:cbarlow@sdckt.net">email Chris Barlow</a>, the regatta director.
                 </p>   
         </div>

                
            
             <div align="center">

                Page last Updated July 1st, 2015
                    <br />
                    Copyright Seattle Canoe and Kayak Club 2015
            </div>

    </div>
    </form>
</body>
</html>
