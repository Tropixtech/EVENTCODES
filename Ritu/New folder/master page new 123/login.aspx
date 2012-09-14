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
        .style3
        {
            height: 26px;
        }
        .style6
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="#CC0000" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        style="font-family: Georgia"></asp:RegularExpressionValidator>--%>
<asp:Panel ID="Panel2" runat="server"  BackColor="#CCFF99" Height="250px">
        <table class="style1">
            <tr>
                <td class="style2" align="center">
                    &nbsp;</td>
                <td align="center" class="style2">
                    <span class="style1">
                    <asp:Label ID="lblLogin" runat="server" 
                        style="font-weight: 700; font-size: medium; text-decoration: underline; color: #000000;" 
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
                <td class="style2" align="center">
                    &nbsp;</td>
                <td align="center" class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                  <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="#CC0000" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        style="font-family: Georgia"></asp:RegularExpressionValidator>--%>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style3">
                    <span class="style1"></span>
                </td>
                <td class="style3">
                    <asp:Label ID="lblEmailid" runat="server" 
                        style="font-size: 11pt; color: #000000;" Text="Email Id"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtEmailid" runat="server" CssClass="style1" Height="23px" 
                        Width="145px"></asp:TextBox>
                </td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="rfvEmailid" runat="server" 
                        ControlToValidate="txtEmailid" ErrorMessage="Please enter your Id" 
                        Font-Italic="True" ForeColor="#CC0000" style="font-family: Georgia"></asp:RequiredFieldValidator>
                </td>
                <td class="style3">
                    <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="#CC0000" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        style="font-family: Georgia"></asp:RegularExpressionValidator>--%>
                    <asp:RegularExpressionValidator ID="revEmailid" runat="server" 
                        ControlToValidate="txtEmailid" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="#CC0000" style="font-family: Georgia" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style7">
                    <span class="style1"></span>
                </td>
                <td class="style3">
                    <asp:Label ID="lblPassword" runat="server" Text="Password" 
                        style="font-size: 11pt; color: #000000;"></asp:Label>
                           </td>
                <td class="style6">
                    <asp:TextBox ID="txtPassword" runat="server" Height="23px" Width="145px" 
                        TextMode="Password" CssClass="style1"></asp:TextBox>
                </td>
                <td class="style8">
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Please enter your password" 
                        Font-Italic="True" ForeColor="Black" 
                        style="font-family: Georgia; font-size: 12px; color: #CC0000"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</td>
                <td class="style7">
                    <asp:LinkButton ID="lnkForgotpassword" runat="server" 
                        onclick="LinkButton1_Click">Forgot Password?</asp:LinkButton>
                </td>
                <td class="style6">
                    <asp:Button ID="btnSubmit" runat="server" Height="28px" onclick="Button1_Click" 
                        Text="Submit" Width="118px" />
                   </td>
                <td class="style8">
                    &nbsp;<asp:Label ID="lblWrongpassword" runat="server" ForeColor="#CC0000" 
                        style="font-family: Georgia; font-style: italic;"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style1" colspan="3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblValidationmsg" runat="server" 
                        style="color: #CC0000; font-style: italic; font-family: Georgia"></asp:Label>
                    &nbsp;&nbsp;
                </td>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td class="style7">
                    <span class="style1"></span>
                </td>
                <td class="style3">
                    &nbsp;<asp:Label ID="lblValidationmssg" runat="server" 
                        style="color: #CC0000; font-family: Georgia; font-style: italic"></asp:Label>
                </td>
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

