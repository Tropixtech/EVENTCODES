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
            text-align: center;
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
    <%--</form>--%>
<asp:Panel ID="Panel4" runat="server"  BackColor="#CCFF99" Height="376px" 
        Width="915px">
 <asp:Panel ID="Panel1" runat="server" BorderStyle="None" 
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
                    <asp:Label ID="lblWelcome" runat="server" 
                        style="font-weight: 700; font-size: 11pt; color: #000000;" Text="Welcome"></asp:Label>
                    &nbsp;<asp:Label ID="lblEmailid" runat="server" 
                        style="font-weight: 700; font-size: 11pt; color: #000000;"></asp:Label>
&nbsp;<br />
                </td>
                <td align="right" style="width:200px; text-align: center;"  >
                    <asp:Label ID="lblOrgName" runat="server" 
                        style="text-align: center; color: #000000;"></asp:Label>
                </td>
                <td align="right" >
                    <asp:Button ID="btnChangePass" runat="server" Height="28px" onclick="Button1_Click" 
                        Text="Change Password   " Width="129px" />
                    &nbsp;<asp:Button ID="btnSignout" runat="server" onclick="Button2_Click" 
                        Text="Sign out" Height="28px" Width="118px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" BorderStyle="None" Height="308px" 
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
                                    <asp:Label ID="lblChangePass" runat="server" Text="Change Password" 
                                        style="font-size: large; text-decoration: underline; color: #000000;"></asp:Label>
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
                                    <asp:Label ID="LblNewPass" runat="server" Text="New Password" 
                                        style="font-size: 11pt; color: #000000;"></asp:Label>
                                </td>
                                <td class="style21">
                                    <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" Height="23px" 
                                        Width="145px"></asp:TextBox>
                                </td>
                                <td class="style23">
                                    <asp:RequiredFieldValidator ID="rfvNewpass" runat="server" 
                                        ControlToValidate="txtNewPass" ErrorMessage="Please enter your new password  " 
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
                                    <asp:Label ID="lblConPass" runat="server" Text="Confirm Password" 
                                        style="font-size: 11pt; color: #000000;"></asp:Label>
                                </td>
                                <td class="style21">
                                    <asp:TextBox ID="textConpass" runat="server" TextMode="Password" Height="23px" 
                                        Width="145px"></asp:TextBox>
                                </td>
                                <td class="style23">
                                    <asp:RequiredFieldValidator ID="RfvConpass" runat="server" 
                                        ControlToValidate="textConpass" ErrorMessage="Please re-enter your new password" 
                                        Font-Italic="True" ForeColor="#CC0000" 
                                        style="font-family: Georgia; font-size: 12px"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style30">
                                    <asp:CompareValidator ID="cpvPass" runat="server" 
                                        ControlToCompare="txtNewPass" ControlToValidate="textConpass" 
                                        ErrorMessage="Please enter your correct password" Font-Italic="True" 
                                        ForeColor="#CC0000" style="font-family: Georgia"></asp:CompareValidator>
                                </td>
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
                                    </td>
                                <td class="style6">
                                    </td>
                                <td class="style21">
                                    <asp:Button ID="btnSave" runat="server" Height="28px" onclick="Button3_Click" 
                                        Text="Save" Width="118px" />
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
                            <asp:LinkButton ID="lbtnOrg" runat="server">Organisation</asp:LinkButton>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="style28">
                    <ul>
                        <li style="width: 131px">
                            <asp:LinkButton ID="lbtnUsermanag" runat="server" onclick="LinkButton1_Click">User Management</asp:LinkButton>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="style28">
                    <ul>
                        <li style="font-size: 11pt">
                            <asp:LinkButton ID="lbtnEvent" runat="server" onclick="lbtnEvent_Click">Event</asp:LinkButton>
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

