<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Newregister.aspx.cs" Inherits="Newregister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 234px;
        }
        .style2
        {
            font-family: Tahoma;
            font-size: 11pt;
        }
        .style3
        {
            font-family: Georgia;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<form runat="server" id="form">--%>
<%--<asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" Height="351px" 
        style="font-family: Tahoma; font-size: medium; margin-left: 28px" 
        Width="763px">--%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Panel ID="Panel2" runat="server"  BackColor="#CCFF99" Height="273px">
        <table class="style1">
            <tr>
                <td class="style35" align="center">
                    <asp:Label ID="Label1" runat="server" Text="Register" 
                        
                        style="text-decoration: underline; font-weight: 700; font-family: Tahoma; font-size: medium;"></asp:Label>
                </td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
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
                <td class="style35">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
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
                <td class="style35">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="Label2" runat="server" Text="First Name" CssClass="style2"></asp:Label>
                </td>
                <td class="style6">
                    <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style33">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Please enter your first name" 
                        Font-Italic="True" ForeColor="#CC0000" CssClass="style3"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
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
                </td>
                <td class="style14">
                    <asp:Label ID="Label3" runat="server" Text="Middle Initial" CssClass="style2"></asp:Label>
                </td>
                <td class="style15">
                    <asp:TextBox ID="TextBox2" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style30">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Please enter your middle initial " 
                        Font-Italic="True" ForeColor="#CC0000" CssClass="style3"></asp:RequiredFieldValidator>
                </td>
                <td class="style16">
                </td>
                <td class="style16">
                </td>
                <td class="style16">
                </td>
                <td class="style16">
                </td>
                <td class="style16">
                </td>
                <td class="style16">
                </td>
            </tr>
            <tr>
                <td class="style21">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td class="style22">
                    <asp:Label ID="Label7" runat="server" Text="Last Name" CssClass="style2"></asp:Label>
                </td>
                <td class="style23">
                    <asp:TextBox ID="TextBox3" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style31">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="Please enter your last name" 
                        Font-Italic="True" ForeColor="#CC0000" CssClass="style3"></asp:RequiredFieldValidator>
                </td>
                <td class="style24">
                </td>
                <td class="style24">
                </td>
                <td class="style24">
                </td>
                <td class="style24">
                </td>
                <td class="style24">
                </td>
                <td class="style24">
                </td>
            </tr>
            <tr>
                <td class="style25">
                    </td>
                <td class="style26">
                    <asp:Label ID="Label5" runat="server" Text="New Password" CssClass="style2"></asp:Label>
                </td>
                <td class="style27">
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" Height="23px" 
                        Width="145px"></asp:TextBox>
                </td>
                <td class="style32">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="Please enter your new password  " 
                        Font-Italic="True" ForeColor="#CC0000" CssClass="style3"></asp:RequiredFieldValidator>
                </td>
                <td class="style28">
                    </td>
                <td class="style28">
                    </td>
                <td class="style28">
                    </td>
                <td class="style28">
                    </td>
                <td class="style28">
                    </td>
                <td class="style28">
                    </td>
            </tr>
            <tr>
                <td class="style35">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="Label6" runat="server" Text="Confirm Password" CssClass="style2"></asp:Label>
                </td>
                <td class="style6">
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" Height="23px" 
                        Width="145px"></asp:TextBox>
                </td>
                <td class="style33">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="Please re-enter your new password" 
                        Font-Italic="True" ForeColor="#CC0000" CssClass="style3"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
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
                <td class="style35">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style33">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" 
                        Height="28px" Width="118px" />
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Label" ForeColor="#CC0000" 
                        style="font-family: Georgia"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style35">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style33">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
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
                <td class="style35">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style33">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
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
                <td class="style35">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style33">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
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
                <td class="style35">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style33">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
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
   <%-- </asp:Panel>--%>

     </asp:Panel>
<%--</form>--%>

</asp:Content>

