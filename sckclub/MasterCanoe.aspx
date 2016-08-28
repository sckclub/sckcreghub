<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterCanoe.aspx.cs" Inherits="sckreg.MasterCanoe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>SCKC Canoe Marathon Masters Online Registration</title>
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
    <script type ="text/javascript" language="javascript">
    //alert("This is a test alert message after google analytics");
    </script>
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="imgCMMLogo" runat="server" 
            ImageUrl="imgs/2014CanoeMasters World Cup Logo.jpg" 
            ImageAlign="Left" AlternateText="Logo for 2014 ICF Canoe Marathon Masters World Cup " />
    <center>
        <h1><font color="#3366CC"> 2014 ICF Canoe Marathon Masters Online Registration</font></h1>
    <h2><font color="#3366CC">Oklahoma City September 24th-25th 2014</font></h2>
    </center>
    
    </div>
    <div align="left">
       
        <ul style="margin-left: 320px">
        <li>Step 1: Add yourself to the list of Paddlers (this page)</li>
        <li>Step 2: Enter yourself in an single and/or team boat event</li>
        <li>Step 3: Pay your entry fee</li>
        </ul>
        
     </div>
     <div align="center">
 
                <strong>Step 1:</strong>Enter your first name, last name, gender and date of birth (12/25/1960) below, then click Add/Find Button<br />
        <br /> 
        <table border="0">
        <tr><td><asp:Label ID="lblFirst" runat="server" Text="*First name"></asp:Label></td>
        <td><asp:TextBox ID="txtFirst" runat="server"></asp:TextBox></td>
        <td> <asp:RequiredFieldValidator ID="valFirst" runat="server" 
            ControlToValidate="txtFirst" Display="Dynamic" 
            ErrorMessage="You must enter a first name">* Please enter your first name</asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblLast" runat="server" Text="*Last name"></asp:Label></td>
            <td><asp:TextBox ID="txtLast" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="valrqdLastName" runat="server" 
                ControlToValidate="txtLast" Display="Dynamic" 
                ErrorMessage="You must enter your Last Name">* Please enter your Last name</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
        <td><asp:Label ID="lblGender" runat="server" Text="*Gender"></asp:Label></td>
        <td>   <asp:DropDownList ID="DdropGender" runat="server">
            <asp:ListItem Selected="True" Value="Choose one">Choose one</asp:ListItem>
            <asp:ListItem Value="M">Male</asp:ListItem>
            <asp:ListItem Value="F">Female</asp:ListItem>
        </asp:DropDownList>
        </td>
        <td>
            <asp:CompareValidator ID="valcompGender" runat="server" 
                ControlToValidate="DdropGender" Display="Dynamic" 
                ErrorMessage="CompareValidator" Operator="NotEqual" ValueToCompare="Choose one">* Please indicate your gender</asp:CompareValidator>
            </td>
        </tr>
        <tr>
        <td><asp:Label ID="lblDOB" runat="server" Text="*Date of Birth (MM/DD/YYYY)"></asp:Label></td>
        <td>
        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
        </td>
        <td>
        <asp:RegularExpressionValidator ID="valregExDate" runat="server" 
            ControlToValidate="txtDOB" 
            ErrorMessage="Please enter date of birth in format DD/MM/YYYY e.g. 1/25/1960" 
            ToolTip="We need the date when you were born to figure out which events you are eligible to enter" 
            ValidationExpression="^\d{2}/\d{2}/\d{4}">*Please enter date of birth in format DD/MM/YYYY e.g. 01/25/1960</asp:RegularExpressionValidator>
        
        </td>
        </tr>
        <tr>
        <td> <asp:Label ID="lblTeam" runat="server" Text="Team/Club e.g. Seattle Canoe & Kayak Club"></asp:Label></td>
        <td><asp:TextBox ID="txtTeam" runat="server"></asp:TextBox></td>
        <td></td>
        </tr>
        <tr>
        <td><asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label></td>
        <td><asp:TextBox ID="txtCountry" runat="server"></asp:TextBox></td>
        <td></td>
        </tr>      
        
       </table>
    </div>
    <div align="center">
        <asp:Button ID="butAddFind" runat="server" BackColor="#0066CC" 
        CommandName="AddFind" ForeColor="White" Text="Step 1:  Create or Find Paddler" 
            onclick="butAddFind_Click" Font-Bold="True" />
    </div>
    <div id="divFoundPaddler">
        <asp:Label ID="lblAddFindMessage" runat="server" Text=""></asp:Label>
    </div>
    <div>
    <asp:Label ID="lblPaddlerFound" runat="server" Text="Paddler Record" 
            Visible="False"></asp:Label>
    
        <asp:GridView ID="grdPaddler" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="sqlDSPaddlers" 
            EmptyDataText="No paddler yet" 
            onselectedindexchanged="grdPaddler_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                    SortExpression="id" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" 
                    SortExpression="lastName" />
                <asp:BoundField DataField="firstName" HeaderText="firstName" 
                    SortExpression="firstName" />
                <asp:BoundField DataField="birthday" HeaderText="birthday" 
                    SortExpression="birthday" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="genderId" HeaderText="genderId" 
                    SortExpression="genderId" />
                <asp:BoundField DataField="street2" HeaderText="Team/Club" 
                    SortExpression="street2" />
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" />
                <asp:HyperLinkField DataNavigateUrlFields="teamId,id,lastName,firstName" 
                    
                    
                    DataNavigateUrlFormatString="EntriesPerPaddler.aspx?qclub={0}&amp;qpaddler={1}&amp;qlname={2}&amp;qfname={3}&amp;qmeet=MM14" DataTextFormatString="Enter your races" 
                    HeaderText="Enter Races" Text="Step 2: Enter Your Races" >
                <ControlStyle BackColor="#0066CC" Font-Bold="True" ForeColor="White" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="teamId" HeaderText="teamId" SortExpression="teamId" 
                    Visible="False" />
            </Columns>
            <EditRowStyle BackColor="#FFFF99" />
        </asp:GridView>
    
        <br />
        <br />
        <br />
    
    </div>
    <div align="center">
        If you have any questions, please <a href="mailto:philipmurphy@wonderanimal.com">
        email Philip Murphy</a> the online registration manager.<br />
        <br />
        <strong>Copyright InfoHarvest Inc. 2014 </strong>
    
    </div>

    <asp:SqlDataSource ID="sqlDSPaddlers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        SelectCommand="SELECT [id], [lastName], [firstName], [birthday], [genderId], [street], [street2], [country], [teamId] FROM [tPaddlers] WHERE (([firstName] = @firstName) AND ([lastName] = @lastName) AND ([birthday] = @birthday))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFirst" DefaultValue="John" Name="firstName" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtLast" DefaultValue="Doe" Name="lastName" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtDOB" DefaultValue="1/1/1901" 
                Name="birthday" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>

    </form>
</body>
</html>
