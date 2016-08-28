<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamEntriesOverView.aspx.cs" Inherits="sckreg.TeamEntriesOverView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SCKC Online Registration Meet Entries by Team Report</title>
        <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <link rel="Stylesheet" type="text/css" href="sckclubReports.css" />
    <style type="text/css">  
         .divClub  {  text-align: center;  }
         .cssNumber {text-align: right;}
         .cssNumberTotals {text-align: right; font-weight: bold;}
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
    
    <form id="form1" runat="server">
    <div>
    <h1>REPORT: Team Entries Overview
        <asp:Label ID="lblMeetName" runat="server" Text="MeetName"></asp:Label>
        </h1>
    
    
    </div>
        <asp:GridView ID="gvTeamTotals" runat="server" AutoGenerateColumns="False" 
            DataSourceID="sqlTeamsEntriesOverView" AllowSorting="True" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" CellSpacing="1" GridLines="None" 
        onrowdatabound="gvTeamTotals_RowDataBound" 
        onselectedindexchanged="gvTeamTotals_SelectedIndexChanged">
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="clubApprev, meetID" 
                    DataNavigateUrlFormatString="TeamEntries.aspx?qclub={0}&amp;qmeet={1}" 
                    DataTextField="clubApprev" HeaderText="TeamID" 
                    SortExpression="clubApprev" />
                <asp:BoundField DataField="name" HeaderText="Club or Team Name" 
                    SortExpression="name" />
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" />
                <asp:BoundField DataField="AB Paddlers" HeaderText="AB Paddlers" 
                    SortExpression="AB Paddlers" >
                <ControlStyle CssClass="cssNumber" />
                <ItemStyle CssClass="cssNumber" />
                </asp:BoundField>
                <asp:BoundField DataField="Paracanoeists" HeaderText="Paracanoeists" 
                    SortExpression="Paracanoeists" >
                <ControlStyle CssClass="cssNumber" />
                <ItemStyle CssClass="cssNumber" />
                </asp:BoundField>
                <asp:BoundField DataField="JuniorEntrants" HeaderText="JuniorEntrants" 
                    SortExpression="JuniorEntrants">
                <ItemStyle CssClass="cssNumber" />
                </asp:BoundField>
                <asp:BoundField DataField="SeniorEntrants" HeaderText="SeniorEntrants" 
                    SortExpression="SeniorEntrants">
                <ItemStyle CssClass="cssNumber" />
                </asp:BoundField>
                <asp:BoundField DataField="MasterEntrants" HeaderText="MasterEntrants" 
                    SortExpression="MasterEntrants" />
                <asp:BoundField DataField="Team members" HeaderText="All Paddlers" 
                    SortExpression="Team members" >
                <ControlStyle CssClass="cssNumberTotals" />
                <ItemStyle CssClass="cssNumberTotals" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <h2>Breakout by payments types</h2>
    <asp:GridView ID="grdvwPayments" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="sqldataPayments" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Entrant Category" HeaderText="Entrant Category" 
                ReadOnly="True" SortExpression="Entrant Category" />
            <asp:BoundField DataField="Number of Paddlers" HeaderText="Number of Paddlers" 
                ReadOnly="True" SortExpression="Number of Paddlers" />
            <asp:BoundField DataField="Individual Entry Fee" 
                HeaderText="Individual Entry Fee" ReadOnly="True" 
                SortExpression="Individual Entry Fee" />
            <asp:BoundField DataField="Entry Fees" HeaderText="Entry Fees" ReadOnly="True" 
                SortExpression="Entry Fees" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <p>
        <asp:HyperLink ID="hyplnkReportsHome" runat="server" 
            NavigateUrl="Reports.aspx?qmeet={0}">Back to Reports Home</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <asp:SqlDataSource ID="sqlTeamsEntriesOverView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sp_sTeamEntriesOverview" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TH14" Name="MeetId" 
                QueryStringField="qmeet" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqldataPayments" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sTeamPayments3TierALL" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="ALL" Name="TeamID" Type="String" />
            <asp:QueryStringParameter DefaultValue="NAT15" Name="MeetID" 
                QueryStringField="qmeet" Type="String" />
            <asp:Parameter DefaultValue="ALL" Name="Age" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </form>
</body>
</html>
