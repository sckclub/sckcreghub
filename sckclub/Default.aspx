<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="sckreg.WebForm3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="SHORTCUT ICON" href="imgs/favicon.ico"/>
    <title>Sprint Canoe and Kayak Online Registration</title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
    </style>
</head>
<body style="text-align : center;">

    
    <asp:Image ID="imLogo" runat="server" ImageUrl="http://www.sckclub.org/sckcreg/images/customlogo.gif" />
    <form id="form1" runat="server">
    <div>
    <h1>Home Page for SCKC Sprint Canoe and Kayak Online Registration Ststem</h1>
    
    </div>
    <p class="style1"> This system has been used for the following regattas:</p>
    <div id="divTable" style="text-align: center;">
            <asp:SqlDataSource ID="sqldsMeets" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
                SelectCommand="SELECT [meetName], [StartDate], [EndDate], rtrim([URL]) 'URL', [Location], [meetID] FROM [tMeets] order by StartDate DESC">
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="8" DataSourceID="sqldsMeets" HorizontalAlign="Center">
                <RowStyle BackColor="White" ForeColor="#003399" />
                <Columns>
                    <asp:BoundField DataField="meetName" HeaderText="Regatta" 
                        SortExpression="meetName" />
                    <asp:BoundField DataField="Location" HeaderText="Location" 
                        SortExpression="Location" />
                    <asp:BoundField DataField="StartDate" DataFormatString="{0:MM/dd/yyyy}" 
                        HeaderText="StartDate" SortExpression="StartDate" />
                    <asp:BoundField DataField="EndDate" DataFormatString="{0:MM/dd/yyyy}" 
                        HeaderText="EndDate" SortExpression="EndDate" />
                    <asp:HyperLinkField DataNavigateUrlFields="URL" 
                        DataNavigateUrlFormatString="{0}" HeaderText="Entries Home Page" 
                        Text="Entries" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            </asp:GridView>
        </div>
         <div style="text-align : center;">
            <br />
            <br />
            <br />

            Page last Updated July 11th, 2016              <br />
                <br />
                Copyright Seattle Canoe and Kayak Club 2013-2016
        </div>

    </form>
    </body>
</html>
