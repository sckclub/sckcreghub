<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports_JR_Entries.aspx.cs" Inherits="sckreg.Reports_JR_Entries" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
        <title>SCKC Online Registration - Entries for JRaceman</title>
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
    <h1>Entries in Regatta for JRaceman - !table Entries</h1>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="grdvwJREnries" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="sqlsrvJREntries" ForeColor="#333333" 
            GridLines="None">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="!columns &quot;id&quot;," 
                    HeaderText="!columns &quot;id&quot;," ReadOnly="True" 
                    SortExpression="!columns &quot;id&quot;," />
                <asp:BoundField DataField="&quot;personId&quot;," 
                    HeaderText="&quot;personId&quot;," ReadOnly="True" 
                    SortExpression="&quot;personId&quot;," />
                <asp:BoundField DataField="&quot;group&quot;," HeaderText="&quot;group&quot;," 
                    ReadOnly="True" SortExpression="&quot;group&quot;," />
                <asp:BoundField DataField="&quot;alternate&quot;," 
                    HeaderText="&quot;alternate&quot;," ReadOnly="True" 
                    SortExpression="&quot;alternate&quot;," />
                <asp:BoundField DataField="&quot;scratched&quot;," 
                    HeaderText="&quot;scratched&quot;," ReadOnly="True" 
                    SortExpression="&quot;scratched&quot;," />
                <asp:BoundField DataField="&quot;eventId&quot;" 
                    HeaderText="&quot;eventId&quot;" ReadOnly="True" 
                    SortExpression="&quot;eventId&quot;" />
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    
    </div>
    <asp:SqlDataSource ID="sqlsrvJREntries" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="SP_JR_sAllEntriesByMeet" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TR15" Name="MeetId" 
                QueryStringField="qmeet" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
    <asp:HyperLink ID="hyplnkReportsHome" runat="server" NavigateUrl="Reports.aspx?qmeet={0}">Reports Home</asp:HyperLink>

</body>
</html>
