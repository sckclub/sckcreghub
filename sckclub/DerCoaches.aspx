<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DerCoaches.aspx.cs" Inherits="sckclub._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: "Times New Roman", Times, serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
        <h1>
            Coaches List for <asp:Label ID="lblMeetName" runat="server" Text="Ted Houk 2014"></asp:Label> &nbsp;Entries
        </h1>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="CoachID" DataSourceID="SqlDS_Coaches" AllowSorting="True" 
            CellPadding="4" 
            ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            EmptyDataText="No coach assigned to this regatta yet" 
            AutoGenerateEditButton="True">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="clubApprev" HeaderText="clubApprev" 
                    SortExpression="clubApprev" ReadOnly="True" />
                <asp:BoundField DataField="name" HeaderText="Club Name" SortExpression="name" 
                    ReadOnly="True" />
                <asp:BoundField DataField="First" HeaderText="First" SortExpression="First" 
                    ReadOnly="True" />
                <asp:BoundField DataField="Last" HeaderText="Last" SortExpression="Last" 
                    ReadOnly="True" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="NeedsPaper" HeaderText="NeedsPaper" 
                    SortExpression="NeedsPaper" />
                <asp:HyperLinkField DataNavigateUrlFields="ThisMeetID,clubApprev" 
                    DataNavigateUrlFormatString="paddlers.aspx?qmeet={0}&amp;qclub={1}" 
                    HeaderText="Manage Paddlers" DataTextField="clubApprev" 
                    DataTextFormatString="Manage {0}" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDS_Coaches" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        
        
        SelectCommand="select clubApprev, tT.name,  First, Last, email, qcc ,  CoachID, MeetID 'ThisMeetID', NeedsPaper
from viewCoachsByMeet tC join th2013_Teams tT on tC.clubApprev= tT.id 
where MeetID = @ThisMeet
order by clubApprev" UpdateCommand="Update tCoaches set  email = @email, qcc = @qcc ,  NeedsPaper= @NeedsPaper
where ThisMeetID = @ThisMeet and CoachID = @CoachID
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TH16" Name="ThisMeet" 
                QueryStringField="qmeet" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="email" />
            <asp:Parameter Name="qcc" />
            <asp:Parameter Name="NeedsPaper" />
            <asp:Parameter Name="ThisMeet" />
            <asp:Parameter Name="CoachID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div>
    </div>
    <div id='divForCoaches' runat="server">
        If you are the coach designated to enter paddlers for your club, but your 
        club/name does not appear above, email the Ted Houk 2014 competition secretary,
        <a href = "mailto:philipmurphy@wonderanimal.com?subject=TH2014 Coach registration">Philip Murphy, SCKC</a> 
        and request that you be registered as the entries coach for TH2014.<br />
        <br />

        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="http://www.seattlecanoeclub.org/">Main Seattle Canoe and Kayak Club web page</asp:HyperLink>
    </div>
    <asp:GridView ID="grdvwEmailsPaste" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="sqlCoachEmails4Paste">
        <RowStyle ForeColor="#000066" />
        <Columns>
            <asp:BoundField DataField="Column1" HeaderText="Paste these emails" 
                ReadOnly="True" SortExpression="Column1" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sqlCoachEmails4Paste" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand=" select '''' + rtrim(first) + ' ' + rtrim(last) +''' &lt;' + rtrim(email) + '&gt;' from tCoaches where ThisMeetID=@meetId and not clubApprev='UNREAL' order by Last">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="NT16" Name="meetId" 
                QueryStringField="meetId" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
        <div id="divReportsNav" runat="server">
        <asp:HyperLink ID="hyplnkReportsHome" runat="server" 
        NavigateUrl="~/Reports.aspx?qmeet={0}">Return to Reports Home</asp:HyperLink>
    </div>

</body>
</html>
