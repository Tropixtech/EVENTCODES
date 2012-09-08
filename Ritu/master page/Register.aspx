<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server"  BackColor="#CCFF99" Height="223px">
<%--<table cellpadding="0" cellspacing="0" style="width: 920px" >
    <tr>
        <td  valign="top"  align="center">
            
                     
        
        </td>
    </tr>
</table>--%>
 <table class="style1">
            <tr>
                <td class="style13" align="center">
                    <asp:Label ID="lblregister" runat="server" Text="Register" 
                        
                        
                        style="font-weight: 700; text-decoration: underline; font-family: Tahoma; font-size: medium;"></asp:Label>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td >
                    <asp:Label ID="Label2" runat="server" Text="Email Id" 
                        style="font-family: Tahoma; font-size: 11pt"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtMail" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Please enter your Id" 
                        Font-Italic="True" ForeColor="#CC0000" style="font-family: Georgia"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="#CC0000" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        style="font-family: Georgia"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="Label3" runat="server" style="font-family: Georgia"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14">
                    </td>
                <td class="style9">
                    </td>
                <td class="style10">
                    </td>
                <td class="style11">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
            </tr>
            <tr>
                <td align="left" class="style2" colspan="3">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/login.aspx">Already user? Login</asp:HyperLink>
                </td>
                <td class="style7">
                    <asp:Button ID="Button1" runat="server" style="margin-left: 0px" 
                        Text="Register" Height="28px" Width="118px" onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
 </asp:Panel> 



    <%-- <asp:Panel ID="Panel1"  runat="server" BorderStyle="Solid" Height="231px" 
        style="margin-left: 23px; font-family: Tahoma; font-size: medium;" 
        Width="755px">
        <table class="style1">
            <tr>
                <td class="style13" align="center">
                    <asp:Label ID="Label1" runat="server" Text="Register" 
                        style="font-weight: 700; text-decoration: underline"></asp:Label>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Label ID="Label2" runat="server" Text="Email Id"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtMail" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Please enter your Id" 
                        Font-Italic="True" ForeColor="Black"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="Black" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14">
                    </td>
                <td class="style9">
                    </td>
                <td class="style10">
                    </td>
                <td class="style11">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
            </tr>
            <tr>
                <td align="left" class="style2" colspan="3">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/login.aspx">Already user? Login</asp:HyperLink>
                </td>
                <td class="style7">
                    <asp:Button ID="Button1" runat="server" style="margin-left: 0px" 
                        Text="Register" Height="28px" Width="118px" onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>--%>



       <%-- <asp:Panel ID="Panel1"  runat="server" BorderStyle="Solid" Height="231px" 
        style="margin-left: 23px; font-family: Tahoma; font-size: medium;" 
        Width="755px">
        <table class="style1">
            <tr>
                <td class="style13" align="center">
                    <asp:Label ID="Label1" runat="server" Text="Register" 
                        style="font-weight: 700; text-decoration: underline"></asp:Label>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Label ID="Label2" runat="server" Text="Email Id"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtMail" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Please enter your Id" 
                        Font-Italic="True" ForeColor="Black"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="Black" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14">
                    </td>
                <td class="style9">
                    </td>
                <td class="style10">
                    </td>
                <td class="style11">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
            </tr>
            <tr>
                <td align="left" class="style2" colspan="3">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/login.aspx">Already user? Login</asp:HyperLink>
                </td>
                <td class="style7">
                    <asp:Button ID="Button1" runat="server" style="margin-left: 0px" 
                        Text="Register" Height="28px" Width="118px" onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>--%>



</asp:Content>

