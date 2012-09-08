<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="event_home.aspx.cs" Inherits="event_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 196px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="background-color:#CCFF99; width: 884px;">
            <tr>
                <td colspan="3">
                                    <asp:Label ID="Label1" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" 
                        Text="Event Home"></asp:Label>
                                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                        style="font-family: Tahoma; font-size: 11pt">User Access</asp:LinkButton>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Height="28px" onclick="Button1_Click" 
                        style="font-family: Tahoma; font-size: 11pt" Text="Back" Width="118px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
</asp:Content>

