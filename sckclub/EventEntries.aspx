<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventEntries.aspx.cs" Inherits="sckreg.EventEntries" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
        <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
       <title>Entries by Event in Ted Houk 2014</title>
    <link rel="Stylesheet" type="text/css" href="sckclub.css" />
    <style type="text/css">  
         .divClub          {  text-align: center; }
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
            <img src="imgs/favicon.ico"  alt="paddler icon"  />
        </div>
        <div class="divHeaderText">
            <asp:Label ID="lblHeaderMeet" runat="server" ForeColor="White" CssClass="lblHeaderMeet">2015 USA Canoe/Kayak Flatwater Sprint Team Trials</asp:Label>
            <asp:Label ID="lblHeaderCoach" runat="server"  CssClass="lblHeaderCoach">Slow Coach</asp:Label>
        </div>
    </div>
    <form id="form1" runat="server">
    <div>
        <h1>Entries per Event in
            <asp:Label ID="lblMeetName" runat="server" Text="Ted Houk 2014"></asp:Label>
        </h1>
    </div>
    
    <div id="divTable">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            CellPadding="4" DataSourceID="sqldsEventsByBoat" 
            EmptyDataText="There are no entries for this event" GridLines="Horizontal">
            <RowStyle BackColor="White" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="EventsId" HeaderText="EventsId" 
                    SortExpression="EventsId" />
                <asp:BoundField DataField="EventName" HeaderText="EventName" 
                    SortExpression="EventName" />
                <asp:BoundField DataField="teamId" HeaderText="teamId" 
                    SortExpression="teamId" />
                <asp:BoundField DataField="BoatName" HeaderText="BoatName" 
                    SortExpression="BoatName" />
                <asp:BoundField DataField="Team Boat Crew" HeaderText="Team Boat Crew" 
                    SortExpression="Team Boat Crew" />
                <asp:BoundField DataField="Paddlers" HeaderText="Paddlers" ReadOnly="True" 
                    SortExpression="Paddlers" />
                <asp:BoundField DataField="Required" HeaderText="Required" 
                    SortExpression="Required" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    
    </div>
    <div>
        <asp:SqlDataSource ID="sqldsEventsByBoat" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="sp_EventsByBoat" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="EventsID" QueryStringField="qeventid" 
                    Type="String" DefaultValue="101" />
                <asp:QueryStringParameter DefaultValue="TH14" Name="MeetID" 
                    QueryStringField="qmeet" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
     <asp:HyperLink ID="hyplnkAllEventsByDistance2" runat="server" NavigateUrl="AllEventsByDistance.aspx?qdistance={0}">Return to Events Page</asp:HyperLink> 
        <br />
        <asp:HyperLink ID="hyplnkAllEvents" runat="server" 
            NavigateUrl="~/AllEvents.aspx?qmeet={0}&qage={1}">Return to All Events</asp:HyperLink>
     </div>
    </form>
</body>
</html>
