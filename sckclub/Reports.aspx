<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="sckreg.Reports" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
        <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>SCKC Online Registration Reports Home Page</title>
    <link rel="Stylesheet" type="text/css" href="sckclubReports.css" />
    <style type="text/css">  
         .divClub  {  text-align: center;  }
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
            <img src="imgs/favicon.ico" alt="paddler icon" />
        </div>
        <div class="divHeaderText">
            <asp:Label ID="lblHeaderMeet" runat="server" ForeColor="White" CssClass="lblHeaderMeet">2015 USA Canoe/Kayak Flatwater Sprint Team Trials</asp:Label>
            <asp:Label ID="lblHeaderCoach" runat="server"  CssClass="lblHeaderCoach">Slow Coach</asp:Label>
        </div>
    </div>
    <h1>Reports Home Page for  
        <asp:Label ID="lblMeetName" runat="server" Text="Ted Houk 14"></asp:Label>
     </h1>
    <form id="form1" runat="server">
    <div>
        <ul>
            <li>
                <asp:HyperLink ID="hyplnkAllPaddlers" runat="server" NavigateUrl="AllPaddlers.aspx?qmeet={0}" Text="All Paddlers at Meet">All Paddlers at Meet</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="hyplnkEntriesByTeam" runat="server" NavigateUrl="TeamEntriesOverView.aspx?qmeet={0}" Text="Summary of Entries by Team">Summary of Entries by Team</asp:HyperLink>
            </li>
             <li>
                <asp:HyperLink ID="hyplnkAllEvents" runat="server" NavigateUrl="AllEvents.aspx?qmeet={0}&qage=TheWorks" Text="All Events with Entries">All Events with Entries</asp:HyperLink>
            </li>
             <li>
                <asp:HyperLink ID="hyplnkAllEntries" runat="server" NavigateUrl="Reports_AllEntries.aspx?qmeet={0}" Text="All Entries in Regatta">All Entries in Regatta</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="hyplnkTeamBoats" runat="server" NavigateUrl="TeamBoatEntriesReport.aspx?qmeet={0}&qclub=ALL&qstatus=ALL" Text="All TeamBoats in the Regatta">All TeamBoats in the Regatta</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="hyplnkCoaches" runat="server" NavigateUrl="DerCoaches.aspx?qmeet={0}" Text="All Coaches in the Regatta">All Coaches in the Regatta</asp:HyperLink>
            </li>
           </ul>
           <h3>Payments Fees Related</h3>
           <ul>
            <li>
                <asp:HyperLink ID="hyplnkTeamInvoices" runat="server" NavigateUrl="Reports_TeamInvoices.aspx?qmeet={0}" Text="All Entries in Regatta">Information passed to Payments System</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="hyplnkPaymentsPerTeam" runat="server" NavigateUrl="Report_PaymentsPerTeam.aspx?qmeet={0}" Text="All Entries in Regatta">Paddler Entries, memberships and Fees Per CClub/Team</asp:HyperLink>
            </li>

        </ul>
        <h3>Exports for JRaceman tables</h3>
        <ul>
        <li>
            <asp:HyperLink ID="hyplnkJRMISC" runat="server" NavigateUrl="Reports_JR_MISC.aspx?qmeet={0}" Text="Misc tables in Regatta">Miscellenous tables in Regatta</asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="hyplnkJRPaddlers" runat="server" NavigateUrl="Reports_JR_Paddlers.aspx?qmeet={0}" Text="All Paddlers entered in Regatta">All Paddlers entered in Regatta</asp:HyperLink>
        </li>
        <li><asp:HyperLink ID="hyplnkJREvents" runat="server" NavigateUrl="Reports_JR_Events.aspx?qmeet={0}" Text="All Events entered in Regatta">All Events in Regatta</asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="hyplnkJREntries" runat="server" NavigateUrl="Reports_JR_Entries.aspx?qmeet={0}" Text="All Entries in Regatta">All Entries in Regatta</asp:HyperLink>
        </li>
        </ul>
        
    </div>
    
    </form>
</body>
</html>
