<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TH14.aspx.cs" Inherits="sckreg.TH14" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>Sprint Canoe and Kayak Online Registration</title>
</head>
<body>
    <asp:Image ID="imLogo" runat="server" ImageUrl="http://www.sckclub.org/sckcreg/images/customlogo.gif" />
    <form id="form1" runat="server">
    <div>
    <h1>Home Page for Sprint Canoe and Kayak Online Registration</h1>
    
    </div>
    <h3>Virtual Scratch meeting held Saturday May 31st 2014</h3>
    <p>With everyones's help the number of events with incomplete boats was reduced from 47 to 12, and that was mainly through completing, not scratching, the incomplete boats.
        The updated entries can be seen by clicking on the links below.</p>

        <p>Next step - the <strong>In person Scratch meeting on Friday 6th at 6PM at the Green Lake Small Crafts center</strong> 
    </p>

     <div> 
            <p>Ted Houk 2014 Events with entries at each distance:</p>
  
                  <ul>
                  <li> Saturday
                    <asp:HyperLink ID="hyplnkAll1000mEvents" runat="server" 
                        NavigateUrl="AllEventsByDistance.aspx?qdistance=1000m">All 1000m Events at Ted Houk 2014</asp:HyperLink>
                  </li>
                  <li> Saturday
                    <asp:HyperLink ID="hyplnkAll200mEvents" runat="server" 
                        NavigateUrl="AllEventsByDistance.aspx?qdistance=200m">All 200m Events (paracanoe only) at Ted Houk 2014</asp:HyperLink>
                  </li>
                  <li> Sunday
                    <asp:HyperLink ID="hyplnkAll500mEvents" runat="server" 
                        NavigateUrl="AllEventsByDistance.aspx?qdistance=500m">All 500m Events at Ted Houk 2014</asp:HyperLink>
                  </li>
                  <li> Sunday
                    <asp:HyperLink ID="hyplnkAll5000mEvents" runat="server" 
                        NavigateUrl="AllEventsByDistance.aspx?qdistance=5000m">All Long Distance Events at Ted Houk 2014</asp:HyperLink>
                  </li>
                  </ul>
             </div>
          <br />
           <p>All Entries in Ted Houk 2014 for all paddlers </p>
           <ul>
               <li>Saturday  
                   <asp:HyperLink ID="hyplnkPaddlersEntriesByDistance" runat="server" 
                        NavigateUrl="PaddlerEntriesByDistance.aspx?qdistance=1000m">All entries for 1000m events per Paddler</asp:HyperLink>
               </li>
               <li>Saturday  
                   <asp:HyperLink ID="hyplnkPaddlersEntriesBy200m" runat="server" 
                        NavigateUrl="PaddlerEntriesByDistance.aspx?qdistance=200m">All entries for 200m (paracanoe) events per Paddler</asp:HyperLink>
               </li>
               <li>Sunday  
                   <asp:HyperLink ID="hyplnkPaddlersEntriesBy500m" runat="server" 
                        NavigateUrl="PaddlerEntriesByDistance.aspx?qdistance=500m">All entries for 500m events per Paddler</asp:HyperLink>
               </li>
               <li>Sunday  
                   <asp:HyperLink ID="hyplnkPaddlersEntriesBy5000m" runat="server" 
                        NavigateUrl="PaddlerEntriesByDistance.aspx?qdistance=5000m">All entries for 5000m events per Paddler</asp:HyperLink>
               </li>
               </ul>
        <br />  
       <asp:HyperLink ID="hyplnkALLPaddlers" runat="server" 
            NavigateUrl="AllPaddlers.aspx?qclub=ALL">All Paddlers entered in Ted Houk 2014</asp:HyperLink>
       <br />


       <p>
      <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="http://www.sckclub.org/sckcreg/Events.aspx">Ted Houk Draft Schedule of Events</asp:HyperLink>
&nbsp;Saturday Jun 7th and Sunday June 8th at Green Lake, Seattle.  
    </p>
    <p>
    Link to the 
        <asp:HyperLink ID="hyplnkSCKCorg" runat="server" 
            NavigateUrl="http://www.seattlecanoeclub.org/about">Seattle Canoe and Kayak Club Main Website</asp:HyperLink>
    </p>
    </form>
    </body>
</html>
