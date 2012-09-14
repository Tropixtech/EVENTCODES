<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="thank you.aspx.cs" Inherits="thank_you" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    #form
    {
        width: 1087px;
    }
        .style1
        {
            font-family: Georgia;
        }
        .style2
        {
            font-size: medium;
        }
        .style3
        {
            font-family: Georgia;
            font-size: medium;
        }
        .style4
        {
            font-size: large;
        }
        .style5
        {
            font-family: Georgia;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--</form>--%>
    <asp:Panel ID="Panel2" runat="server"  BackColor="#CCFF99" Height="193px">

 <table class="style1">
        <tr class="style3">
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblSucsflexe" runat="server" 
                    style="font-weight: 700; font-style: italic; color: #CC0000; text-decoration: underline; " 
                    Text="Thank you for creating an account&nbsp;" CssClass="style5" 
                    ForeColor="#CC0000"></asp:Label>
            </td>
            <td>
                <span class="style1"></span></td>
            <td>
                <span class="style2"></span></td>
            <td>
               </td>
        </tr>
        <tr>
            <td class="style2">
                </td>
            <td>
                <asp:Label ID="lblSucsflexee" runat="server" 
                    style="font-style: italic; color: #CC0000; " 
                    Text="&nbsp;&nbsp; You will get an activation link to your account&nbsp;" 
                    CssClass="style5" ForeColor="#006600"></asp:Label>
            </td>
            <td>
                <span class="style1"></span></td>
            <td>
                <span class="style2"></span></td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
               </td>
        </tr>
        <tr>
            <td class="style2">
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
<%--</form>--%>
</asp:Content>

