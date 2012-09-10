<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 111px;
        }
        .style4
        {
            width: 146px;
        }
        .style6
        {
            width: 134px;
            text-align: left;
        }
        .style13
        {
            text-align: center;
        }
        .style21
        {
            width: 187px;
        }
        .style23
        {
            text-align: left;
            width: 123px;
        }
        .style24
        {
            width: 123px;
        }
        .style28
        {
            width: 353px;
        }
        .style29
        {
            width: 107px;
        }
        .style30
        {
            text-align: left;
            font-size: 12px;
            width: 107px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<form runat="server" id="form">--%>
<asp:Panel ID="Panel4" runat="server"  BackColor="#CCFF99" Height="376px" 
        Width="915px">
 <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" 
        style="font-family: Tahoma; font-size: medium" Width="906px" 
        HorizontalAlign="Right" Height="52px" >
        <table  width="100%">
            <tr>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" >
                    <asp:Label ID="Label3" runat="server" 
                        style="font-weight: 700; font-size: 11pt;" Text="Welcome"></asp:Label>
                    &nbsp;<asp:Label ID="Label4" runat="server" style="font-weight: 700; font-size: 11pt;" 
                        Text="Label"></asp:Label>
&nbsp;<br />
                </td>
                <td align="right" style="width:200px"  >
                    &nbsp;</td>
                <td align="right" >
                    &nbsp;<asp:Button ID="Button1" runat="server" Height="28px" onclick="Button1_Click" 
                        Text="ChangePassword" Width="118px" />
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Signout" Height="28px" Width="118px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid" Height="308px" 
        style="font-family: Tahoma; font-size: medium">
        <table class="style1">
            <tr>
                <td class="style28">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style28">
                    &nbsp;</td>
                <td colspan="2" rowspan="8">
                    <asp:Panel ID="Panel3" runat="server" BorderStyle="Solid" Height="229px" 
                        style="margin-left: 0px" Width="716px">
                        <table class="style13">
                            <tr>
                                <td class="style4" align="center">
                                    <asp:Label ID="Label5" runat="server" Text="Change Password" 
                                        style="font-size: large; text-decoration: underline"></asp:Label>
                                </td>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                                <td class="style24">
                                    &nbsp;</td>
                                <td class="style29">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    &nbsp;</td>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                                <td class="style23">
                                    &nbsp;</td>
                                <td class="style30">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    &nbsp;</td>
                                <td class="style6">
                                    <asp:Label ID="Label6" runat="server" Text="New Password" 
                                        style="font-size: 11pt"></asp:Label>
                                </td>
                                <td class="style21">
                                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" Height="23px" 
                                        Width="145px"></asp:TextBox>
                                </td>
                                <td class="style23">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="Please enter your new password  " 
                                        Font-Italic="True" ForeColor="#CC0000" 
                                        style="font-family: Georgia; font-size: 12px"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style30">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    &nbsp;</td>
                                <td class="style6">
                                    <asp:Label ID="Label7" runat="server" Text="Confirm Password" 
                                        style="font-size: 11pt"></asp:Label>
                                </td>
                                <td class="style21">
                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="23px" 
                                        Width="145px"></asp:TextBox>
                                </td>
                                <td class="style23">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="Please re-enter your new password" 
                                        Font-Italic="True" ForeColor="#CC0000" 
                                        style="font-family: Georgia; font-size: 12px"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style30">
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                        ControlToCompare="TextBox1" ControlToValidate="TextBox2" 
                                        ErrorMessage="Please enter your correct password" Font-Italic="True" 
                                        ForeColor="#CC0000"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    ss</td>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                                <td class="style23">
                                    <asp:Button ID="Button3" runat="server" Text="Save" Height="28px" 
                                        Width="118px" onclick="Button3_Click" />
                                </td>
                                <td class="style30">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    </td>
                                <td class="style6">
                                    </td>
                                <td class="style21">
                                    </td>
                                <td class="style23">
                                    </td>
                                <td class="style29">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="style28">
                    <ul>
                        <li style="text-align: left">
                            <asp:HyperLink ID="HyperLink1" runat="server">Organisation</asp:HyperLink>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="style28">
                    <ul>
                        <li style="width: 131px">
                            <asp:HyperLink ID="HyperLink2" runat="server">User Management</asp:HyperLink>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="style28">
                    <ul>
                        <li>
                            <asp:HyperLink ID="HyperLink3" runat="server">Event</asp:HyperLink>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style28">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
      </asp:Panel>


<%--</form>--%>
</asp:Content>

