<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 264px;
        }
        .style2
        {
            width: 155px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width: 912px; background-color:#CCFF99">
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                                    <asp:Label ID="Label3" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" 
                        Text="Email Id"></asp:Label>
                                </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" Height="23px" Width="140px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                                    <asp:Label ID="Label2" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" 
                        Text="Password"></asp:Label>
                                </td>
                <td>
                    <asp:TextBox ID="txtpass" runat="server" Height="23px" TextMode="Password" 
                        Width="140px" style="margin-left: 0px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnsubmit" runat="server" Height="28px" 
                        onclick="btnsubmit_Click" Text="Submit" Width="118px" />
                </td>
            </tr>
        </table>
</asp:Content>

