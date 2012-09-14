<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forgot.aspx.cs" Inherits="forgot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <%--<style type="text/css">
        #form
        {
            width: 1127px;
        }
    </style>--%>

    <style type="text/css">
        .style1
        {
            height: 32px;
        }
    #form
    {
        width: 896px;
        margin-left: 185px;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<form runat="server" id="form">--%>
    <asp:Panel ID="Panel2" runat="server"  BackColor="#CCFF99" Height="193px">

        <table class="style1">
            <tr>
                <td class="style10" align="center">
                    <asp:Label ID="Label2" runat="server" Text="Forgot Password" 
                        
                        style="font-weight: 700; text-decoration: underline; font-family: Tahoma; font-size: medium;"></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style10">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style10">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style10">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Label ID="Label3" runat="server" Text="Email Id" 
                        style="font-family: Tahoma; font-size: medium"></asp:Label>
                </td>
                <td class="style6">
                    <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Please enter your Id    " 
                        Font-Italic="True" ForeColor="#CC0000" style="font-family: Georgia"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="#CC0000" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        style="font-family: Georgia"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    </td>
                <td class="style1">
                    </td>
                <td class="style1">
                    </td>
                <td class="style1">
                    <asp:Button ID="Button1" runat="server" Text="Submit" Height="28px" 
                        Width="118px" onclick="Button1_Click" />
                </td>
                <td class="style1">
                    <asp:Label ID="Label4" runat="server" ForeColor="#CC0000" 
                        Text="Password has been sent to your email Id " 
                        style="font-family: Georgia"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style10">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
     </asp:Panel>
<%--</form>--%>
</asp:Content>

