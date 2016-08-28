<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LPI2014Home.aspx.cs" Inherits="sckreg.LPI2014Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sprint Canoe and Kayak Online Registration</title>
</head>
<body>
    <asp:Image ID="imLogo" runat="server" ImageUrl="imgs/usack16.jpeg" />
    <form id="form1" runat="server">
    <div>
    <h1>Home Page for 2014 Lake Placid International Online Registration</h1>
    
    </div>
    <h3>Online Registration Open from Sunday June 15th 2015 to Midnight June 22nd 2014</h3>
    <p>If you are  coach and find yourself on this page, you need to look for the email that contained 
    a URL to enter the system, or request a UserID from <a href="mailto:philipmurphy@wonderanimal.com?subject=LPI%20UserID Request">philipmurphy@wonderanimal.com</a></p>

        
    <p>
    Link to the 
        <asp:HyperLink ID="hyplnkUSACKLPI" runat="server" 
            NavigateUrl="http://www.teamusa.org/USA-Canoe-Kayak/Lake-Placid-International">Lake Placid International Regatta Website</asp:HyperLink>
    </p>
    </form>
    </body>
</html>
