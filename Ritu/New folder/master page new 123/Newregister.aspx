<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Newregister.aspx.cs" Inherits="Newregister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 275px;
        }
        .style2
        {
            font-family: Tahoma;
            font-size: 11pt;
            color: #000000;
        }
        .style6
        {
            width: 122px;
        }
        .style16
        {
            width: 173px;
        }
        .style24
        {
            font-family: Georgia;
            width: 166px;
        }
        .style26
        {
            font-family: Georgia;
            width: 186px;
        }
        .style27
        {
            width: 186px;
            text-align: center;
        }
        .style28
        {
            width: 199px;
        }
        .style31
        {
            width: 825px;
            height: 21px;
        }
        .style33
        {
            width: 276px;
            height: 21px;
        }
        .style34
        {
            width: 186px;
            height: 21px;
        }
        .style35
        {
            width: 451px;
            height: 21px;
        }
        .style36
        {
            height: 21px;
        }
        .style37
        {
            width: 825px;
            height: 24px;
            text-align: left;
        }
        .style38
        {
            font-family: Tahoma;
            font-size: 11pt;
            color: #000000;
            width: 171px;
            height: 24px;
        }
        .style39
        {
            width: 276px;
            text-align: center;
            height: 24px;
        }
        .style40
        {
            font-family: Georgia;
            width: 186px;
            height: 24px;
        }
        .style41
        {
            width: 451px;
            height: 24px;
        }
        .style42
        {
            height: 24px;
        }
        .style45
        {
            font-family: Tahoma;
            font-size: 11pt;
            color: #000000;
            width: 171px;
        }
        .style46
        {
            width: 171px;
            text-align: left;
        }
        .style47
        {
            width: 171px;
            height: 21px;
        }
        .style48
        {
            width: 276px;
            text-align: center;
        }
        .style53
        {
            width: 409px;
        }
        .style57
        {
            width: 391px;
            text-align: left;
        }
        .style58
        {
            width: 825px;
            text-align: left;
        }
        .style59
        {
            width: 451px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%-- </asp:Panel>--%><%-- </asp:Panel>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Panel ID="Panel2" runat="server"  BackColor="#CCFF99" Height="406px">
        <table class="style1">
            <tr>
                <td class="style58" align="center">
                    <asp:Label ID="lbnewRegister" runat="server" Text="For new account" 
                        
                        
                        
                        
                        style="text-decoration: underline; font-weight: 700; font-family: Tahoma; font-size: medium; color: #000000;"></asp:Label>
                </td>
                <td class="style46">
                    &nbsp;</td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style26">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;</td>
                <td class="style45">
                    &nbsp;</td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style26">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;</td>
                <td class="style45">
                    &nbsp;</td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style26">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style37">
                    <asp:Label ID="lblFname" runat="server" CssClass="style2" Text="First Name"></asp:Label>
                </td>
                <td class="style38">
                    <asp:TextBox ID="txtFname" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style39">
                    <asp:Label ID="lblMname" runat="server" CssClass="style2" Text="Middle Initial"></asp:Label>
                </td>
                <td class="style40">
                    <asp:TextBox ID="txtMname" runat="server" Height="23px" Width="50px"></asp:TextBox>
                </td>
                <td class="style41">
                    <asp:Label ID="lblLname" runat="server" CssClass="style2" Text="Last Name"></asp:Label>
                </td>
                <td class="style42">
                    <asp:TextBox ID="txtLname" runat="server" Height="23px" Width="145px" 
                        ontextchanged="txtLname_TextChanged"></asp:TextBox>
                </td>
                <td class="style42">
                </td>
                <td class="style42">
                </td>
                <td class="style42">
                </td>
            </tr>
            <tr>
                <td class="style58">
                    &nbsp;</td>
                <td class="style45">
                    &nbsp;</td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style26">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    <asp:Label ID="lblNewPass" runat="server" CssClass="style2" 
                        Text="New Password"></asp:Label>
                </td>
                <td class="style46">
                    <asp:TextBox ID="txtNewpass" runat="server" Height="23px" TextMode="Password" 
                        Width="145px"></asp:TextBox>
                </td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;</td>
                <td class="style46">
                    &nbsp;</td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;<asp:Label ID="lblConpass" runat="server" CssClass="style2" 
                        Text="Confirm Password"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td class="style46">
                    <asp:TextBox ID="txtConpass" runat="server" Height="23px" TextMode="Password" 
                        Width="145px"></asp:TextBox>
                </td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;</td>
                <td class="style57">
                    <asp:Label ID="Label1" runat="server" 
                        style="color: #CC0000; font-style: italic; font-family: Georgia"></asp:Label>
                </td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;</td>
                <td class="style46">
                    <asp:Button ID="btnSave0" runat="server" Height="28px" onclick="Button1_Click" 
                        Text="Save" Width="118px" />
                </td>
                <td class="style48">
                    &nbsp;&nbsp;
                    <asp:Button ID="btnReset" runat="server" Height="28px" onclick="btnReset_Click" 
                        Text="Reset" Width="118px" />
                </td>
                <td class="style27">
                    <asp:Button ID="btnCanel" runat="server" Height="28px" 
                        onclick="btnCancel_Click" style="margin-left: 18px" Text="Cancel" 
                        Width="118px" />
                </td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;</td>
                <td class="style46">
                    &nbsp;</td>
                <td class="style6" colspan="2">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;</td>
                <td class="style46">
                    &nbsp;</td>
                <td class="style48">
                    &nbsp;&nbsp; </td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style31">
                    </td>
                <td class="style47">
                    </td>
                <td class="style33">
                    </td>
                <td class="style34">
                    </td>
                <td class="style35">
                    </td>
                <td class="style36">
                    </td>
                <td class="style36">
                    </td>
                <td class="style36">
                    </td>
                <td class="style36">
                    </td>
            </tr>
            <tr>
                <td class="style58">
                    &nbsp;</td>
                <td class="style46">
                    &nbsp;</td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;</td>
                <td class="style46">
                    &nbsp;</td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style59">
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
                <td class="style58">
                    &nbsp;</td>
                <td class="style46">
                    &nbsp;</td>
                <td class="style48">
                    &nbsp;</td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style59">
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

