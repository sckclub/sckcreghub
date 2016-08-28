<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamEntries.aspx.cs" Inherits="sckreg.TeamEntries" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>SCKC Online Registration System Team Entries</title>
    <link rel="Stylesheet" type="text/css" href="sckclub.css" />
    <style type="text/css">  
         .divClub          {  text-align: center; }
         #divPaymentsTH15 {display:none;}
         .divclsPayments {visibility:visible;}
         .divclsWaiver { text-align: left;}
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
    <div style="text-align: center">
        <div style="float:left;">
            <h1>&nbsp;Team Entries, Payment and Waivers for 
                <asp:Label ID="lblClub" runat="server" Text="[ClubName]" ForeColor="#000099"></asp:Label> </h1>
        </div>
        <div  style="text-align: center; float:right; padding:20px; font-size:larger;" >
            return to <asp:HyperLink ID="hypTeamPaddlers" runat="server" NavigateUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&qage={2}">Team's Paddlers Page</asp:HyperLink>
        </div>
      </div>
        
    <div style="clear:both; text-align: center;">
         <div id="divNT16" runat="server" style = "border:1px solid blue; padding: 4px; visibility:visible;">
            The 2016 National Championships is USA Canoe/Kayak regatta. Each competitor must be a current USA Canoe/Kayak member, or a member of his or her national canoe federation in good standing.  
         All US competitors must be members of the USA C/K in good standing from July 6th through August 6th, 2016.             
        </div>
          <div id="divInternational" runat="server" style = "border:1px solid blue; padding: 4px;">
            The 2014 LPI Regatta is USA C/K event. Each competitor must be a current USA Canoe/Kayak member, in good standing, or a member of his or her national canoe federation. For questions, please contact Gerald Babao via email at <a href="mailto:gerald@usack.org">gerald@usack.org</a>. 
        </div>
        <div id="divNational" runat="server" style = "border:1px solid blue; padding: 4px;">
            The 2015 US Trials Regatta is USA C/K event. Each competitor must be a current USA Canoe/Kayak member, in good standing. 
            For questions, please contact Gerald Babao via email at <a href="mailto:gerald@usack.org">gerald@usack.org</a>. 
        </div>
        <div id="divTH15" runat="server" style = "border:1px solid blue; padding: 4px; display:none; visibility:collapse;">
            The Ted Houk Regatta is a USA Canoe Kayak event. Each competitor must be a current USA Canoe/Kayak member, or a member of his or her national canoe federation in good standing. 
        </div>
        <div id="divNAT15" runat="server" style = "border:1px solid blue; padding: 4px; visibility:visible;">
            The 2015 National Championships is USA Canoe/Kayak regatta. Each competitor must be a current USA Canoe/Kayak member, or a member of his or her national canoe federation in good standing. 
        </div>
        <div id="divTH" runat="server" style = "border:1px solid blue; padding: 4px; visibility:visible;">
            This Ted Houk regatta is a USA Canoe/Kayak regatta. Each competitor must be a current USA Canoe/Kayak member, or a member of his or her national canoe federation in good standing. 
        </div>

    </div>
    <!--
    By Paddler - for Ted Houk 2014, paddlers can be entered into at most 8 events 
    (including one long distance event)<br />
    //-->

            <br />
       <div style="display:none;">
          <b>Show Only: <asp:LinkButton ID="lnkbutJuniors" runat="server" 
              PostBackUrl="TeamEntries.aspx?qclub={0}&qmeet={1}&qage=Juniors"        
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White" 
             CausesValidation="False">Juniors(inc. Seniors)</asp:LinkButton>
          or 
          <asp:LinkButton ID="lnkbutMasters" runat="server"  
              PostBackUrl="TeamEntries.aspx?qclub={0}&qmeet={1}&qage=Masters"  
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White" 
        CausesValidation="False" >Masters</asp:LinkButton>
           or 
           <asp:LinkButton ID="lnkbutALL" runat="server" 
              PostBackUrl="TeamEntries.aspx?qclub={0}&qmeet={1}&qage=ALL" 
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White" CausesValidation="False">Show All</asp:LinkButton>
          </b>
       </div>
       <div id="divAge">
          Show: 
                     <asp:HyperLink ID="hyplnkAgeJuniors" runat="server" ToolTip="Show only Junior and Senior paddlers, including Paracanoeists, from your club/team that have been entered in events."
               NavigateUrl="TeamEntries.aspx?qclub={0}&qmeet={1}&qage=Juniors" 
               BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Juniors/Seniors</asp:HyperLink>
          or
            <asp:HyperLink ID="hyplnkAgeMasters" runat="server" ToolTip="Show only Masters paddlers from your club/team that have been entered in events."
               NavigateUrl="TeamEntries.aspx?qclub={0}&qmeet={1}&qage=Masters" 
               BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Masters</asp:HyperLink>
          or            <asp:HyperLink ID="hyplnkAgeALL" runat="server" ToolTip="Show all paddlers from your club/team currently recorded in this system that have been entered in events."
               NavigateUrl="TeamEntries.aspx?qclub={0}&qmeet={1}&qage=ALL" 
               BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">ALL</asp:HyperLink>
                who you have entered into events.
            <br />
       </div>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
        BorderWidth="1px" CellPadding="2" DataSourceID="sqlTeamEntries" 
        ForeColor="Black" GridLines="None" 
        EmptyDataText="Your team has no entries yet" DataKeyNames="PaddlerID">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="PaddlerID,firstName,lastName,teamId,meetID,Age" 
                DataNavigateUrlFormatString="PaddlerEventsByPaddler.aspx?qpaddler={0}&amp;qfname={1}&amp;qlname={2}&amp;qclub={3}&amp;qmeet={4}&amp;qage={5}" 
                HeaderText="Review Entries" Text="Review entries" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" 
                SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" 
                SortExpression="lastName" />
            <asp:BoundField DataField="PaddlerAge" HeaderText="Age Jan 1st" 
                SortExpression="PaddlerAge" />
            <asp:BoundField DataField="Sprint Events" HeaderText="Sprint Events" 
                SortExpression="Sprint Events" />
            <asp:BoundField DataField="Long Distance" HeaderText="Long Distance" 
                SortExpression="Long Distance" />
            <asp:BoundField DataField="Canoe" HeaderText="Canoe" 
                SortExpression="Canoe" >
            </asp:BoundField>
            <asp:BoundField DataField="Kayak" HeaderText="Kayak" SortExpression="Kayak" />
            <asp:BoundField DataField="Va'a" HeaderText="Va'a" SortExpression="Va'a" />
            <asp:BoundField DataField="ParaK1" HeaderText="ParaK1" 
                SortExpression="ParaK1" />
            <asp:BoundField DataField="Paracanoe" HeaderText="Paracanoe" 
                SortExpression="Paracanoe" />
            <asp:BoundField DataField="Event Entries" HeaderText="Total Events" 
                SortExpression="Event Entries" >
            <ItemStyle Font-Bold="True" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
    <asp:SqlDataSource ID="sqlTeamEntries" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sTeamEntriesByAge" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="TeamID" QueryStringField="qclub" 
                Type="String" DefaultValue="UNREAL" />
            <asp:QueryStringParameter DefaultValue="NAT15" Name="MeetID" 
                QueryStringField="qmeet" Type="String" />
            <asp:QueryStringParameter DefaultValue="ALL" Name="Age" QueryStringField="qage" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div>
        <!--
        Th14 Team Payments -- here are the amounts.&nbsp; Copy them into the <a href="docs/2014TedHoukEntryForm.doc">Ted Houk 2014 Team Entry Form </a> 
        which has instructions on the actual payment mechanism. //-->
        <h2> Entry Fees</h2>

        Below are the fees due for the above paddlers who have been entered into events. The table does not reflect how much of these fees have been paid to date.&nbsp; 
        <br />
        <div id='divNat15Payments'>
            <asp:GridView ID="gvNATPayments" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" DataSourceID="sqlTeamPayments3" 
                EmptyDataText="Your team has no entries" GridLines="Vertical" 
                >
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <Columns>
                    <asp:BoundField DataField="Entrant Category" HeaderText="Entrant Category" 
                        ReadOnly="True" SortExpression="Entrant Category" />
                    <asp:BoundField DataField="Number of Paddlers" 
                        HeaderText="Number of Paddlers" ReadOnly="True" 
                        SortExpression="Number of Paddlers" />
                    <asp:BoundField DataField="Individual Entry Fee" 
                        HeaderText="Individual Entry Fee" ReadOnly="True" 
                        SortExpression="Individual Entry Fee" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Entry Fees" HeaderText="Entry Fees" 
                        ReadOnly="True" SortExpression="Entry Fees" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#DCDCDC" />
            </asp:GridView>
        </div>
        <div class="divclsPayments" id="divWrapper" runat="server">
            <h3>Registration Fees Payment</h3>
            <div class="divclsPayments" id="divPaymentsTH16" runat="server">
                <ul>
                    <li>Click here to open/download the  
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="docs/2016TedHoukEntryFormv1.doc" target="_blank">       
                        <asp:Label ID="Label1" runat="server" Text="2016 Ted Houk"  ></asp:Label>  Team Entry Form</asp:HyperLink >, fill it in and fax to the number in the form.   
                    </li>
                    <li>
                    Alternatively, call The Green Lake Small Craft center at 206-684-4074 and you can pay by credit card that way as well.
                    </li>
                </ul>
            </div>
            <div class="divclsPayments" id="divPaymentsTH15" runat="server">
                <ul>
                    <li>Click here to open/download the  
                        <asp:HyperLink ID="hyplnkTeamEntryForm" runat="server" NavigateUrl="docs/2015TedHoukTeamEntryForm.doc" target="_blank">       
                        <asp:Label ID="lblShortRegatta" runat="server" Text="Meet Short Name"  ></asp:Label>  Team Entry Form</asp:HyperLink >, fill it in and fax to the number in the form.  
                    </li>
                    <li>
                    Alternatively, call The Green Lake Small Craft center at 206-684-4074 and you can pay by credit card that way as well.
                    </li>
                </ul>
            </div>
            <div class="divclsPayments" id="divPaymentsNAT15" runat="server">
                <asp:LinkButton ID="lnkbutPayments" runat="server" 
                    PostBackUrl="TeamEntries.aspx?1={0}&amp;2={1}&amp;3={2}&amp;4={3}&amp;5={4}&amp;6={5}&qmeet={6}&qage={7}" 
                    onclick="lnkbutPayments_Click" BackColor="#3399FF" ForeColor="White" 
                    ToolTip="Click this is use SDCKT&quot;s payments system to pay for your team&quot;s entry fees online.">Pay Registration Fees</asp:LinkButton>
                &lt;&lt; Click this button
                to go to the OKBCF online payment system.&nbsp;&nbsp;<br /> 
                Information on total entries will be transferred automatically.&nbsp;
            </div>
            <div class="divclsPayments" id="divPaymentsNT16" runat="server">
                <asp:LinkButton ID="lnkbutPaymentsNT16" runat="server" 
                    PostBackUrl="TeamEntries.aspx?1={0}&amp;2={1}&amp;3={2}&amp;4={3}&amp;5={4}&amp;6={5}&qmeet={6}&qage={7}" 
                    onclick="lnkbutPayments_Click" BackColor="#3399FF" ForeColor="White" 
                    
                    ToolTip="Click this is to use the OKBHF payments system to pay for your team&quot;s entry fees online." 
                    BorderStyle="Groove">Pay Registration Fees</asp:LinkButton>
                &lt;&lt; Click this button
                to go to the Oklahoma City Boathouse Foundation&#39;s online payment system.&nbsp;&nbsp;<br /> 
                Fees amounts are not transferred automatically, so make a note of the number of paddlers in each payment category above before clicking the button.&nbsp;
            </div>
        </div>
        <div id="divWaiverUSACK" class="divclsWaiver" runat="server">
        <h3>Waivers</h3>
            <div class="divclswaivers" id="divwaiversNT16"  runat="server">  
                Please have each paddler sign both the online 
                <a href="https://www.smartwaiver.com/w/53df8d8345b93/web/" target="_blank">USA C/K</a>
                AND the online <a href="https://www.smartwaiver.com/w/5697f6af3be39/web/" target="_blank"> Oklahoma City Boathouse Foundation</a> waivers.

            </div>
            <div class="divclswaivers" id="divwaiversNAT15"  runat="server">
                 Please instruct all adult paddlers, and parents of children to complete a set of waivers at   
                <asp:HyperLink ID="hyplinkWaiver" runat="server" NavigateUrl="http://sdckt.net/waivers" target="_blank">http://sdckt.net/waivers</asp:HyperLink >.
            </div>
            <div class="divclswaivers" id="divwaiversTH16"  runat="server">
                All US competitors must be members of the American Canoe Association.  
                If ACA members have not signed the ACA waiver online, they must submit a written waiver 
                - <a href="http://c.ymcdn.com/sites/www.americancanoe.org/resource/resmgr/Insurance-documents/ACA_waiver_2014__adult.pdf" target="_blank">Adult</a> or <a href="http://c.ymcdn.com/sites/www.americancanoe.org/resource/resmgr/Insurance-documents/ACA_waiver_2014__minor.pdf" target="_blank">Minor</a>  Single event ACA memberships are available.
            </div>
            
        </div>
        <div id="divNavReturn">
            <br />
            <asp:HyperLink ID="hyplnkPaddlers" runat="server" NavigateUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&qage={2}">Return to your Team's Paddlers page</asp:HyperLink>
        </div>
    </div>
    <asp:SqlDataSource ID="sqlTeamPayments3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sTeamPayments3Tier" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="TeamID" QueryStringField="qclub" 
                Type="String" DefaultValue="UNREAL" />
            <asp:QueryStringParameter DefaultValue="NAT15" Name="MeetID" 
                QueryStringField="qmeet" Type="String" />
            <asp:QueryStringParameter DefaultValue="ALL" Name="Age" QueryStringField="qage" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    </form>
</body>
</html>
