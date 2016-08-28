<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="EntriesPerPaddler.aspx.cs" Inherits="sckreg.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SCKC Online Entry System Paddler Entry page</title>
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <link rel="Stylesheet" type="text/css" href="sckclub.css" />
    <style type="text/css">  

         .divClub { text-align: center; }
         .divInstructionsTeam{border:1px solid blue;}
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
    
    
      <div >
        <div style="float:left;">
        <h1>
            <asp:Label ID="lblPageTitle" runat="server" Text="Entries for Jane Doe at Ted Houk 2014"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </h1>
        </div>
        <div style="text-align:center; float:right; padding:20px; font-size:larger;" >
        <asp:HyperLink ID="hypTeamPaddlers" runat="server" NavigateUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&qage={2}">Team's Paddlers Page</asp:HyperLink>
            <asp:HyperLink ID="hyplnkOrderOfEvents" runat="server" 
                NavigateUrl="Events.aspx?qclub={0}&amp;qmeet={1}&qage={2}" Target="_blank" Visible="False">Order of Events</asp:HyperLink>
        </div>
    </div>
    

    <form id="form1" runat="server">
      <div style="clear:both;" >
        <asp:Label ID="Label1" runat="server" 
            Text="This is a complete list of all the events this paddler is eligible to enter."></asp:Label>
    
        <br />
        <asp:Label ID="lblEntryConstraints" runat="server" Text="For Canoe Marathon Masters, only enter one single and team boat Event." Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="gvPaddler" runat="server" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="sqdsPaddler" EmptyDataText="Paddler details could not be found" 
            ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="gvPaddler_SelectedIndexChanged" 
            style="margin-top: 0px" >
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Paddler ID" ReadOnly="True" 
                    SortExpression="id" />
                <asp:BoundField DataField="firstName" HeaderText="First Name" 
                    SortExpression="First Name" />
                <asp:BoundField DataField="lastName" HeaderText="Last Name" 
                    SortExpression="Last Name" />
                <asp:BoundField DataField="birthday" DataFormatString="{0:MM/dd/yyyy}" 
                    HeaderText="Birthday mm/dd/yyyy" SortExpression="birthday" />
                <asp:BoundField DataField="genderId" HeaderText="Gender" 
                    SortExpression="genderId" />
                <asp:HyperLinkField DataNavigateUrlFields="id,teamId,firstName,lastName,meetId,Age" 
                    DataNavigateUrlFormatString="PaddlerEventsByPaddler.aspx?qpaddler={0}&amp;qclub={1}&amp;qfname={2}&amp;qlname={3}&amp;qmeet={4}&amp;qage={5}" 
                    HeaderText="Entries Summary" Text="Review Summary" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
      <div  id="divSummary" style="display:none;" > 
          <h3>Summary of races entered:</h3>
        </div> 
        <div id="divInstructionsTeam" runat="server" >
              <asp:Label ID="lblTeamInstructions" runat="server" 
                Text="1. To enter an event, click the Edit link for that event, check the <strong>Entered</strong> box, and then &lt;i&gt; click Update.&lt;/i&gt;  Repeat for each event."></asp:Label>
            <br />
            <asp:Label ID="lblTeamInstructionsTeamboat" runat="server"               
                Text="2. For a team boat, you can optionally enter a boatname in the &lt;strong&gt;teamboat&lt;/strong&gt; column.  
                If you enter the same code for other paddlers, e.g. JoeJack, the system will know they are in the same teamboat.  
                The code has to be at least 2 characters but no more than  10.
            &nbsp; Alternatively, for C2 and K2 boats, use the link in the &lt;strong&gt;FillTeamBoat&lt;/strong&gt; column to complete 
              each boat in one shot, and have the system assign the Boatnames."></asp:Label>
              <br />
            <asp:Label ID="lblTeamInstructionsEventLimit" runat="server"                                 
                  Text="3. For the 2016 Nationals Regatta,  each paddler can be entered in at most 8 sprint events and 1 long distance event.">
            </asp:Label>
            <asp:Label ID="lblTeamInstructionsMastersDef" runat="server"                                 
                  Text="4. Masters age divisions are: Masters A = 30 to 44, Masters B = 45 to 59, Masters C = 60+.">
            </asp:Label>
     
              <br />
              <br />
        </div>
        
        
        <div id="divInstructionsIndividual" runat="server" visible="false">
              <br />
            <asp:Label ID="lblInstructions" runat="server" 
                Text="1. To enter an event, click the Edit link for that event, check the <strong>Entered</strong> box, and then &lt;i&gt; click Update.&lt;/i&gt;  Repeat for each race."></asp:Label>
            <br />
            <asp:Label ID="lblInstructionsTeamboat" runat="server"               
                Text="2. For a team boat, you can optionally enter a code in the &lt;strong&gt;teamboat&lt;/strong&gt; column.  If you have a partner and they enter the same code e.g. JoeJack, the we'll know you wish to race together.  The code has to be at least 2 characters but no more than  10."></asp:Label>
                    <br />
            <asp:Label ID="lblInstructionsConstraints" runat="server" Text="3. You can enter one individual event and and one teamboat event."></asp:Label><br />     
            <asp:Label ID="lblInstructionsPayment" runat="server" Text="4. When finished entering yourself in races, click the blue button at the bottom of this page to go to the payments system."></asp:Label>
  
         
              <asp:GridView ID="grdvPaddlerEvents" runat="server" AutoGenerateColumns="False" 
                  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                  CellPadding="3" DataSourceID="sqlPaddlerEntries" 
                  EmptyDataText="No entris have been created yet.  In the table below click Edit, check the box and <i>click Update</i> to record your entry in each event." 
                  ForeColor="Black" GridLines="Vertical">
                  <Columns>
                      <asp:BoundField DataField="EventsId" HeaderText="EventsId" 
                          SortExpression="EventsId" />
                      <asp:BoundField DataField="EventNum" HeaderText="EventNum" 
                          SortExpression="EventNum" />
                      <asp:BoundField DataField="EventName" HeaderText="EventName" 
                          SortExpression="EventName" />
                      <asp:BoundField DataField="Competition" HeaderText="Competition" 
                          SortExpression="Competition" />
                      <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                      <asp:BoundField DataField="Boat Type" HeaderText="Boat Type" ReadOnly="True" 
                          SortExpression="Boat Type" />
                      <asp:BoundField DataField="Distance" HeaderText="Distance" ReadOnly="True" 
                          SortExpression="Distance" />
                      <asp:BoundField DataField="BoatName" HeaderText="BoatName" 
                          SortExpression="BoatName" />
                      <asp:BoundField DataField="firstName" HeaderText="firstName" 
                          SortExpression="firstName" />
                      <asp:BoundField DataField="lastName" HeaderText="lastName" 
                          SortExpression="lastName" />
                      <asp:BoundField DataField="Team Boat Crew" HeaderText="Team Boat Crew" 
                          ReadOnly="True" SortExpression="Team Boat Crew" />
                  </Columns>
                  <FooterStyle BackColor="#CCCCCC" />
                  <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                  <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                  <AlternatingRowStyle BackColor="#CCCCCC" />
              </asp:GridView>
          </div> 
           <b>Show Only: <asp:LinkButton ID="lnkbutKayak" runat="server" 
              PostBackUrl="EntriesPerPaddler.aspx?qclub={0}&qpaddler={1}&qmeet={2}&qage={3}&qDISC=K" 
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Kayak</asp:LinkButton>
          or <asp:LinkButton ID="lnkbutCanoe" runat="server" 
              PostBackUrl="EntriesPerPaddler.aspx?qclub={0}&qpaddler={1}&qmeet={2}&qage={3}&qDISC=C" 
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Canoe</asp:LinkButton>
          or <asp:LinkButton ID="lnkbutPara" runat="server" 
              PostBackUrl="EntriesPerPaddler.aspx?qclub={0}&qpaddler={1}&qmeet={2}&qage={3}&qDISC=P" 
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Paracanoe</asp:LinkButton>
          or <asp:LinkButton ID="lnkbutALL" runat="server" 
              PostBackUrl="EntriesPerPaddler.aspx?qclub={0}&qpaddler={1}&qmeet={2}&qage={3}&qDISC=A" 
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Show All</asp:LinkButton>
          </b>
        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label><br />
        
        <asp:GridView ID="grvwAllowablePaddlerEvents" runat="server" 
            AllowSorting="True" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="sqAllowedAndEntered" 
            EmptyDataText="No events were found for which this paddler is elligible" 
            ForeColor="Black" GridLines="Vertical" 
            onrowcommand="grvwAllowablePaddlerEvents_RowCommand"
            onselectedindexchanged="grvwAllowablePaddlerEvents_SelectedIndexChanged"
            onrowcancelingedit="grvwAllowablePaddlerEvents_RowCancelingEdit"
            onrowediting="grvwAllowablePaddlerEvents_RowEditing" 
            onrowupdating="grvwAllowablePaddlerEvents_RowUpdating" ShowFooter="True" 
             >
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="false" 
                            CommandName="Edit" CommandArgument ='<%# Eval("PaddlerID") %>' Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="btnUpdate" Text="Update" CommandArgument ='<%# Container.DataItemIndex %>'  runat="server" CommandName="DoUpdate" />
                        <br />
                        <asp:LinkButton ID="btnCancel" Text="Cancel" runat="server" CommandArgument ='<%# Eval("PaddlerID") %>' CommandName="Cancel" CausesValidation="false" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Entered" SortExpression="Entered">
                    <ItemTemplate>
                        <asp:CheckBox ID="cboxEntered" runat="server" Checked='<%# Bind("Entered") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="cboxEditEntered" runat="server" Checked='<%# Bind("Entered") %>' 
                            Enabled="true" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="teamboat" SortExpression="teamboat" 
                    ConvertEmptyStringToNull="False">
                    <ItemTemplate>
                        <asp:Label ID="lblteamboat" runat="server" Text='<%# Bind("teamboat") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtboxEditteamboat" runat="server" Text='<%# Bind("teamboat") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="meetId,eventId,teamId,PaddlerID" 
                    DataNavigateUrlFormatString="TeamBoatEntry.aspx?qmeet={0}&amp;qev={1}&amp;qclub={2}&amp;qpaddler={3}" 
                    HeaderText="FillTeamBoat"  DataTextField="FILL" SortExpression="FILL" />
                <asp:TemplateField HeaderText="PaddlerID" SortExpression="PaddlerID" 
                    Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblPaddlerID" runat="server" Text='<%# Bind("PaddlerID") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="lblEditPaddlerID" runat="server" Text='<%# Eval("PaddlerID") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EventNum" SortExpression="EventNum">
                    <ItemTemplate>
                        <asp:Label ID="lblEventNum" runat="server" Text='<%# Bind("EventNum") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="lblEditEventNum" runat="server" Text='<%# Eval("EventNum") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EventName" HeaderText="EventName" ReadOnly="True" 
                    SortExpression="EventName" ItemStyle-Width="400px" >
