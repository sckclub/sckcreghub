<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trials2015.aspx.cs" Inherits="sckreg.Trials2015" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>2015 USA Canoe/Kayak Flatwater Sprint Team Trials Registration</title>
    <style type="text/css">  
         .clsOPEN  {  text-align: center; visibility:collapse; }
         .clsCLOSED  {  text-align: center; visibility:visible; }
         h2 {color:Red;}
         .clsfooter{text-align: center;}
          .divImage{text-align: left;}
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
    <form id="form1" runat="server">
    <div class="divImage">
        <img src="imgs/Canoe_300x161.png" align="left" alt="USACK logo" />
    </div>
    <div>
    <h1>2015 USA Canoe/Kayak Flatwater Sprint Team Trials Registration</h1>
    <h3 align="left">APRIL 24-25, 2015 | OKLAHOMA CITY, OKLAHOMA</h3>
    <h2 align="left">Online Registration is now CLOSED<br /></h2>
        <br />
    </div>
    
    <div id="divClosed" class = "clsCLOSED" runat="server" style = "border:1px solid blue;">
            <h3>Review Entries</h3>
            <p>
            Entries Coach: <asp:Label ID="lblCoachName2" runat="server" Text="coachname"></asp:Label><br />
            Club or Team: <asp:Label ID="lblClubName2" runat="server" Text="clubname"></asp:Label> <br /><br />
            
                           <asp:LinkButton ID="lnkButtonReviewEntries" runat="server" BackColor="#0066CC" 
                   BorderColor="#666666" BorderStyle="Groove" Font-Bold="True" ForeColor="White" 
                   PostBackUrl="Reports_EntriesByTeam.aspx?qclub={0}&amp;qmeet={1}&amp;qcc={2}">Click here to review your entries</asp:LinkButton>
             <br />      
            </p>
    </div>
    <div align="center">
     <h3>Late Entries (after April 1st , 2015)</h3>

    <ul>
        <li>
        Late Entry Fee:  $200 
        </li>
        <li>
         To make a late entry, <a href="mailto:scaven@okcbf.org">email Shaun Caven</a>, the Event Director.
 
        </li>
      </ul>
       
   <h3>Order of Events</h3>
    <p>Click here to see the 
        <asp:HyperLink ID="hyp2OrderOfEvents" runat="server" 
            NavigateUrl="http://www.sckclub.org/sckcreg/events.aspx?qmeet=TR15" 
            Target="_blank">Order of Events</asp:HyperLink>
    </p>


        <div id="divCoachIsHere" runat="server" style = "border:1px solid blue;">
            <p>
            Entries Coach: <asp:Label ID="lblCoachName" runat="server" Text="coachname"></asp:Label><br />
            Club or Team: <asp:Label ID="lblClubName" runat="server" Text="clubname"></asp:Label> <br /><br />
            
                           <asp:LinkButton ID="lnkbutRegistration" runat="server" BackColor="#0066CC" 
                   BorderColor="#666666" BorderStyle="Groove" Font-Bold="True" ForeColor="White" 
                   PostBackUrl="Paddlers.aspx?qclub={0}&amp;qmeet={1}&amp;qcc={2}">Click here to register your paddlers</asp:LinkButton>
             <br />      
            </p>
        </div>
        <div id="divNoCoach" runat="server" style = "border:1px solid red; padding: 20px 40px 10px 40px;">
       <p>
        If you are a <b>coach </b>and reading this message, you need to find the email from Philp Murphy
        that contained a URL to register your paddlers (Juniors, Seniors and paracanoeists) for trials, or request a UserID from Philip by sending an email to 
        <a href="mailto:philipmurphy@wonderanimal.com?subject=TR15%20UserID Request">philipmurphy@wonderanimal.com</a>
        </p>
            <p>
        If you are a <b>paracanoeist and NOT a member of a club</b>, you need to find the email from Philp Murphy
        that contained a URL to register yourself for trials, or request a UserID from Philip by sending an email to 
        <a href="mailto:philipmurphy@wonderanimal.com?subject=TR15%20UserID Request">philipmurphy@wonderanimal.com</a>
        </p>   
        </div>

    </div>
    </form>
        <div class="clsfooter">


            <p>                 &nbsp;</p>
             <div align="center">
                 <p>
                    For general information on 2015 USA Canoe/Kayak Flatwater Sprint Team Trials, 
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.teamusa.org/USA-Canoe-Kayak/Sprint-Team-Trials">go to the Team USA website</asp:HyperLink>.
                 </p>
                 <div class="clsOPEN" >
                 <p visible='false'>
                    If you have any questions, please <a href="mailto:philipmurphy@wonderanimal.com">email Philip Murphy</a>, the online registration manager.
                 </p>
                 </div>
             </div>
            
             <div align="center">
                <br />
                <br />
                <br />

                Page last Updated April 2nd, 2015
                    <br />
                    Copyright Seattle Canoe and Kayak Club 2015
            </div>
        </div>
    </body>
</html>
