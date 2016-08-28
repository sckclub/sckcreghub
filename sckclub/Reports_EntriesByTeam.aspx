<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports_EntriesByTeam.aspx.cs" Inherits="sckreg.Reports_EntriesByTeam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    
        <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>SCKC Online Registration - Team Entries</title>
    <link rel="Stylesheet" type="text/css" href="sckclub.css" />
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
    <h1>Entries for <asp:Label ID="lblTeamName" runat="server" Text="Team Name"></asp:Label> </h1>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="sqlsrcEntriesByTeam" ForeColor="Black" GridLines="Vertical">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="Row" HeaderText="Row" ReadOnly="True" 
                    SortExpression="Row" />
                <asp:BoundField DataField="firstName" HeaderText="firstName" 
                    SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" 
                    SortExpression="lastName" />
                <asp:BoundField DataField="PaddlerID" HeaderText="PaddlerID" ReadOnly="True" 
                    SortExpression="PaddlerID" />
                <asp:BoundField DataField="AgeJan012015" HeaderText="AgeJan012015" 
                    ReadOnly="True" SortExpression="AgeJan012015" />
                <asp:BoundField DataField="Race day" HeaderText="Race day" ReadOnly="True" 
                    SortExpression="Race day" />
                <asp:BoundField DataField="EventOrder" HeaderText="EventOrder" 
                    SortExpression="EventOrder" />
                <asp:BoundField DataField="EventsId" HeaderText="EventsId" 
                    SortExpression="EventsId" />
                <asp:BoundField DataField="Event Name" HeaderText="Event Name" 
                    SortExpression="Event Name" />
                <asp:BoundField DataField="Boatname" HeaderText="Boatname" ReadOnly="True" 
                    SortExpression="Boatname" />
                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                <asp:BoundField DataField="Competition" HeaderText="Competition" 
                    SortExpression="Competition" />
                <asp:BoundField DataField="Boat type" HeaderText="Boat type" ReadOnly="True" 
                    SortExpression="Boat type" />
                <asp:BoundField DataField="Event Gender" HeaderText="Event Gender" 
                    ReadOnly="True" SortExpression="Event Gender" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    
    </div>
    <asp:SqlDataSource ID="sqlsrcEntriesByTeam" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="SP_Reports_sAllEntriesByTeam" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TR15" Name="MeetId" 
                QueryStringField="qmeet" Type="String" />
            <asp:QueryStringParameter DefaultValue="SCKC" Name="TeamId" 
                QueryStringField="qclub" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HyperLink ID="hyplnkTR15" runat="server" 
        NavigateUrl="~/NAT16.aspx?qcc={0}">Return to Home</asp:HyperLink>
    </form>
</body>
</html>
