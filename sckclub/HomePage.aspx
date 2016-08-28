<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="sckreg.HomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Home Page for Ted Houk 14</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Image ID="imLogo" runat="server" ImageUrl="http://www.sckclub.org/sckcreg/images/customlogo.gif" />
 
    <h1>Ted Houk 2014 Online Entries Page</h1>
    </div>
    <div>
    Welcome to the online registration page for Ted Houk 2014.&nbsp; Registration opens 
        on Sunday May 25th and will close at midnight on Wednesday May 28th.<br />
        <br />
        If you are the coach of a team, enter your Team ID and passkey from your invitation email.
    <br /><br />
    If you are a coach and did not receive an invitation to register online, please email <a href="mailto:philipmurphy@wonderanimal.com">Philip Murphy</a> the competition secretary for Ted Houk 2014.
    
    </div>
    <div align="center">
    <br />
    Team ID:&nbsp;&nbsp;  
        <input id="txtTeamID" type="text" value="SCKC" /><br />
    Passkey:&nbsp;&nbsp;&nbsp; 
    <input id="txtPKey" type="password" value="12Sc4x" /><br />
        <br />
    
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="Default.aspx" 
            BackColor="#FFFFCC" BorderStyle="Outset">Login to create entries</asp:LinkButton>
   
    </div>
     </form>
</body>
</html>
