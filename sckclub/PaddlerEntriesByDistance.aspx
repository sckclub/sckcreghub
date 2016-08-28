<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaddlerEntriesByDistance.aspx.cs" Inherits="sckreg.PaddlerEntriesByDistance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ted Houk 2014 Entries for all paddlers by Ditance</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Ted Houk 2014 Entries for all paddlers at <%= Request.QueryString["qdistance"] %> distance</h1>
    
    </div>
    <div id='divTable'>
    Return to <asp:HyperLink ID="hyplink2Home" runat="server" NavigateUrl="Default.aspx">Home Page</asp:HyperLink>
    
        <br />
        <br />
        <asp:GridView ID="gvPaddlerEntriesByDistance" runat="server" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="sqldsPaddlerEntriesByDistance" ForeColor="Black" 
            GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="EventsId" HeaderText="EventsId" 
                    SortExpression="EventsId" />
                <asp:BoundField DataField="EventName" HeaderText="EventName" 
                    SortExpression="EventName" />
                <asp:BoundField DataField="Competition" HeaderText="Competition" 
                    SortExpression="Competition" />
                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                <asp:BoundField DataField="Boat Type" HeaderText="Boat Type" ReadOnly="True" 
                    SortExpression="Boat Type" />
                <asp:BoundField DataField="BoatName" HeaderText="BoatName" 
                    SortExpression="BoatName" />
                <asp:BoundField DataField="firstName" HeaderText="Last Name" 
                    SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="First Name" 
                    SortExpression="lastName" />
                <asp:BoundField DataField="teamId" HeaderText="TeamID" 
                    SortExpression="teamId" />
                <asp:BoundField DataField="Team Boat Crew" HeaderText="Team Boat Crew" 
                    ReadOnly="True" SortExpression="Team Boat Crew" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
    
    </div>
    <div>
        <asp:SqlDataSource ID="sqldsPaddlerEntriesByDistance" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="sp_sPaddlerEntriesByDistance" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="Th14" Name="MeetID" Type="String" />
                <asp:QueryStringParameter DefaultValue="1000m" Name="sDistance" 
                    QueryStringField="qdistance" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    Return to <asp:HyperLink ID="hyplink2HomeBot" runat="server" NavigateUrl="Default.aspx">Home Page</asp:HyperLink>
    </div>
    
    </form>
</body>
</html>
