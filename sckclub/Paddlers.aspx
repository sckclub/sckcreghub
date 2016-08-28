<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paddlers.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="sckreg.Paddlers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>SCKC Online Registration Paddlers</title>
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
    <div>
        <div style="float:left;">
        <h1>Team's Paddlers Page&nbsp;&nbsp;&nbsp;</h1>
        </div>
        <div  style=" text-align:right; float:right; padding:20px; font-size:larger;" >
            <asp:HyperLink ID="hyplnkEvents" runat="server" NavigateUrl="~/Events.aspx?qclub={0}&amp;qmeet={1}&qage={2}" 
                Target="_blank">Order of Events</asp:HyperLink>
            &nbsp;&nbsp; 
                <asp:HyperLink ID="hypLinkTeamBoats" runat="server" 
                NavigateUrl="TeamBoatEntriesReport.aspx?qclub={0}&amp;qmeet={1}&qage={2}">Team Boats Review</asp:HyperLink>
              &nbsp;&nbsp;   
            <asp:HyperLink ID="hyplnkTeamEntries0" runat="server" 
                NavigateUrl="TeamEntries.aspx?qclub={0}&amp;qmeet={1}&qage={2}">Team Entries Summary</asp:HyperLink>
    
        </div>
    </div>
    <div class="divClub" style="clear:both;">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="sqlDSTeams">
            <Columns>
                <asp:BoundField DataField="shortName" HeaderText="ShortName" 
                    SortExpression="shortName" />
                <asp:BoundField DataField="name" HeaderText="Club or Team Name" 
                    SortExpression="name" />
                <asp:BoundField DataField="country" HeaderText="Country" 
                    SortExpression="country" />
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="Label1" Text="Team not found" runat="server" />
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlDSTeams" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="SELECT [shortName], [name], [country] FROM [th2013_Teams]
                where id=@qclub">
                <SelectParameters>
                    <asp:QueryStringParameter Name="qclub" QueryStringField="qclub" 
                        DefaultValue="UNREAL" />
                </SelectParameters>
        </asp:SqlDataSource>
     
       <br />
        <br />
    </div>
    <div>
        <asp:Label ID="lblPaddlers" runat="server" style="font-weight: 700" 
            Text="Edit, add and delete paddlers in your club as necessary. 
            To enter a paddler in events, click the link in the Manage Paddlers Entries column."></asp:Label>
        <br />
        <asp:Label ID="lblMembership" runat="server" Text="<b>Membership:</b> If a paddler is a USACK member, please add their current membership number.  
                     If a paddler is a member of a non-US National Federation, please enter the name of that Federation - e.g. CanoeKayak Canada in the membership field.  
                     This information must be filled in for each paddler before the close of the online enrollment system on June 30th.  
                     USACK membership must be valid on July 1st and remain so through August 2nd, 2015"></asp:Label>
               <asp:Label ID="lblMembershipTH" runat="server" Text="<b>Membership:</b> If a paddler is a USACK member, please enter their current USACK membership number in the Membership field.  
                     If a paddler is a member of a non-US National Federation, please enter the name of that Federation - e.g. CanoeKayak Canada in the membership field.  
                     This information must be filled in for each paddler before the close of the online enrollment system.  
                     USACK membership must be valid on July 6th and remain so through August 6th"></asp:Label>

        <br />
        <div style="display:none;">
          <b>Show Only: <asp:LinkButton ID="lnkbutJuniors" runat="server" 
              PostBackUrl="Paddlers.aspx?qclub={0}&qmeet={1}&qage=Juniors"        
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White" 
            onclick="lnkbutJuniors_Click" CausesValidation="False">Juniors(inc. Seniors)</asp:LinkButton>
          or 
          <asp:LinkButton ID="lnkbutMasters" runat="server"  
              PostBackUrl="Paddlers.aspx?qclub={0}&qmeet={1}&qage=Masters"  
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White" CausesValidation="False">Masters</asp:LinkButton>
           or 
           <asp:LinkButton ID="lnkbutALL" runat="server" 
              PostBackUrl="Paddlers.aspx?qclub={0}&qmeet={1}&qage=ALL" 
              BackColor="#3399FF" BorderStyle="Groove" ForeColor="White" CausesValidation="False">Show All</asp:LinkButton>
          </b>
        </div>
               <div id="divAge">
          Show: 
                     <asp:HyperLink ID="hyplnkAgeJuniors" runat="server" ToolTip="Show only Junior and Senior paddlers, including Paracanoeists, from your club/team."
               NavigateUrl="Paddlers.aspx?qclub={0}&qmeet={1}&qage=Juniors" 
               BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Juniors/Seniors</asp:HyperLink>
          or
            <asp:HyperLink ID="hyplnkAgeMasters" runat="server" ToolTip="Show only Masters paddlers from your club/team."
               NavigateUrl="Paddlers.aspx?qclub={0}&qmeet={1}&qage=Masters" 
               BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">Masters</asp:HyperLink>
          or            <asp:HyperLink ID="hyplnkAgeALL" runat="server" ToolTip="Show all paddlers from your club/team currently recorded in this system."
               NavigateUrl="Paddlers.aspx?qclub={0}&qmeet={1}&qage=ALL" 
               BackColor="#3399FF" BorderStyle="Groove" ForeColor="White">ALL</asp:HyperLink>
            <br />
       </div>  
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataSourceID="sqlDSPaddlers" DataKeyNames="id" 
            EmptyDataText="No paddlers found for this club" ShowFooter="True" 
            onrowcommand="GridView2_RowCommand" 
            onselectedindexchanged="GridView2_SelectedIndexChanged" 
            onrowdatabound="GridView2_RowDataBound" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical">
            <Columns>
                <asp:TemplateField HeaderText="Edit/Delete" HeaderStyle-Width="15%">
                    <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" Text="Edit" runat="server" CommandName="Edit" CausesValidation="false" />
                    <span onclick="return confirm('Are you sure you want to delete this Paddler?')">
                    <asp:LinkButton ID="btnDelete" Text="Delete" runat="server" CommandName="Delete" CausesValidation="false" />
                    </span>
                    </ItemTemplate>
                    <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" Text="Update" runat="server" CommandName="Update" CausesValidation="false" />
                    <asp:LinkButton ID="btnCancel" Text="Cancel" runat="server" CommandName="Cancel" CausesValidation="false" />
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:Button ID="btnInsertRecord" runat="server" Text="AddNew" CommandName="AddNew" />
                    </FooterTemplate>
                    <HeaderStyle Width="15%"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="teamId" SortExpression="teamId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("teamId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("teamId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewteamId" runat="server" Text='<%# Request.QueryString["qclub"] %>' MaxLength="20" ></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" 
                    ReadOnly="True" />
                <asp:TemplateField HeaderText="lastName" SortExpression="lastName" ItemStyle-VerticalAlign="Top">
                    <EditItemTemplate> 
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("lastName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewlastName" runat="server" MaxLength="20" Wrap="False"></asp:TextBox>
                        <asp:RequiredFieldValidator runat='server' ID='requiredLastNameAdd' ErrorMessage='Last Name Required' ControlToValidate='txtNewlastName' Display="Dynamic" />
                    </FooterTemplate>

<ItemStyle VerticalAlign="Top"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="firstName" SortExpression="firstName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("firstName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewfirstName" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator runat='server' ID='requiredFirstNameAdd' ErrorMessage='First Name Required' ControlToValidate='txtNewfirstName' Display="Dynamic" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="genderId" SortExpression="genderId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("genderId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("genderId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList runat="Server" ID="txtNewgenderId">
                            <asp:ListItem Value="M" Text="M" />
                            <asp:ListItem Value="F" Text="F" />
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator runat='server' ID='requiredGenderAdd' ErrorMessage='Gender is Required' ControlToValidate='txtNewgenderId' Display="Dynamic" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="birthday" SortExpression="birthday">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("birthday","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat='server' ID='requiredDOBEdit' ErrorMessage='Required' ControlToValidate='TextBox4' Display="Dynamic" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("birthday","{0:MM/dd/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewbirthday" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator runat='server' ID='requiredDOBAdd' ErrorMessage='Date of Birth Required' ControlToValidate='txtNewbirthday' Display="Dynamic" />
                       <asp:CompareValidator runat='server' ID='dateformatDOBAdd' ErrorMessage='Date should be form 12/25/1999' ControlToValidate='txtNewbirthday' Type ='Date'  Operator='DataTypeCheck' Display="Dynamic" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="membership" 
                    HeaderText="Membership" SortExpression="membership" />
                <asp:HyperLinkField DataNavigateUrlFields="teamId,id,lastName,firstName,meetId, Age" 
                    DataNavigateUrlFormatString="EntriesPerPaddler.aspx?qclub={0}&amp;qpaddler={1}&amp;qlname={2}&amp;qfname={3}&amp;qmeet={4}&amp;qage={5}" 
                    DataTextField="firstName" DataTextFormatString="Entries for {0}" 
                    HeaderText="Manage Paddlers Entries" ItemStyle-Width="400px" >
<ItemStyle Width="400px"></ItemStyle>
                </asp:HyperLinkField>
            </Columns>
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#DCDCDC" />
        </asp:GridView>
     
        <asp:SqlDataSource ID="sqlDSPaddlers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
            SelectCommand="sPaddlersByClubByAge" 
            UpdateCommand="UPDATE th2013_Paddlers SET lastName = @lastName, firstName = @firstName, genderId = @genderId, birthday = @birthday, membership = @membership WHERE (id = @id)"
          
            DeleteCommand="UPDATE th2013_Paddlers SET pDeleted = -1 where id=@id" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="TeamID" QueryStringField="qclub" 
                    DefaultValue="SCKC" Type="String" />
                <asp:QueryStringParameter DefaultValue="A" Name="AgeLevel" 
                    QueryStringField="qage" Type="String" />
                <asp:QueryStringParameter DefaultValue="NAT15" Name="MeetID" 
                    QueryStringField="qmeet" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="genderId" Type="String" />
                <asp:Parameter Name="birthday" Type="Datetime" />
                <asp:Parameter Name="membership" Type="String"/>
                <asp:Parameter Name="id" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="id" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    <p>
        &nbsp;</p>
          <div>
                When you are done, or to see a summary of your team&#39;s entries and registration fees due, go to the 
                <asp:HyperLink ID="hyplnkTeamEntries" runat="server" 
                    NavigateUrl="TeamEntries.aspx?qclub={0}&amp;qmeet={1}&qage={2}">Team Entries Summary Page</asp:HyperLink>
          &nbsp;-- you can always return here from there.</div>
    </form>
</body>
</html>
