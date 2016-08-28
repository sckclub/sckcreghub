<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamboatEntriesReport.aspx.cs" Inherits="sckreg.TeamboatEntriesReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teamboat Entries report</title>
     <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <link rel="Stylesheet" type="text/css" href="sckclub.css" />
    <style type="text/css">  

         .divClub { text-align: center; }
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
            <img src="imgs/favicon.ico"  alt="paddler icon" />
        </div>
        <div class="divHeaderText">
            <asp:Label ID="lblHeaderMeet" runat="server" ForeColor="White" CssClass="lblHeaderMeet">2015 USA Canoe/Kayak Flatwater Sprint Team Trials</asp:Label>
            <asp:Label ID="lblHeaderCoach" runat="server"  CssClass="lblHeaderCoach">Slow Coach</asp:Label>
        </div>
    </div>
    
    <form id="form1" runat="server">
    <div>
        <div style="float:left;" >
            <h1>Teamboat Entries reports for 
                <asp:Label ID="lblTeamID" runat="server" Text="[TeamID]"></asp:Label>
                 <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </h1>
        </div>
        <div style="text-align:right; float:right; padding:20px; font-size:larger;" >
            back to <asp:HyperLink ID="hypTeamPaddlers" runat="server" NavigateUrl="Paddlers.aspx?qclub={0}&qmeet={1}&qage={2}">Team's Paddlers Page</asp:HyperLink>
        </div>
        <div style="clear:both;">
            <asp:Label ID="lblTeamDesc" runat="server" Text="This table shows all team boat entries for your team."></asp:Label>
            
        </div>
        <asp:LinkButton ID="lnkbtnALL" runat="server" BackColor="#3366FF" 
            BorderStyle="Ridge" Font-Bold="True" ForeColor="White" 
            PostBackUrl="~/TeamboatEntriesReport.aspx?qmeet={0}&amp;qclub={1}&amp;qstatus={2}">ALL</asp:LinkButton>
&nbsp;&nbsp;
        <asp:LinkButton ID="lnkbutIncomplete" runat="server" BackColor="#0066FF" 
            BorderStyle="Ridge" Font-Bold="True" ForeColor="White" 
            PostBackUrl="~/TeamboatEntriesReport.aspx?qmeet={0}&amp;qclub={1}&amp;qstatus={2}">Incomplete</asp:LinkButton>
&nbsp;
        <asp:LinkButton ID="lnkbutComplete" runat="server" BackColor="#0066FF" 
            BorderStyle="Ridge" Font-Bold="True" ForeColor="White" 
            PostBackUrl="~/TeamboatEntriesReport.aspx?qmeet={0}&amp;qclub={1}&amp;qstatus={2}">Complete</asp:LinkButton>
&nbsp;
        <br />
        <asp:GridView ID="gvTeamBoatsByteam" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="sqldsTeamBoats" AllowSorting="True">
            <RowStyle BackColor="White" ForeColor="#330099" />
            <Columns>
                <asp:BoundField DataField="EventsId" HeaderText="EventsId" 
                    SortExpression="EventsId" />
                <asp:BoundField DataField="EventName" HeaderText="EventName" 
                    SortExpression="EventName" />
                <asp:BoundField DataField="Competition" HeaderText="Competition" 
                    SortExpression="Competition" />
                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="BoatName" HeaderText="BoatName" 
                    SortExpression="BoatName" />
                <asp:BoundField DataField="Paddlers in Boat" HeaderText="Paddlers in Boat" 
                    SortExpression="Paddlers in Boat" />
                <asp:BoundField DataField="Paddlers" HeaderText="Paddlers" ReadOnly="True" 
                    SortExpression="Paddlers" />
                <asp:BoundField DataField="BoatStatus" HeaderText="BoatStatus" 
                    SortExpression="BoatStatus" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
    
    
    
    
    </div>
    
    <div>
                    <br />
          <div id="divBack2Paddlers">
                <asp:HyperLink ID="hyplnkPaddlers" runat="server" NavigateUrl="Paddlers.aspx?qclub={0}&qmeet={1}&qage={2}">Return to your Team's Paddlers page</asp:HyperLink>
          </div>
          <div id="divBack2Reports">
              <asp:HyperLink ID="hyplnkReportsHome" runat="server" NavigateUrl="Reports.aspx?qmeet={0}">Reports Home</asp:HyperLink>

          </div>
          <br />
          <br />
          <asp:SqlDataSource ID="sqldsTeamBoats" runat="server" 
              ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
              SelectCommand="sp_sTeamboatEntriesByTeam" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:QueryStringParameter Name="TeamID" QueryStringField="qclub" 
                      Type="String" DefaultValue="ALL" />
                  <asp:QueryStringParameter DefaultValue="TH14" Name="MeetID" 
                      QueryStringField="qmeet" Type="String" />
                  <asp:QueryStringParameter DefaultValue="ALL" Name="Status" 
                      QueryStringField="qstatus" Type="String" />
              </SelectParameters>
          </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
