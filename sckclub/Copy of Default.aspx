<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="sckclub._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: "Times New Roman", Times, serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
        <h1>
            Home page for Ted Houk 2014 registration</h1>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SCKCLUBConnectionString %>" 
        
        SelectCommand="SELECT [clubApprev] as 'Club',[First], [Last], [email], [coachID]  FROM [tCoaches] ORDER BY [clubApprev], [First]">
    </asp:SqlDataSource>
    <div>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="coachID" 
            DataSourceID="SqlDataSource1" 
            onselectedindexchanged="ListView1_SelectedIndexChanged">
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="ClubLabel" runat="server" 
                            Text='<%# Eval("Club") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstLabel" runat="server" Text='<%# Eval("First") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastLabel" runat="server" Text='<%# Eval("Last") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="coachIDLabel" runat="server" Text='<%# Eval("coachID") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="ClubLabel" runat="server" 
                            Text='<%# Eval("Club") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstLabel" runat="server" Text='<%# Eval("First") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastLabel" runat="server" Text='<%# Eval("Last") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="coachIDLabel" runat="server" Text='<%# Eval("coachID") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="ClubTextBox" runat="server" 
                            Text='<%# Bind("Club") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FirstTextBox" runat="server" Text='<%# Bind("First") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LastTextBox" runat="server" Text='<%# Bind("Last") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </InsertItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">
                                        Club</th>
                                    <th runat="server">
                                        First</th>
                                    <th runat="server">
                                        Last</th>
                                    <th runat="server">
                                        email</th>
                                    <th runat="server">
                                        coachID</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="ClubTextBox" runat="server" 
                            Text='<%# Bind("Club") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FirstTextBox" runat="server" Text='<%# Bind("First") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LastTextBox" runat="server" Text='<%# Bind("Last") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="coachIDLabel1" runat="server" Text='<%# Eval("coachID") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="ClubLabel" runat="server" 
                            Text='<%# Eval("Club") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstLabel" runat="server" Text='<%# Eval("First") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastLabel" runat="server" Text='<%# Eval("Last") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="coachIDLabel" runat="server" Text='<%# Eval("coachID") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    <div>
        If you are the coach designated to enter paddlers for your club, but your 
        club/name does not appear above, email the Ted Houk 2014 competition secretary,
        <a href = "mailto:philipmurphy@wonderanimal.com?subject=TH2014 Coach registration">Philip Murphy, SCKC</a> 
        and request that you be registered as the entries coach for TH2014.<br />
        <br />
    </div>
    <div>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="http://www.seattlecanoeclub.org/">Main Seattle Canoe and Kayak Club web page</asp:HyperLink>
    </div>
    </form>
</body>
</html>
