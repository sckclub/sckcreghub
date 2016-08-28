<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports_JR_MISC.aspx.cs" Inherits="sckreg.Reports_JR_MISC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
        <title>SCKC Online Registration - MISC Tables for JRaceman</title>
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
    <h1>MISC Tables - Levels, Competitions, Teams in Regatta for JRaceman</h1>
    <form id="form1" runat="server">
    <div>
        <h2>Levels referenced by Events in Regatta</h2>
        
            <asp:GridView ID="grdvwJRLevels" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="JRLevels" ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="!columns  &quot;id&quot;, " HeaderText="!columns  &quot;id&quot;, " 
                        ReadOnly="True" SortExpression="!columns  &quot;id&quot;, " />
                    <asp:BoundField DataField="&quot;name&quot;, " HeaderText="&quot;name&quot;, " 
                        ReadOnly="True" SortExpression="&quot;name&quot;, " />
                    <asp:BoundField DataField="&quot;minEntryAge&quot;, " 
                        HeaderText="&quot;minEntryAge&quot;, " ReadOnly="True" 
                        SortExpression="&quot;minEntryAge&quot;, " />
                    <asp:BoundField DataField="&quot;minAge&quot;, " 
                        HeaderText="&quot;minAge&quot;, " ReadOnly="True" 
                        SortExpression="&quot;minAge&quot;, " />
                    <asp:BoundField DataField="&quot;maxAge&quot;, " 
                        HeaderText="&quot;maxAge&quot;, " ReadOnly="True" 
                        SortExpression="&quot;maxAge&quot;, " />
                    <asp:BoundField DataField="&quot;maxEntryAge&quot;, " 
                        HeaderText="&quot;maxEntryAge&quot;, " ReadOnly="True" 
                        SortExpression="&quot;maxEntryAge&quot;, " />
                    <asp:BoundField DataField="&quot;useGroupAverage&quot;" 
                        HeaderText="&quot;useGroupAverage&quot;" ReadOnly="True" 
                        SortExpression="&quot;useGroupAverage&quot;" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
         
        <h2>Competitions referenced by Events in Regatta</h2>
        
       !table Competitions <br />
        
        
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            CellPadding="4" DataSourceID="sqlsrvJRCompetitions" GridLines="Horizontal">
            <RowStyle BackColor="White" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="!columns &quot;id&quot;," 
                    HeaderText="!columns &quot;id&quot;," ReadOnly="True" 
                    SortExpression="!columns &quot;id&quot;," />
                <asp:BoundField DataField="&quot;name&quot;," HeaderText="&quot;name&quot;," 
                    ReadOnly="True" SortExpression="&quot;name&quot;," />
                <asp:BoundField DataField="&quot;groupSize&quot;," 
                    HeaderText="&quot;groupSize&quot;," ReadOnly="True" 
                    SortExpression="&quot;groupSize&quot;," />
                <asp:BoundField DataField="&quot;maxAlternates&quot;," 
                    HeaderText="&quot;maxAlternates&quot;," ReadOnly="True" 
                    SortExpression="&quot;maxAlternates&quot;," />
                <asp:BoundField DataField="&quot;scheduledDuration&quot;" 
                    HeaderText="&quot;scheduledDuration&quot;" ReadOnly="True" 
                    SortExpression="&quot;scheduledDuration&quot;" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        
        
        <h2>Clubs/Teams with Entries in Regatta</h2>
        !table Teams<br />
        <asp:GridView ID="GridView1" runat="server" 
                AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                BorderWidth="1px" CellPadding="2" DataSourceID="sqlsrvJRTeams" 
                ForeColor="Black" GridLines="None">
            <Columns>
                <asp:BoundField DataField="!columns &quot;id&quot;," HeaderText="!columns &quot;id&quot;," 
                    ReadOnly="True" SortExpression="!columns &quot;id&quot;," />
                <asp:BoundField DataField="&quot;shortName&quot;," 
                    HeaderText="&quot;shortName&quot;," ReadOnly="True" 
                    SortExpression="&quot;shortName&quot;," />
                <asp:BoundField DataField="&quot;name&quot;," HeaderText="&quot;name&quot;," 
                    ReadOnly="True" SortExpression="&quot;name&quot;," />
                <asp:BoundField DataField="&quot;number&quot;, &quot;challengeId&quot;, &quot;nonScoring&quot;, &quot;street&quot;, &quot;street2&quot;, &quot;city&quot;, &quot;state&quot;," 
                    HeaderText="&quot;number&quot;, &quot;challengeId&quot;, &quot;nonScoring&quot;, &quot;street&quot;, &quot;street2&quot;, &quot;city&quot;, &quot;state&quot;," 
                    ReadOnly="True" 
                    
                    SortExpression="&quot;number&quot;, &quot;challengeId&quot;, &quot;nonScoring&quot;, &quot;street&quot;, &quot;street2&quot;, &quot;city&quot;, &quot;state&quot;," />
                <asp:BoundField DataField="&quot;country&quot;," 
                    HeaderText="&quot;country&quot;," ReadOnly="True" 
                    SortExpression="&quot;country&quot;," />
                <asp:BoundField DataField="&quot;zip&quot;,&quot;phone&quot;,&quot;fax&quot;" 
                    HeaderText="&quot;zip&quot;,&quot;phone&quot;,&quot;fax&quot;" 
                    ReadOnly="True" 
                    SortExpression="&quot;zip&quot;,&quot;phone&quot;,&quot;fax&quot;" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
   
        
        
    </div>
    
           <asp:HyperLink ID="hyplnkReportsHome" runat="server" NavigateUrl="Reports.aspx?qmeet={0}">Reports Home</asp:HyperLink>

    
    <asp:SqlDataSource ID="JRLevels" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sp_JRLevelsInMeet" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TR15" Name="meetId" 
                QueryStringField="qmeet" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>  
    <p>
        <asp:SqlDataSource ID="sqlsrvJRCompetitions" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="sp_JRCompetitionsInMeet" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="TR15" Name="meetId" 
                    QueryStringField="qmeet" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <asp:SqlDataSource ID="sqlsrvJRTeams" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sp_JRTeamsInMeet" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TR15" Name="meetId" 
                QueryStringField="qmeet" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    </form>
    
    
    </body>
</html>
