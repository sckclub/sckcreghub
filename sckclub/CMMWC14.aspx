<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CMMWC14.aspx.cs" Inherits="sckreg.CMMWC14" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>2014 ICF Canoe Marathon Master World Cup</title>
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
    
       <div>
        <br />
        <br />
        <asp:Image ID="imgCMMLogo" runat="server" 
            ImageUrl="imgs/2014CanoeMasters World Cup Logo.jpg" 
            ImageAlign="Left" AlternateText="Logo for 2014 ICF Canoe Marathon Masters World Cup " />
    <center>
        <h1><font color="#3366CC"> 2014 ICF Canoe Marathon Masters Online Registration</font></h1>
    <h2><font color="#3366CC">Oklahoma City September 24th-25th 2014</font></h2>
    </center>
    
    </div>
    
    <div align="center">
    <h3>Registration is now open, and will close September 1st, 2014.</h3>
    </div>
       <div align="center">
           <p>The entry fee is $150.00 per paddler.</p>
    </div>
       <div align="center">
           <p>
               <asp:LinkButton ID="lnkbutRegistration" runat="server" BackColor="#0066CC" 
                   BorderColor="#666666" BorderStyle="Groove" Font-Bold="True" ForeColor="White" 
                   PostBackUrl="MasterCanoe.aspx?qmeet=MM14">Click here to register</asp:LinkButton>
           </p>
    </div>
       <div align="center">
           <p>&nbsp;</p>
    </div>
       <div align="center">
           <p>&nbsp;</p>
    
    If you have any questions, please <a href="mailto:philipmurphy@wonderanimal.com">email Philip Murphy</a> the online registration manager.
    </div>
    
    <div align="center">
    <br />
    <br />
    <br />

    Page last Updated August 1st, 2014
        <br />
        Copyright InfoHarvest 2014</div>
    </form>
</body>
</html>