<ItemStyle Width="400px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Level" HeaderText="Level" ReadOnly="True" 
                    SortExpression="Level" ItemStyle-Width="400px" >
<ItemStyle Width="400px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="MinimumAge" HeaderText="Min Age" ReadOnly="True" 
                    SortExpression="MinimumAge" />
                <asp:BoundField DataField="MaximumAge" HeaderText="Max Age" ReadOnly="True" 
                    SortExpression="MaximumAge" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" ReadOnly="True" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="Competition" HeaderText="Competition" 
                    ReadOnly="True" SortExpression="Competition" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
    
    </div>

  <div style="text-align:center; float:none;">
  <asp:HyperLink ID="hyplnkPaddlers" runat="server" NavigateUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&qage={2}">Return to your Team Paddlers page</asp:HyperLink>


        <div id="divIndividualPayments" runat="server">
          <asp:Label ID="lblIndivPayments" runat="server" 
              Text="If you have entered all your races, please click the blue button go to the payments system to pay your entry fee."></asp:Label>
          <br />
          <asp:LinkButton ID="lnkIndivPayment" runat="server" BackColor="#0066CC" 
              ForeColor="White" 
              PostBackUrl="https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=860&amp;GroupID=1099440" 
              ToolTip="With your entries complete, click here to pay your entry fee" 
              Visible="False" Font-Bold="True" BorderColor="#333333" 
              BorderStyle="Groove">Step 3: Go to the Boathouse District Payment System 
          </asp:LinkButton>
              <div style="text-align:center;">
                    <br />
                    If you have any questions, please <a href="mailto:philipmurphy@wonderanimal.com">
                    email Philip Murphy</a>, who is the online registration manager.<br />
                    <br />
                    <strong>Copyright InfoHarvest Inc. 2013-2016 </strong>
                
                </div>
      </div>
          
          <asp:SqlDataSource
              ID="sqlPaddlerEntries" runat="server" 
          ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
          SelectCommand="sp_sPaddlerEventsByPaddler" SelectCommandType="StoredProcedure">
          <SelectParameters>
              <asp:QueryStringParameter DefaultValue="MM14" Name="MeetID" 
                  QueryStringField="qmeetid" Type="String" />
              <asp:QueryStringParameter DefaultValue="Nobody" Name="sPaddlerID" 
                  QueryStringField="qpaddler" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
  
  <asp:HyperLink ID="hyplnkPaddlers2" runat="server" NavigateUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&qage={2}">Team's Paddlers Page</asp:HyperLink>
    <asp:SqlDataSource ID="sqdsPaddler" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
          
          SelectCommand="SELECT id, firstName, lastName, birthday, genderId, teamId, @meetId AS 'meetId', @Age AS 'Age' FROM th2013_Paddlers WHERE (id = @id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="TH15" Name="meetId" 
                QueryStringField="qmeet" Type="String" />
            <asp:QueryStringParameter DefaultValue="ALL" Name="Age" 
                QueryStringField="qage" Type="String" />
            <asp:QueryStringParameter DefaultValue="SCKC.MuAz" Name="id" 
                QueryStringField="qpaddler" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqAllowedAndEntered" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="sp_sAllowableEventsByDisc" SelectCommandType="StoredProcedure" 
        UpdateCommand="sp_idEntry" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="sPaddlerID" QueryStringField="qpaddler" 
                Type="String" DefaultValue="UNREAL.DuTes" />
            <asp:QueryStringParameter DefaultValue="TH15" Name="sMeetID" 
                QueryStringField="qmeet" Type="String" />
            <asp:QueryStringParameter DefaultValue="A" Name="Disc" QueryStringField="qDISC" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MeetID" Type="String" />
            <asp:Parameter Name="bEnterPaddler" Type="Boolean" />
            <asp:Parameter Name="personId" Type="String" />
            <asp:Parameter Name="eventId" Type="String" />
            <asp:Parameter Name="boatgroup" Type="String" />
            <asp:Parameter Direction="InputOutput" Name="pIntErrDescOut" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
    

</body>
</html>
