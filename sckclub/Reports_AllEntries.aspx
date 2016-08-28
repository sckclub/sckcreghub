<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports_AllEntries.aspx.cs" Inherits="sckreg.Reports_AllEntries" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
            <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>SCKC Online Regisration - Entries report</title>
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
    <h1> All Entries for 
        <asp:Label ID="lblMeetName" runat="server" Text="Name of Meet"></asp:Label></h1>
    </div>
    
    <div>
    
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="sqlAllEntriesByMeet" GridLines="Horizontal">
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:BoundField DataField="Row" HeaderText="Counter" SortExpression="Row" />
                <asp:BoundField DataField="Race day" HeaderText="Race day" ReadOnly="True" 
                    SortExpression="Race day" />
                <asp:BoundField DataField="EventOrder" HeaderText="EventOrder" 
                    SortExpression="EventOrder" />
                <asp:BoundField DataField="EventsId" HeaderText="EventsId" 
                    SortExpression="EventsId" />
                <asp:BoundField DataField="Event Name" HeaderText="Event Name" 
                    SortExpression="Event Name" />
                <asp:BoundField DataField="teamId" HeaderText="teamId" 
                    SortExpression="teamId" />
                <asp:BoundField DataField="firstName" HeaderText="firstName" 
                    SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" 
                    SortExpression="lastName" />
                <asp:BoundField DataField="Birthday" HeaderText="Birthday" ReadOnly="True" 
                    SortExpression="Birthday" />
                <asp:BoundField DataField="AgeJan012015" HeaderText="AgeJan012015" 
                    ReadOnly="True" SortExpression="AgeJan012015" />
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
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
    
    
    </div>
    <asp:SqlDataSource ID="sqlAllEntriesByMeet" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="SP_Reports_sAllEntriesByMeet" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TR15" Name="MeetId" 
                QueryStringField="qmeet" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
    
    <asp:HyperLink ID="hyplnkReportsHome" runat="server" NavigateUrl="Reports.aspx?qmeet={0}">Reports Home</asp:HyperLink>
    
</body>
</html>
