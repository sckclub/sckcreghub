<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="AllEventsByDistance.aspx.cs" Inherits="sckreg.AllEventsByDistance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>All Events at Ted Houk 2014 At each Distance</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>All Events at Ted Houk 2014 at <%= Request.QueryString["qdistance"] %> distance</h1>
    </div>
    <div>
    
     
       Return to <asp:HyperLink ID="hyplink2Home" runat="server" NavigateUrl="Default.aspx">Home Page</asp:HyperLink>
    <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource1">
            <RowStyle BackColor="White" ForeColor="#003399" />
            <Columns>
                <asp:BoundField DataField="EventsId" HeaderText="EventsId" 
                    SortExpression="EventsId" />
                <asp:BoundField DataField="EventName" HeaderText="EventName" 
                    SortExpression="EventName" />
                <asp:BoundField DataField="Competition" HeaderText="Competition" 
                    SortExpression="Competition" />
                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                <asp:BoundField DataField="Boat Type" HeaderText="Boat Type" 
                    SortExpression="Boat Type" />
                <asp:BoundField DataField="Distance" HeaderText="Distance" 
                    SortExpression="Distance" />
                <asp:BoundField DataField="Paddlers" HeaderText="Paddlers" ReadOnly="True" 
                    SortExpression="Paddlers" />
                <asp:BoundField DataField="Boats" HeaderText="Boats" ReadOnly="True" 
                    SortExpression="Boats" />
                <asp:BoundField DataField="CompleteBoats" HeaderText="CompleteBoats" 
                    ReadOnly="True" SortExpression="CompleteBoats" />
                <asp:HyperLinkField DataNavigateUrlFields="EventsId, Distance" 
                    DataNavigateUrlFormatString="EventEntries.aspx?qeventid={0}&amp;qdistance={1}" 
                    DataTextField="EventsId" DataTextFormatString="Entries for {0}" 
                    HeaderText="Review Entries" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        </asp:GridView>
        <br />
           <asp:HyperLink ID="hyplnkHome" runat="server" NavigateUrl="Default.aspx">Home Page</asp:HyperLink>
 
    
    </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="sp_EventsByDistance" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1000m" Name="sDistance" 
                    QueryStringField="qdistance" Type="String" />
                <asp:Parameter DefaultValue="TH14" Name="MeetID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
     
    </div>
    </form>
</body>
</html>
