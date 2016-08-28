<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="sckreg.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>SCKC Online Entry System Draft Order of Events</title>
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
    <div class="divH1" style="text-align:center;">
        <h1>
        <asp:Label ID="lblMeetName" runat="server" Text="Ted Houk 2014"></asp:Label>
         &nbsp;Draft Order of Events
       </h1>

 
    Note - this page opened in a new browser Tab for reference -- your orginal browser tab is still open.<br />
        Show: <asp:LinkButton ID="lnkButJuniors" runat="server" 
            PostBackUrl="~/Events.aspx?qmeet={0}&qage=JUNIORS" BackColor="#3399FF" ForeColor="White">Juniors/Seniors</asp:LinkButton> 
          <asp:LinkButton ID="lnkButPara" runat="server" 
            PostBackUrl="~/Events.aspx?qmeet={0}&qage=PARA" BackColor="#3399FF" ForeColor="White">Para</asp:LinkButton> 
           <asp:LinkButton ID="lnkButMasters" runat="server" 
            PostBackUrl="~/Events.aspx?qmeet={0}&qage=MASTERS" BackColor="#3399FF" ForeColor="White">MASTERS</asp:LinkButton> 
           <asp:LinkButton ID="lnkButALL" runat="server" 
            PostBackUrl="~/Events.aspx?qmeet={0}&qage=ALL" BackColor="#3399FF" ForeColor="White">ALL Events</asp:LinkButton> 
        <br />
     </div>
     <div style="text-align:center;">
     <center>
&nbsp;<asp:GridView ID="gvEvents" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="sqldsEvents" GridLines="None" 
            AllowSorting="True" ForeColor="#333333">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="EventID" HeaderText="EventID" 
                    SortExpression="EventID" />
                <asp:BoundField DataField="Event Name" HeaderText="Event Name" 
                    SortExpression="Event Name" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="Level" HeaderText="Level" 
                    SortExpression="Level" />
                <asp:BoundField DataField="Competition" HeaderText="Competition" 
                    SortExpression="Competition" />
                <asp:BoundField DataField="Boat type" HeaderText="Boat type" 
                    SortExpression="Boat type" ReadOnly="True" />
                <asp:BoundField DataField="Race day" HeaderText="Race day" 
                    SortExpression="Race day" ReadOnly="True" />
                <asp:BoundField DataField="eventOrder" HeaderText="eventOrder" 
                    SortExpression="eventOrder" />
            </Columns>
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        </center>
    
    </div>
    <asp:SqlDataSource ID="sqldsEvents" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sp_sOrderOfEventsByAge" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TH16" Name="meetId" 
                QueryStringField="qmeet" Type="String" />
            <asp:QueryStringParameter DefaultValue="ALL" Name="Age" QueryStringField="qage" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblPara" runat="server" 
        Text="Note - paracanoeist events may be further defined"></asp:Label>
    </form>
</body>
</html>
