<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rg_pm.aspx.cs" Inherits="rg_pm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #form1
        {
            height: 419px;
            width: 934px;
        }
        .style1
        {
            font-size: large;
        }
        .style6
     {
         width: 328px;
         font-size: 11pt;
         font-family: Tahoma;
     }
        .style5
        {
            width: 328px;
            font-size: medium;
         font-family: Tahoma;
     }
        .style2
        {
            width: 328px;
            font-size: small;
        }
        .style7
     {
         font-size: medium;
         font-family: Tahoma;
         background-color: #FFFFFF;
            color: #808080;
        }
     .style8
     {
         font-family: Tahoma;
     }
     .style10
     {
         font-size: x-large;
     }
     .style11
     {
         font-weight: normal;
     }
     .style12
     {
         font-family: Tahoma;
         color: #666666;
     }
     .style13
     {
            color: #666666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="#CCFF99" Height="417px" 
        style="margin-left: 0px" Width="933px">
   
<%--<body style="font-family: Tahoma">
    <form id="form1" runat="server">
    <div>
    
    </div>--%>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <table style="width:71%; height: 348px; margin-left: 120px; background-color: #CCFF99; margin-top: 0px;"  >
        <tr>
            <td colspan="2" style="font-weight: 700; background-color: #CCFF99;" 
                class="style8" bgcolor="#FF6600">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span 
                    class="style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="style11"><span class="style10"><strong><span 
                    class="style13">&nbsp;</span></strong></span><span><span class="style12"><span class="style10"> 
                Registration Parameter&nbsp;</span></span></span></span><span class="style1"><strong 
                    style="font-size: small"><br />
                </strong></span></td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_max_rg" runat="server" Text="Maximum no of registrants"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_max_rg" runat="server" CssClass="style7" Height="23px" 
                    Width="48px"></asp:TextBox>
                <span class="style8">&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_blank" runat="server" 
                    style="color: #FF0000; font-style: italic" Font-Italic="True" 
                    Font-Names="Georgia" Font-Size="12px" ForeColor="#CC0000"></asp:Label>
            &nbsp;</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server" ControlToValidate="txt_max_rg" ErrorMessage="Enter number only" 
                    Font-Italic="True" Font-Names="Georgia" ForeColor="Red" 
                    ValidationExpression="^[0-9]{0,4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_can_rg" runat="server" Text="Can register more"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rbl_can_rg" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                    RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                    <asp:ListItem Value="1">yes</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">no</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td id="how_many" runat="server" class="style6">
                &nbsp;&nbsp;&nbsp; &nbsp; <asp:Label ID="lbl_how_many" runat="server" Text=" How many more"></asp:Label>
            </td>
            <td id="how_many_txtbx" runat="server">
                <asp:TextBox ID="txt_how_many" runat="server" CssClass="style7" Height="23px" 
                    Width="48px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txt_how_many" ErrorMessage="Enter number only" 
                    Font-Italic="True" Font-Names="Georgia" ForeColor="Red" 
                    ValidationExpression="^[0-9]{0,4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_is_wait_ist" runat="server" 
                    Text="&nbsp; Is wait listing allowed"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rbl_is_waitlist" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                    <asp:ListItem Value="1" Selected="True">yes</asp:ListItem>
                    <asp:ListItem Value="0">no</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_is_onsite" runat="server" 
                    Text="&nbsp; Is onsite registration allowed"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rbl_is_onsite" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                    <asp:ListItem Value="1" Selected="True">yes</asp:ListItem>
                    <asp:ListItem Value="0">no</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;
                <asp:Label ID="lbl_can_rg_wop" runat="server" 
                    Text="&nbsp;&nbsp; Can register without payment"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rbl_can_rgwop" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" 
                    onselectedindexchanged="RadioButtonList4_SelectedIndexChanged" 
                    Font-Names="Tahoma" Font-Size="11pt">
                    <asp:ListItem Value="1">yes</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">no</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td id="no_of_days" runat="server" class="style6">
                &nbsp;<asp:Label ID="lbl_no_of_days" runat="server" 
                    Text="&nbsp;&nbsp;&nbsp;&nbsp; No of days to make payment"></asp:Label>
            </td>
            <td id="days_txtbx" runat="server">
                <asp:TextBox ID="txt_no_of_days" runat="server" CssClass="style7" Height="23px" 
                    Width="48px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txt_no_of_days" ErrorMessage="Enter number only" 
                    Font-Italic="True" Font-Names="Georgia" ForeColor="Red" 
                    ValidationExpression="^[0-9]{0,4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="submit" Width="118px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblMsg" runat="server" Font-Italic="True" Font-Names="Georgia" 
                    Font-Size="12px" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
    </table>
     </asp:Panel>
    </form>


</asp:Content>

