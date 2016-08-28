<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllPaddlers.aspx.cs" Inherits="sckreg.AllPaddlers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SCKC Online Entries System - All Paddlers in Meet</title>
        <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
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
    
    <form id="form1" runat="server">
    <div>
    <h1>All Paddlers entered in 
        <asp:Label ID="lblMeetName" runat="server" Text="Ted Houk 2014"></asp:Label>
        </h1>
    </div>
    <div id="divTable">
        <h2>Paddler Stats</h2>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="PaddlerID" 
            DataSourceID="sqlALLPaddlers" ForeColor="Black" GridLines="None">
            <Columns>
                <asp:BoundField DataField="teamId" HeaderText="TeamID" 
                    SortExpression="teamId" />
                <asp:BoundField DataField="firstName" HeaderText="First Name" 
                    SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="Last Name" 
                    SortExpression="lastName" />
                <asp:BoundField DataField="Sprint Events" HeaderText="Sprint Events" 
                    SortExpression="Sprint Events" />
                <asp:BoundField DataField="Long Distance" HeaderText="Long Distance" 
                    SortExpression="Long Distance" />
                <asp:BoundField DataField="Canoe" HeaderText="Canoe" SortExpression="Canoe" />
                <asp:BoundField DataField="Kayak" HeaderText="Kayak" SortExpression="Kayak" />
                <asp:BoundField DataField="Paracanoe" HeaderText="Paracanoe" 
                    SortExpression="Paracanoe" />
                <asp:BoundField DataField="Event Entries" HeaderText="Total Events" 
                    SortExpression="Event Entries" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        
        <h2>Paddler Info</h2>
    
    
     </div> 
    <div id="grdvwPaddlerInfo">
    
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="sqlsrvPaddlerInfo" 
            ForeColor="#333333" GridLines="None" EmptyDataText="No paddlers have entries in this Regatta" EmptyDataRowStyle-BackColor="#FF6600">
            <RowStyle BackColor="#EFF3FB" />

<EmptyDataRowStyle BackColor="#FF6600"></EmptyDataRowStyle>
            <Columns>
                <asp:BoundField DataField="counter" HeaderText="counter" ReadOnly="True" 
                    SortExpression="counter" />
                <asp:BoundField DataField="PaddlerId" HeaderText="PaddlerId" 
                    SortExpression="PaddlerId" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" 
                    SortExpression="lastName" />
                <asp:BoundField DataField="firstName" HeaderText="firstName" 
                    SortExpression="firstName" />
                <asp:BoundField DataField="Birthday" HeaderText="Birthday" 
                    SortExpression="Birthday" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="membership" HeaderText="membership" 
                    SortExpression="membership" />
                <asp:BoundField DataField="teamId" HeaderText="teamId" 
                    SortExpression="teamId" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    
       <asp:HyperLink ID="hyplnkReportsHome" runat="server" NavigateUrl="Reports.aspx?qmeet={0}">Reports Home Page</asp:HyperLink>
    </div>
    <asp:SqlDataSource ID="sqlALLPaddlers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sTeamEntries2" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="ALL" Name="TeamID" Type="String" />
            <asp:QueryStringParameter DefaultValue="TH14" Name="MeetID" 
                QueryStringField="qmeet" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    
    <asp:SqlDataSource ID="sqlsrvPaddlerInfo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sp_sPaddlerInMeet" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TR15" Name="meetId" 
                QueryStringField="qmeet" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </form>
</body>
</html>
