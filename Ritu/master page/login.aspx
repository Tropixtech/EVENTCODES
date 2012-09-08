<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-family: Tahoma;
        }
        .style2
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<form runat="server" id="form">--%>
<asp:Panel ID="Panel2" runat="server"  BackColor="#CCFF99" Height="193px">
        <table class="style1">
            <tr>
                <td class="style2" align="center">
                    <span class="style1">
                    <asp:Label ID="Label1" runat="server" 
                        style="font-weight: 700; font-size: medium; text-decoration: underline;" 
                        Text="Login"></asp:Label>
                    </span>
                </td>
                <td class="style2">
                    </td>
                <td class="style2">
                   </td>
                <td class="style2">
                    </td>
                <td class="style2">
                    </td>
            </tr>
            <tr>
                <td class="style7">
                    <span class="style1"></span></td>
                <td class="style3">
                    <asp:Label ID="Label2" runat="server" Text="Email Id" style="font-size: 11pt"></asp:Label>
                    
                </td>
                <td class="style6">
                    <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="145px" 
                        CssClass="style1"></asp:TextBox>
                </td>
                <td class="style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Please enter your Id" 
                        Font-Italic="True" ForeColor="#CC0000" style="font-family: Georgia"></asp:RequiredFieldValidator>
                </td>
                <td>
                  <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="#CC0000" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        style="font-family: Georgia"></asp:RegularExpressionValidator>--%>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    <span class="style1"></span></td>
                <td class="style3">
                    <asp:Label ID="Label3" runat="server" Text="Password" style="font-size: 11pt"></asp:Label>
                           </td>
                <td class="style6">
                    <asp:TextBox ID="TextBox2" runat="server" Height="23px" Width="145px" 
                        TextMode="Password" CssClass="style1"></asp:TextBox>
                </td>
                <td class="style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Please enter your password" 
                        Font-Italic="True" ForeColor="Black" 
                        style="font-family: Georgia; font-size: 12px; color: #CC0000"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    <span class="style1"></span></td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style6">
                   </td>
                <td class="style8">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" 
                        Height="28px" Width="118px" />
                    &nbsp;<asp:Label ID="Label4" runat="server" ForeColor="#CC0000" 
                        style="font-family: Georgia" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" colspan="3">
                    &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgot.aspx">Forgot Password?</asp:HyperLink>
                </td>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    <span class="style1"></span></td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style6">
                    </td>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
 
  </asp:Panel>
 
<%--</form>--%>
</asp:Content>

