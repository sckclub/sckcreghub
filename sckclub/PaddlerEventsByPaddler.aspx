<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaddlerEventsByPaddler.aspx.cs" Inherits="sckreg.PaddlerEventsByPaddler" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SCKC Online Registration System - All the Events for Specified Paddler</title>
        <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
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
    <form id="form1" runat="server">
    <div style="float:left;">
    <h1>Review all the events for paddler 
     <%= Request.QueryString["qfname"] %> <%= Request.QueryString["qlname"] %> from <%= Request.QueryString["qclub"] %>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        </h1>
    </div>
    <div  style="text-align: right; float:right; padding:20px; font-size:larger;" >
        return to 
        <asp:HyperLink ID="hyplnkTeamEntries" runat="server" 
            NavigateUrl="TeamEntries.aspx?qclub={0}&amp;qmeet={1}&qage={2}">Team Entries Summary</asp:HyperLink>    
    </div>
    
    
    <div  style="text-align: center; clear:both;">  
       
        <asp:GridView ID="gvPaddlerEntries" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="sqldsPaddlerEntries" 
            EmptyDataText="No entries were found for this paddler" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical">
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="EventsId" HeaderText="EventsId" 
                    SortExpression="EventsId" />
                <asp:BoundField DataField="EventName" HeaderText="EventName" 
                    SortExpression="EventName" />
                <asp:BoundField DataField="Competition" HeaderText="Competition" 
                    SortExpression="Competition" />
                <asp:BoundField DataField="Level" HeaderText="Level" 
                    SortExpression="Level" />
                <asp:BoundField DataField="Boat Type" HeaderText="Boat Type" ReadOnly="True" 
                    SortExpression="Boat Type" />
                <asp:BoundField DataField="Distance" HeaderText="Distance" 
                    SortExpression="Distance" ReadOnly="True" />
                <asp:BoundField DataField="BoatName" HeaderText="BoatName" 
                    SortExpression="BoatName" />
                <asp:BoundField DataField="Team Boat Crew" HeaderText="Team Boat Crew" 
                    ReadOnly="True" SortExpression="Team Boat Crew" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#DCDCDC" />
        </asp:GridView>
        <br />
    
    
    
    To change these entries, go to  
    <asp:HyperLink ID="hyplnkPaddlerPage" runat="server" NavigateUrl="EntriesPerPaddler.aspx?qclub={0}&amp;qpaddler={1}&amp;qfname={2}&amp;qlname={3}&amp;qmeet={4}&qage={5}">this Paddler's Entries Page</asp:HyperLink>
    </div>
  
    <asp:SqlDataSource ID="sqldsPaddlerEntries" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sp_sPaddlerEventsByPaddler" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TH14" Name="MeetID" 
                QueryStringField="qmeet" Type="String" />
            <asp:QueryStringParameter DefaultValue="" Name="sPaddlerID" 
                QueryStringField="qpaddler" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
