<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report_PaymentsPerTeam.aspx.cs" Inherits="sckreg.Report_PaymentsPerTeam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
  <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>Paddler entries and Fees</title>
    <link rel="Stylesheet" type="text/css" href="sckclubReports.css" />
    <style type="text/css">  
         .divClub  {  text-align: center;  }
         .divCoachesANDTeam{width:1000px;}
         .divCoaches {width: 400px; float:left;}
         .divTeam {width:400px; float:right;}
         .divPayments{clear:both;}
         .divSQL{visibility:collapse;}
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
    <div id="divMain">

        <h1>Paddler Entries and Fees for 
            <asp:Label ID="lblTeam" runat="server" Text="[Per Club]"></asp:Label>
        </h1>
         <h2>Select a Club/Team: <asp:DropDownList ID="ddListTeamsID" runat="server" AutoPostBack="True" 
                                DataSourceID="sqldataTeams" DataTextField="clubApprev" 
                                DataValueField="clubApprev" 
                                onselectedindexchanged="ddListTeamsID_SelectedIndexChanged">

                            </asp:DropDownList></h2>
                <div id="divCoachesANDTeam">
                                        <div id="divTeam">
                        <asp:GridView ID="grdvwTeam" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataSourceID="sqldataTeam" ForeColor="#333333" GridLines="None">
                            <RowStyle BackColor="#E3EAEB" />
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                                <asp:BoundField DataField="Team/Club Name" HeaderText="Team/Club Name" 
                                    SortExpression="Team/Club Name" />
                                <asp:BoundField DataField="country" HeaderText="country" 
                                    SortExpression="country" />
                            </Columns>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>

                    </div>
                    <div id="divCoaches">
                        <h2>Coaches emails</h2>
                        <asp:GridView ID="gvwCoaches" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataSourceID="sqldataCoaches" ForeColor="#333333" 
                            GridLines="None">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="clubApprev" HeaderText="clubApprev" 
                                    SortExpression="clubApprev" />
                                <asp:BoundField DataField="Entries Coach" HeaderText="Entries Coach" 
                                    ReadOnly="True" SortExpression="Entries Coach" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </div>

                </div>
                <div id="divPayments">
                  <h2>Estimated Payments</h2>
                  <asp:GridView ID="grdvPayments" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" DataSourceID="sqlTeamPayments" 
                        EmptyDataText="Your team has no entries" GridLines="Vertical" 
                        >
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="Entrant Category" HeaderText="Entrant Category" 
                                ReadOnly="True" SortExpression="Entrant Category" />
                            <asp:BoundField DataField="Number of Paddlers" 
                                HeaderText="Number of Paddlers" ReadOnly="True" 
                                SortExpression="Number of Paddlers" />
                            <asp:BoundField DataField="Individual Entry Fee" 
                                HeaderText="Individual Entry Fee" ReadOnly="True" 
                                SortExpression="Individual Entry Fee" >
                            </asp:BoundField>
                            <asp:BoundField DataField="Entry Fees" HeaderText="Entry Fees" 
                                ReadOnly="True" SortExpression="Entry Fees" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:GridView>
                
                </div>
        <div id="divPaddlers">
            <h2>Events Per Paddler</h2>
            <asp:GridView ID="grrdvwPaddlerEntries" runat="server" 
                AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                BorderWidth="1px" CellPadding="2" DataKeyNames="PaddlerID" 
                DataSourceID="sqldataPaddlerEntrriesByTeam" ForeColor="Black" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="teamId" HeaderText="teamId" 
                        SortExpression="teamId" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" 
                        SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" 
                        SortExpression="lastName" />
                    <asp:BoundField DataField="Sprint Events" HeaderText="Sprint Events" 
                        SortExpression="Sprint Events" />
                    <asp:BoundField DataField="Long Distance" HeaderText="Long Distance" 
                        SortExpression="Long Distance" />
                    <asp:BoundField DataField="Canoe" HeaderText="Canoe" SortExpression="Canoe" />
                    <asp:BoundField DataField="Kayak" HeaderText="Kayak" SortExpression="Kayak" />
                    <asp:BoundField DataField="Va'a" HeaderText="Va'a" SortExpression="Va'a" />
                    <asp:BoundField DataField="ParaK1" HeaderText="ParaK1" 
                        SortExpression="ParaK1" />
                    <asp:BoundField DataField="Paracanoe" HeaderText="Paracanoe" 
                        SortExpression="Paracanoe" />
                    <asp:BoundField DataField="Junior" HeaderText="Junior" 
                        SortExpression="Junior" />
                    <asp:BoundField DataField="Senior" HeaderText="Senior" 
                        SortExpression="Senior" />
                    <asp:BoundField DataField="Master" HeaderText="Master" 
                        SortExpression="Master" />
                    <asp:BoundField DataField="Event Entries" HeaderText="Event Entries" 
                        SortExpression="Event Entries" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                    HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
        </div>
        <div id='divPaddler'>
            <h2>Paddler Info with Membership</h2>
            <asp:GridView ID="grdvwPaddlerInfo" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="sqldataPaddlerInfo" ForeColor="#333333" 
                GridLines="None">
                <RowStyle BackColor="#EFF3FB" />
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
        
        
        </div>
        <asp:HyperLink ID="hyplnkReportsHome" runat="server" NavigateUrl="Reports.aspx?qmeet={0}">Reports Home</asp:HyperLink>

    </div>

    <div id="divSQL">
        <asp:SqlDataSource ID="sqldataPaddlerEntrriesByTeam" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="sTeamEntries2" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddListTeamsID" DefaultValue="SDCKT" 
                    Name="TeamID" PropertyName="SelectedValue" Type="String" />
                <asp:QueryStringParameter DefaultValue="NAT15" Name="MeetID" 
                    QueryStringField="qmeet" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqldataTeams" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="SELECT DISTINCT [clubApprev] FROM [tCoaches] WHERE ([ThisMeetID] = @ThisMeetID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="NAT15" Name="ThisMeetID" 
                    QueryStringField="qmeet" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqldataCoaches" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            
            
            SelectCommand="SELECT clubApprev, rtrim(First)+ ' '+ Last as 'Entries Coach', rtrim(email) 'email' FROM tCoaches WHERE (ThisMeetID = @ThisMeetID) and clubApprev=@TeamID">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="NT16" Name="ThisMeetID" 
                    QueryStringField="qmeet" Type="String" />
                <asp:ControlParameter ControlID="ddListTeamsID" DefaultValue="SDCKT" 
                    Name="TeamID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        
            <asp:SqlDataSource ID="sqlTeamPayments" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sTeamPayments3Tier" SelectCommandType="StoredProcedure">
        <SelectParameters>
             <asp:ControlParameter ControlID="ddListTeamsID" DefaultValue="SDCKT" 
                    Name="TeamID" PropertyName="SelectedValue" />
            <asp:QueryStringParameter DefaultValue="NAT15" Name="MeetID" 
                QueryStringField="qmeet" Type="String" />
            <asp:QueryStringParameter DefaultValue="ALL" Name="Age" QueryStringField="qage" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="sqldataTeam" runat="server"
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
       SelectCommand="SELECT [id], [Name] 'Team/Club Name', country FROM [th2013_Teams] WHERE ( [id]=@TeamID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddListTeamsID" DefaultValue="SDCKT" 
                    Name="TeamID" PropertyName="SelectedValue" />
            </SelectParameters>
        
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqldataPaddlerInfo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="sp_sPaddlerInMeetByTeam" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="NAT15" Name="meetId" 
                    QueryStringField="qmeet" Type="String" />
                <asp:ControlParameter ControlID="ddListTeamsID" DefaultValue="SDCKT" 
                    Name="TeamID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
