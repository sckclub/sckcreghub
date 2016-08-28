<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports_IndivPaddlers.aspx.cs" Inherits="sckreg.Reports_IndivPaddlers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Online Registration -- Individual paddlers report</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Individual Entries for 2014 ICF Canoe Marathon Masters World Cub</h1>
    </div>
    <div><h2>Summary Stats by Country</h2>
    <asp:GridView ID="GridView2" runat="server" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataSourceID="sqlDataEntriesSummary" 
            ForeColor="Black" GridLines="None">
        <Columns>
            <asp:BoundField DataField="country" HeaderText="Country" ReadOnly="True" 
                SortExpression="country" />
            <asp:BoundField DataField=" Paddlers" HeaderText=" Paddlers" ReadOnly="True" 
                SortExpression=" Paddlers" />
            <asp:BoundField DataField="Paddlers with Entries" 
                HeaderText="Paddlers with Entries" ReadOnly="True" 
                SortExpression="Paddlers with Entries" />
            <asp:BoundField DataField="Canoe" HeaderText="Canoe" ReadOnly="True" 
                SortExpression="Canoe" />
            <asp:BoundField DataField="Kayak" HeaderText="Kayak" ReadOnly="True" 
                SortExpression="Kayak" />
            <asp:BoundField DataField="Va'a" HeaderText="Va'a" ReadOnly="True" 
                SortExpression="Va'a" />
            <asp:BoundField DataField="Paracanoeists" HeaderText="Paracanoeists" 
                ReadOnly="True" SortExpression="Paracanoeists" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
       
        <p>
            <asp:SqlDataSource ID="sqlDataEntriesSummary" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
                SelectCommand="SP_Reports_sAllEntriesByMeetCountryIndiv" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="MM14" Name="MeetId" 
                        QueryStringField="meetid" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    
    
    </div>
    <div>
    <h2>Individual Paddler Stats</h2>
    
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="PaddlerID" DataSourceID="sqldsEntries" 
            EmptyDataText="No paddlers found for this Meet" GridLines="Horizontal">
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:BoundField DataField="firstName" HeaderText="firstName" 
                    SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" 
                    SortExpression="lastName" />
                <asp:BoundField DataField="PaddlerID" HeaderText="PaddlerID" ReadOnly="True" 
                    SortExpression="PaddlerID" />
                <asp:BoundField DataField="teamId" HeaderText="teamId" 
                    SortExpression="teamId" />
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" />
                <asp:BoundField DataField="Event Entries" HeaderText="Event Entries" 
                    SortExpression="Event Entries" />
                <asp:BoundField DataField="Canoe" HeaderText="Canoe" SortExpression="Canoe" />
                <asp:BoundField DataField="Kayak" HeaderText="Kayak" SortExpression="Kayak" />
                <asp:BoundField DataField="Va'a" HeaderText="Va'a" SortExpression="Va'a" />
                <asp:BoundField DataField="Paracanoe" HeaderText="Paracanoe" 
                    SortExpression="Paracanoe" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
    
    
    </div>
    <asp:SqlDataSource ID="sqldsEntries" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="SP_Reports_sAllPaddlersByMeetIndiv" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="MM14" Name="MeetId" 
                QueryStringField="qmeetid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
