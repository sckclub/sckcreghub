<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports_TeamInvoices.aspx.cs" Inherits="sckreg.Reports_TeamInvoices" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
            <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
       <title>SCKC Online Registration system - Reports - Team Invoices</title>
    <link rel="Stylesheet" type="text/css" href="sckclubReports.css" />
    <style type="text/css">  
         .divClub  {  text-align: center;  }
    </style>
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
    <h1>Team Invoices for 
        <asp:Label ID="lblMeetName" runat="server" Text="[Meet Name]"></asp:Label></h1>
    <p>Note: Each row is created when a coach clicks the Pay Registration Fees button on 
        the Team Entries page.&nbsp; It shows the team totals when the button was 
        clicked.&nbsp; What they actually paid when on the Payments system is unknown to 
        this system.</p>
    <form id="form1" runat="server">
    <div>
    
    
    
        <asp:GridView ID="grdvwTeamInvoices" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="sqldataTeamInvoices" ForeColor="#333333" 
            GridLines="None" AllowSorting="True">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Invoice Number" 
                    InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="AgeFilter" HeaderText="AgeFilter" 
                    SortExpression="AgeFilter" />
                <asp:BoundField DataField="teamId" HeaderText="Team or Club ID" 
                    SortExpression="teamId" />
                <asp:BoundField DataField="FullCount" 
                    HeaderText="Paddlers with few Events" SortExpression="FullCount" />
                <asp:BoundField DataField="PartialCount" 
                    HeaderText="Paddlers with many Events" SortExpression="PartialCount" />
                <asp:BoundField DataField="SpecialCount" HeaderText="Not used in NT16" 
                    SortExpression="SpecialCount" />
                <asp:BoundField DataField="TotalFees" HeaderText="Total Fees" 
                    SortExpression="TotalFees" />
                <asp:BoundField DataField="CreateTime" HeaderText="Time Button Clicked" 
                    SortExpression="CreateTime" />
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    
        <asp:HyperLink ID="hyplnkReportsHome" runat="server" NavigateUrl="Reports.aspx?qmeet={0}">Back to main Reports Page</asp:HyperLink>
    
    </div>
    
    <div>
        <asp:SqlDataSource ID="sqldataTeamInvoices" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="SELECT [id], meetId, teamId, AgeFilter, FullCount, PartialCount, SpecialCount, '$' + cast(cast(TotalFees as decimal(8,2)) as nvarchar(15))   'TotalFees', Note, CreateTime FROM tTeamInvoices WHERE (meetId = @MeetID) ORDER BY CreateTime DESC">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="NAT15" Name="MeetID" 
                    QueryStringField="qmeet" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
