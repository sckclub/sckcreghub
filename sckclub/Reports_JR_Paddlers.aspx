<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports_JR_Paddlers.aspx.cs" Inherits="sckreg.Reports_JR_Paddlers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>Reports Events in Regatta for JRaceman</title>
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
    <h1>Paddlers in Regatta for JRaceman - !table People</h1>
    <form id="form1" runat="server">
    <div>
            <asp:GridView ID="grdvwPaddlers" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                CellPadding="4" DataSourceID="sqlsrvPaddlersByMeet" GridLines="Horizontal">
                <RowStyle BackColor="White" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="!columns &quot;id&quot;," 
                        HeaderText="!columns &quot;id&quot;," ReadOnly="True" 
                        SortExpression="!columns &quot;id&quot;," />
                    <asp:BoundField DataField="&quot;lastName&quot;," 
                        HeaderText="&quot;lastName&quot;," ReadOnly="True" 
                        SortExpression="&quot;lastName&quot;," />
                    <asp:BoundField DataField="&quot;firstName&quot;," 
                        HeaderText="&quot;firstName&quot;," ReadOnly="True" 
                        SortExpression="&quot;firstName&quot;," />
                    <asp:BoundField DataField="&quot;title&quot;," HeaderText="&quot;title&quot;," 
                        ReadOnly="True" SortExpression="&quot;title&quot;," />
                    <asp:BoundField DataField="&quot;teamId&quot;," 
                        HeaderText="&quot;teamId&quot;," ReadOnly="True" 
                        SortExpression="&quot;teamId&quot;," />
                    <asp:BoundField DataField="&quot;birthday&quot;," 
                        HeaderText="&quot;birthday&quot;," ReadOnly="True" 
                        SortExpression="&quot;birthday&quot;," />
                    <asp:BoundField DataField="&quot;genderId&quot;," 
                        HeaderText="&quot;genderId&quot;," ReadOnly="True" 
                        SortExpression="&quot;genderId&quot;," />
                    <asp:BoundField DataField="&quot;membership&quot;," 
                        HeaderText="&quot;membership&quot;," ReadOnly="True" 
                        SortExpression="&quot;membership&quot;," />
                    <asp:BoundField DataField="&quot;membershipExpiration&quot;,&quot;teamEdit&quot;,&quot;street&quot;,&quot;street2&quot;," 
                        HeaderText="&quot;membershipExpiration&quot;,&quot;teamEdit&quot;,&quot;street&quot;,&quot;street2&quot;," 
                        ReadOnly="True" 
                        SortExpression="&quot;membershipExpiration&quot;,&quot;teamEdit&quot;,&quot;street&quot;,&quot;street2&quot;," />
                    <asp:BoundField DataField="&quot;city&quot;,&quot;state&quot;," 
                        HeaderText="&quot;city&quot;,&quot;state&quot;," ReadOnly="True" 
                        SortExpression="&quot;city&quot;,&quot;state&quot;," />
                    <asp:BoundField DataField="&quot;country&quot;,&quot;zip&quot;,&quot;phone&quot;,&quot;fax&quot;,&quot;email&quot;,&quot;webPassword&quot;" 
                        HeaderText="&quot;country&quot;,&quot;zip&quot;,&quot;phone&quot;,&quot;fax&quot;,&quot;email&quot;,&quot;webPassword&quot;" 
                        ReadOnly="True" 
                        SortExpression="&quot;country&quot;,&quot;zip&quot;,&quot;phone&quot;,&quot;fax&quot;,&quot;email&quot;,&quot;webPassword&quot;" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </div>
    <div>
        <asp:SqlDataSource ID="sqlsrvPaddlersByMeet" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="sp_JRPaddlerInMeet" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="NAT15" Name="meetId" 
                    QueryStringField="qmeet" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <asp:HyperLink ID="hyplnkReportsHome" runat="server" 
        NavigateUrl="~/Reports.aspx?qmeet={0}">Reports Home</asp:HyperLink>
    </form>
</body>
</html>
