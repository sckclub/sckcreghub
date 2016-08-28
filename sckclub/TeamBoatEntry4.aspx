<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamBoatEntry4.aspx.cs" Inherits="sckreg.TeamBoatEntry4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
        <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>SCKC Online Registration Enter teamboats for an Event</title>
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
    <h1>4 Seat Teamboat entry for 
        <asp:Label ID="lblPaddler" runat="server" Text="[PADDLER]"></asp:Label>
        in <asp:Label ID="lblEvent" runat="server" Text="[EVENT]"></asp:Label>
    </h1>
    
    <div>
        Paddlers from the 
        <asp:Label ID="lblTeamID" runat="server" Text="[TeamID}"></asp:Label>
        already entered in this event.
        
        <asp:GridView ID="grdviewTeamBoarsInEvent" runat="server" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="sqldataTeamBoatsbyEvent" EmptyDataText="No paddlers from this club are entered in this event to date.">
            <RowStyle BackColor="White" ForeColor="#003399" />
            <Columns>
                <asp:BoundField DataField="eventId" HeaderText="eventId" 
                    SortExpression="eventId" />
                <asp:BoundField DataField="EventName" HeaderText="EventName" 
                    SortExpression="EventName" />
                <asp:BoundField DataField="Boatname" HeaderText="Boatname" 
                    SortExpression="Boatname" />
                <asp:BoundField DataField="Paddler1" HeaderText="Paddler1" ReadOnly="True" 
                    SortExpression="Paddler1" />
                <asp:BoundField DataField="Paddler2" HeaderText="Paddler2" ReadOnly="True" 
                    SortExpression="Paddler2" />
                <asp:BoundField DataField="Paddler3" HeaderText="Paddler3" ReadOnly="True" 
                    SortExpression="Paddler3" />
                <asp:BoundField DataField="Paddler4" HeaderText="Paddler4" ReadOnly="True" 
                    SortExpression="Paddler4" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        </asp:GridView>
    
        <br />
    
    </div>
    <div id="divID2Seats">
       <table id="tblAdd2Seater" border="1" cellpadding="3">
           <thead>
                <tr>
                    <th>
                        <asp:Label ID="lblBoatType" runat="server" Text="Boattype"></asp:Label>
                    </th>
                     <th>BoatName</th>
                      <th>ThisPaddler</th>
                       <th>2nd Paddler</th>
                       <th>3rd Paddler</th>
                       <th>4th Paddler</th>
                       <th><br /></th>
                        <th><br /></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><asp:LinkButton ID="lnkButAddBoat" runat="server" 
                           BackColor="#6699FF" ForeColor="White" 
                            PostBackUrl="TeamBoatEntry4.aspx?qmeet={0}&amp;qev={1}&amp;qclub={2}&amp;qpaddler={3}&amp;qaction=ADD" 
                            Enabled="True" onclick="lnkButAddBoat_Click" 
                            
                            ToolTip="Click to make a boat of these paddlers.  If only one paddler, they are added with a NEED flag.">Save Boat</asp:LinkButton>
                    </td>
                    <td><asp:TextBox ID="txtBoatname" runat="server" ReadOnly="True"></asp:TextBox></td>
                    <td><asp:Label ID="lblThisPaddler" runat="server" Text="[ThisPaddler]"></asp:Label></td>
                    <td><asp:DropDownList ID="dropdownPaddler2" runat="server" AutoPostBack="true"
                            onselectedindexchanged="dropdownPaddler2_SelectedIndexChanged">
                    </asp:DropDownList></td>
                    <td> 
                        <asp:DropDownList ID="dropdownPaddler3" runat="server" AutoPostBack="true"
                            onselectedindexchanged="dropdownPaddler3_SelectedIndexChanged">
                    </asp:DropDownList>  </td>
                    <td> 
                        <asp:DropDownList ID="dropdownPaddler4" runat="server" AutoPostBack="true"
                            onselectedindexchanged="dropdownPaddler4_SelectedIndexChanged">
                    </asp:DropDownList>  </td>
                    <td> 
                        <asp:LinkButton ID="lnkButDissolve2Boat" runat="server"
                         BackColor="#CC3300" ForeColor="White" 
                            
                            
                            PostBackUrl="TeamBoatEntry4.aspx?qmeet={0}&qev={1}&qclub={2}&qpaddler={3}&qaction=DIS" 
                            onclick="lnkButDissolve2Boat_Click" ToolTip="Click to keep the paddlers in this event, but no longer in a boat together." 
                        >Dissolve this boat</asp:LinkButton>  </td>
                    <td> 
                        <asp:LinkButton ID="lnkButDelete2Boat" runat="server"
                        BackColor="Red" ForeColor="White"                         
                            PostBackUrl="TeamBoatEntry4.aspx?qmeet={0}&qev={1}&qclub={2}&qpaddler={3}&qaction=DEL" 
                            onclick="lnkButDelete2Boat_Click" ToolTip="Click to delete the paddlers from this event" 
                        >Delete these entries</asp:LinkButton>   </td>
                </tr>
            </tbody>
        </table>
        <asp:Label ID="lblMessage2Seater" runat="server" Text="ErrMessage for 4 Seater"></asp:Label><br />
    </div>
    <div>
        <br />
        <asp:HyperLink ID="hyplnkPaddlerPage" runat="server" NavigateUrl="EntriesPerPaddler.aspx?qmeet={0}&amp;qclub={1}&amp;qpaddler={2}&qage={3}">Return to Paddler's Entries Page</asp:HyperLink>
        <br />
        <asp:HyperLink ID="hyplnkTeamEntries" runat="server" 
            NavigateUrl="Paddlers.aspx?qclub={0}&qmeet={1}&qage={2}" Visible="False">Return to Team Entrieds</asp:HyperLink>
        <br />
        <br />
        <asp:SqlDataSource ID="sqldataTeamBoatsbyEvent" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="sp_sTeamBoatsInEventByTeam4" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="TH16.321" Name="eventId" 
                    QueryStringField="qev" Type="String" />
                <asp:QueryStringParameter DefaultValue="SCKC" Name="teamId" 
                    QueryStringField="qclub" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    </form>
    
</body>
</html>
