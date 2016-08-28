<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TH16.aspx.cs" Inherits="sckreg.TH16" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>Ted Houk 2016 Regatta Entries</title>
         <style type="text/css">  
             .clsOPEN  {  text-align: center; visibility:collapse; }
             .clsCLOSED  {  text-align: center; visibility:visible; }
             h2 {color:Red;}
             .clsfooter{text-align: center;
                        }
              .divImage{text-align: left;}
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
             width: 100%;
             border-style: solid;
             border-width: 1px;
             padding: 1px 4px;
             background-color: #66CCFF;
             text-align: center;
              font-weight: bold;
         }
         .style3
         {
             background-color: #FFFFFF;
             text-align: center;
         }
     </style>
</head>
<body>
    <div class="clsImage" style=" text-align: center;">
    <asp:Image ID="imLogo" runat="server" 
        ImageUrl="http://www.sckclub.org/sckcreg/images/customlogo.gif" 
        ImageAlign="Middle" />
     </div>
        <h1 style="text-align: center;" >Registration for the 2016, 37th Annual Ted Houk Regetta </h1>
        <h2 style="text-align: center;" > Green Lake, Seattle, June 11th and 12th, 2016 </h2>
    <h3 style="text-align: center;" > Online Resistration opened May 21th, 2016, and closed May 30th, 
        2016 </h3>
    <form id="form1" runat="server">

    <%-- does this work asa comment? Yes?
    <% kill me %>
    
    --%>
    <div style="width: 800px; margin:0 auto; ">
                 <div id="divCoachIsHere" class="clsOPEN" runat="server" style = "border:1px solid blue; text-align: center;">
                    <h3>Entries</h3>
                    <p>
                    Entries Coach: <asp:Label ID="lblCoachName" runat="server" Text="coachname"></asp:Label><br />
                    Club or Team: <asp:Label ID="lblClubName" runat="server" Text="clubname"></asp:Label> <br /><br />
                    
                                   <asp:LinkButton ID="lnkbutRegistration" runat="server" BackColor="#0066CC" 
                           BorderColor="#666666" BorderStyle="Groove" Font-Bold="True" ForeColor="White" 
                           PostBackUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&amp;qcc={2}">Click here to register your paddlers</asp:LinkButton>
                     <br />      
                    </p>
                </div>
                 <div id="divClosed" class = "clsCLOSED" runat="server" style = "border:1px solid blue;">
                    <h3>Thank you for your entries.  The Virtual Scratch Meeting is at 1PM Sat June 4th.</h3>
                    <!--
                        <h3>Review Entries</h3>
                        <p>
                        Entries Coach: <asp:Label ID="lblCoachName2" runat="server" Text="coachname"></asp:Label><br />
                        Club or Team: <asp:Label ID="lblClubName2" runat="server" Text="clubname"></asp:Label> <br /><br />
                        
                                       <asp:LinkButton ID="lnkButtonReviewEntries" runat="server" BackColor="#0066CC" 
                               BorderColor="#666666" BorderStyle="Groove" Font-Bold="True" ForeColor="White" 
                               PostBackUrl="Reports_EntriesByTeam.aspx?qclub={0}&amp;qmeet={1}&amp;qcc={2}">Click here to review your entries</asp:LinkButton>
                         <br />      
                        </p>
                    //-->
                </div>
                <div id="divNoCoach" runat="server" style = "border:1px solid red; padding: 20px 40px 10px 40px;">
                 
                    If you are a <b>coach </b>and reading this message, you need to register yourself as the entries coach for your club, send an email to <a href="mailto:philipmurphy@wonderanimal.com?subject=Request to be online entries coach for TH15">PhilipMurphy</a>, who is the competition secretary for the event.
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
                    If you are a <b>paracanoeist and NOT a member of a club</b>, you need to find the email from Philp Murphy
                    that contained a URL to register yourself, or request a UserID from Philip by sending an email to 
                    <a href="mailto:philipmurphy@wonderanimal.com?subject=TR15%20UserID Request">philipmurphy@wonderanimal.com</a>
                  </p>   
                </div>


                 <div id="idOrderOfEvents" style="text-align: center">
                 
                    <h3>Events</h3>
                    
                     <table class="style2">
                         <tr>
                             <td>
                                 &nbsp;</td>
                             <td>
                                 1000m</td>
                             <td>
                                 500m</td>
                             <td>
                                 200m</td>
                         </tr>
                         <tr>
                             <td class="style3">
                                 K1</td>
                             <td class="style3">
                                 J/S-M/W</td>
                             <td class="style3">
                                 J/S/MS-M/W</td>
                             <td class="style3">
                                 J/S/MS-M/W</td>
                         </tr>
                         <tr>
                             <td class="style3">
                                 K2</td>
                             <td class="style3">
                                 J/S-M</td>
                             <td class="style3">
                                 J/S-W, MS-M/W</td>
                             <td class="style3">
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td class="style3">
                                 K4</td>
                             <td class="style3">
                                 J/S-M</td>
                             <td class="style3">
                                 J/S-W, MS-M/W</td>
                             <td class="style3">
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td class="style3">
                                 C1</td>
                             <td class="style3">
                                 J/S-M/W</td>
                             <td class="style3">
                                 J/S/MS-M/W</td>
                             <td class="style3">
                                 J/S/MS-M/W</td>
                         </tr>
                         <tr>
                             <td class="style3">
                                 C2</td>
                             <td class="style3">
                                 J/S-M</td>
                             <td class="style3">
                                 J/S-W, MS-M/W</td>
                             <td class="style3">
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td class="style3">
                                 C4</td>
                             <td class="style3">
                                 J/S-M</td>
                             <td class="style3">
                                 J/S-W, MS-M/W</td>
                             <td class="style3">
                                 &nbsp;</td>
                         </tr>
                         <tr>
                             <td class="style3">
                                 K1/V1</td>
                             <td class="style3">
                                 &nbsp;</td>
                             <td class="style3">
                                 &nbsp;</td>
                             <td class="style3">
                                 Paracanoe x 2</td>
                         </tr>
                     </table>
                    
           
          
                     [J = Junior (U18), Juvenile(U16) and Bantam(U14) events, S = Senior(Open), MS=Masters 
                     (30 &amp;over)]<br />
                      <br />
                     Click <asp:HyperLink ID="hyplnkOrderOfEvents" runat="server" 
                         NavigateUrl="Events.aspx?qmeet=TH16" Target="_blank" style="font-weight: 700">here to see the Order of Events</asp:HyperLink>.
                 
                 </div>
            <div id="idDicCenter" style="text-align: center;" >
                    <h3>Entry Fees</h3>
                    <p>The non-refundable entry fee is $55.00 U.S. funds per athlete. Paracanoe entry is $25 U.S. funds per athlete. Team Entry Form & Fees are due by 
                        Monday, May 30th, 2016, 5:00pm Pacific.  </p>
                     <h3>General Information</h3>
                     <p>
                     
                              For the invitation package for the 2016 Ted Houk Regatta 
                 <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="http://www.seattlecanoekayak.club/2016SCKCTedHoukRaceInformationv1.pdf">click here</asp:HyperLink> &nbsp;(it's a PDF).
                            <br />
                              <br />
                             For Seattle Canoe and Kayak Club
                 <asp:HyperLink ID="hyplnkSCKCorg" runat="server" 
                NavigateUrl="http://www.seattlecanoekayak.club">click here</asp:HyperLink>
                     </p>
                     <br />
                 <div class="clsOPEN" >
                 <p visible='false'>
                    If you have any questions, please <a href="mailto:philipmurphy@wonderanimal.com">email Philip Murphy</a>, the online registration manager.
                 </p>
                 </div>

                 
             </div>
            
             <div style="text-align:center;">
                <br />
                <br />
                <br />

                Page last Updated May 30th, 2016
                    <br />
                    Copyright Seattle Canoe and Kayak Club 2013-2016
            </div>

    </div>
   </form>
</body>
</html>
