<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="AllEvents.aspx.cs" Inherits="sckreg.AllEvents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
        <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>SCKC Online Registration System All Entries in Events</title>
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
    <h1>REPORT: All Entries in All 
        <asp:Label ID="lblAge" runat="server" Text="Label"></asp:Label>
        Events in Order of Events</h1>
    </div>

       <div id="divAge">
          Show: 
                     <asp:HyperLink ID="hyplnkAgeJuniors" runat="server" ToolTip="Show only Junior and Senior paddlers, including Paracanoeists, from your club/team."
               NavigateUrl="AllEvents.aspx?qmeet={0}&qage=Juniors" 
               BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Juniors/Seniors</asp:HyperLink>
          or
            <asp:HyperLink ID="hyplnkAgeMasters" runat="server" ToolTip="Show only Masters paddlers from your club/team."
               NavigateUrl="AllEvents.aspx?qmeet={0}&qage=Masters" 
               BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Masters</asp:HyperLink>
          or            <asp:HyperLink ID="hyplnkAgeALL" runat="server" ToolTip="Show all paddlers from your club/team currently recorded in this system."
               NavigateUrl="AllEvents.aspx?qmeet={0}&qage=ALL" 
               BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">ALL</asp:HyperLink>
            <br />
       </div>
    <div id="Table">
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="sqldsOrderEvents" GridLines="Vertical">
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="Race day" HeaderText="Race day" ReadOnly="True" 
                    SortExpression="Race day" />
                <asp:BoundField DataField="Order" HeaderText="Order" SortExpression="Order" />
                <asp:BoundField DataField="EventID" HeaderText="EventID" 
                    SortExpression="EventID" />
                <asp:BoundField DataField="Event Name" HeaderText="Event Name" 
                    SortExpression="Event Name" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                <asp:BoundField DataField="Competition" HeaderText="Competition" 
                    SortExpression="Competition" />
                <asp:BoundField DataField="Boat type" HeaderText="Boat type" ReadOnly="True" 
                    SortExpression="Boat type" />
                <asp:BoundField DataField="Entries" HeaderText="Entries" ReadOnly="True" 
                    SortExpression="Entries" >
                <ItemStyle CssClass="cssNumber" />
                </asp:BoundField>
                <asp:BoundField DataField="Boats" HeaderText="Boats" SortExpression="Boats">
                <ItemStyle CssClass="cssNumber" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="meetId,EventID, Age" 
                    DataNavigateUrlFormatString="EventEntries.aspx?qmeet={0}&amp;qeventid={1}&amp;qage={2}" 
                    DataTextField="EventID" DataTextFormatString="Review {0}" 
                    HeaderText="Review Entries" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#DCDCDC" />
        </asp:GridView>
    
    
    
    </div>
    
        <div>
    
            <asp:SqlDataSource ID="sqldsOrderEvents" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
                SelectCommand="sp_sOrderOfEventswEntriesByAge" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="NAT15" Name="MeetID" 
                        QueryStringField="qmeet" Type="String" />
                    <asp:QueryStringParameter DefaultValue="Masters" Name="Age" 
                        QueryStringField="qage" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    
       <asp:HyperLink ID="hyplnkHome" runat="server" NavigateUrl="Default.aspx">Home Page</asp:HyperLink>
    </div>
    <asp:HyperLink ID="hyplnkReportsHome" runat="server" 
        NavigateUrl="~/Reports.aspx?QMEET={0}">Return to Reports Home</asp:HyperLink>
    </form>
</body>
</html>
