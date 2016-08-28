<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports_JR_Events.aspx.cs" Inherits="sckreg.Reports_JR_Events" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
        <title>SCKC Online Registration - Events for JRaceman</title>
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
    <h1>Events in Regatta for JRaceman - !table Events</h1>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
            DataSourceID="sqlsrvJREvents">
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
                <asp:BoundField DataField="!columns &quot;id&quot;," 
                    HeaderText="!columns &quot;id&quot;," SortExpression="!columns &quot;id&quot;," 
                    ReadOnly="True" />
                <asp:BoundField DataField="&quot;meetId&quot;," HeaderText="&quot;meetId&quot;," 
                    SortExpression="&quot;meetId&quot;," ReadOnly="True" />
                <asp:BoundField DataField="&quot;number&quot;," HeaderText="&quot;number&quot;," 
                    SortExpression="&quot;number&quot;," ReadOnly="True" />
                <asp:BoundField DataField="&quot;name&quot;," HeaderText="&quot;name&quot;," 
                    SortExpression="&quot;name&quot;," ReadOnly="True" />
                <asp:BoundField DataField="&quot;competitionId&quot;," HeaderText="&quot;competitionId&quot;," 
                    SortExpression="&quot;competitionId&quot;," ReadOnly="True" />
                <asp:BoundField DataField="&quot;levelId&quot;," HeaderText="&quot;levelId&quot;," 
                    SortExpression="&quot;levelId&quot;," ReadOnly="True" />
                <asp:BoundField DataField="&quot;genderId&quot;," 
                    HeaderText="&quot;genderId&quot;," ReadOnly="True" 
                    SortExpression="&quot;genderId&quot;," />
                <asp:BoundField DataField="&quot;areaId&quot;," 
                    HeaderText="&quot;areaId&quot;," 
                    SortExpression="&quot;areaId&quot;," />
                <asp:BoundField DataField="&quot;seedingPlanId&quot;," 
                    HeaderText="&quot;seedingPlanId&quot;," 
                    SortExpression="&quot;seedingPlanId&quot;," />
                <asp:BoundField DataField="&quot;progressionId&quot;," 
                    HeaderText="&quot;progressionId&quot;," 
                    SortExpression="&quot;progressionId&quot;," />
                <asp:BoundField DataField="&quot;progressionState&quot;,&quot;scoringSystemId&quot;,&quot;scratched&quot;,&quot;eventComment&quot;" 
                    HeaderText="&quot;progressionState&quot;,&quot;scoringSystemId&quot;,&quot;scratched&quot;,&quot;eventComment&quot;" 
                    SortExpression="&quot;progressionState&quot;,&quot;scoringSystemId&quot;,&quot;scratched&quot;,&quot;eventComment&quot;" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    
    </div>
    <asp:SqlDataSource ID="sqlsrvJREvents" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sp_sReports_JREvents" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TR15" Name="MeetID" 
                QueryStringField="qmeet" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
       <asp:HyperLink ID="hyplnkReportsHome" runat="server" NavigateUrl="Reports.aspx?qmeet={0}">Reports Home</asp:HyperLink>

    </form>
</body>
</html>
