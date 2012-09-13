<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reg_pm.aspx.cs" Inherits="reg_pm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #form1
        {
            height: 419px;
            width: 934px;
        }
        .style6
     {
         width: 328px;
         font-size: 11pt;
         font-family: Tahoma;
     }
        .style5
        {
            font-size: medium;
         font-family: Tahoma;
     }
        .style2
        {
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
     </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">
    <asp:Panel ID="panel1" runat="server" BackColor="#CCFF99" Height="47px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Names="Tahoma" Font-Size="X-Large" 
            Text="Registration Parameters"></asp:Label>
        <br />
        <br />
        <br />
    </asp:Panel>
        <asp:Panel ID="panel2" runat="server" BackColor="#CCFF99">
         <table style="width:71%; height: 348px; margin-left: 120px; background-color: #CCFF99; margin-top: 0px;"  >
        <tr>
           <%-- <td colspan="2" style="font-weight: 700; background-color: #CCFF99;" 
                class="style8" bgcolor="#FF6600">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span 
                    class="style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="style11"><span class="style10"><strong><span 
                    class="style13">&nbsp;</span></strong></span><span><span class="style12"><span class="style10"> 
                Registration Parameters&nbsp;</span></span></span></span><span class="style1"><strong 
                    style="font-size: small"><br />
                </strong></span></td>--%>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblMax_rg" runat="server" Text="Maximum no of registrants"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMax_rg" runat="server" CssClass="style7" Height="23px" 
                    Width="48px"></asp:TextBox>
                <span class="style8">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server" ControlToValidate="txtMax_rg" ErrorMessage="Enter number only" 
                    Font-Italic="True" Font-Names="Georgia" ForeColor="Red" 
                    ValidationExpression="^[0-9]{0,4}"></asp:RegularExpressionValidator>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtMax_rg" ErrorMessage="Number cannot be blank" 
                    Font-Italic="True" Font-Names="Georgia" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblCan_rg" runat="server" Text="Can register more"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblCan_rg" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                    RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                    <asp:ListItem Value="1">yes</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">no</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td id="how_many" runat="server" class="style6">
                &nbsp;&nbsp;&nbsp; &nbsp; <asp:Label ID="lblHow_many" runat="server" 
                    Text=" How many more"></asp:Label>
            </td>
            <td id="how_many_txtbx" runat="server">
                <asp:TextBox ID="txtHow_many" runat="server" CssClass="style7" Height="23px" 
                    Width="48px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtHow_many" ErrorMessage="Enter number only" 
                    Font-Italic="True" Font-Names="Georgia" ForeColor="Red" 
                    ValidationExpression="^[0-9]{0,4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblIs_wait_ist" runat="server" 
                    Text="&nbsp; Is wait listing allowed"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblIs_waitlist" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                    <asp:ListItem Value="1" Selected="True">yes</asp:ListItem>
                    <asp:ListItem Value="0">no</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblIs_onsite" runat="server" 
                    Text="&nbsp; Is onsite registration allowed"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblIs_onsite" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                    <asp:ListItem Value="1" Selected="True">yes</asp:ListItem>
                    <asp:ListItem Value="0">no</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;
                <asp:Label ID="lblCan_rg_wop" runat="server" 
                    Text="&nbsp;&nbsp; Can register without payment"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblCan_rgwop" runat="server" AutoPostBack="True" 
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
                &nbsp;<asp:Label ID="lblNo_of_days" runat="server" 
                    Text="&nbsp;&nbsp;&nbsp;&nbsp; No of days to make payment"></asp:Label>
            </td>
            <td id="days_txtbx" runat="server">
                <asp:TextBox ID="txtNo_of_days" runat="server" CssClass="style7" Height="23px" 
                    Width="48px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtNo_of_days" ErrorMessage="Enter number only" 
                    Font-Italic="True" Font-Names="Georgia" ForeColor="Red" 
                    ValidationExpression="^[0-9]{0,4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style5" colspan="2">
                <%--<asp:Button ID="btnEdit" runat="server" onclick="Button1_Click" Text="edit" 
                    Width="118px" />--%>
                <%--<asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                    Text="update" Width="118px" />--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="118px" 
                    onclick="btnSave_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="118px" 
                    onclick="btnEdit_Click" />
                &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" Width="118px" 
                    onclick="btnUpdate_Click" />
&nbsp;<asp:Button ID="btnExit" runat="server" 
                    Text="Exit" Width="118px" />
                &nbsp;&nbsp;
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
        <tr>
            <td class="style2" colspan="2">
                <%--<asp:Panel ID="Panel2" runat="server"  >
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        Height="38px" Width="753px" AllowPaging="True" DataKeyNames="rp_id" 
                        Font-Names="Tahoma" onpageindexchanging="GridView1_PageIndexChanging" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="rp_id" HeaderText="rID" />
                        <asp:BoundField DataField="rp_max_participants" HeaderText="MaxParticipants" />
                        <asp:BoundField DataField="rp_is_register_more" HeaderText="IsReg_More" />
                        <asp:BoundField DataField="rp_reg_howmany" HeaderText="RegHowmany" />
                        <asp:BoundField DataField="rp_is_wtlisitng" HeaderText="IsWaitlistng" />
                        <asp:BoundField DataField="rp_is_onsite_reg" HeaderText="IsOnsite" />
                        <asp:BoundField DataField="rp_reg_without_pay" HeaderText="reg_WithoutPay" />
                        <asp:BoundField DataField="rp_no_days_pay" HeaderText="NoOfDays" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                </asp:Panel>--%>
            </td>
        </tr>
    </table>


       </asp:Panel>
   

 <%--<asp:Panel ID="panel3" runat="server" BackColor="#CCFF99" Height="55px">
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> 
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     &nbsp;
     <asp:Button ID="btnShow" runat="server" onclick="btnShow_Click" Text="Show" 
         Width="118px" />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="118px" />
         
                    
                
</asp:Panel>--%>


    </form>
</asp:Content>

