<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="background-color:#CCFF99; width: 884px;">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                                    <asp:Label ID="Label1" runat="server" 
                                        style="font-family: Tahoma; font-size: x-large" 
                        Text="You Are Not Authorised To Use This Page" ForeColor="#E60000"></asp:Label>
                                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
</asp:Content>

