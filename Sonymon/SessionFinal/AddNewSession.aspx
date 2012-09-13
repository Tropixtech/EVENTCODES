<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewSession.aspx.cs" Inherits="AddNewSession" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function ConfirmationBox(username) {


            var result = confirm('Are you sure you want to delete ' + username + ' Details?');
            if (result) {

                return true;
            }
            else {
                return false;
            }
        }
</script>
    <style type="text/css">
        .style12
        {
            height: 15px;
        }
        .style13
        {
            height: 26px;
        }
        .style14
        {
            height: 90px;
        }
        .style15
        {
            width: 96px;
        }
        .style16
        {
            width: 127px;
            height: 26px;
        }
        .style30
    {
        width: 98px;
    }
    .style32
    {
        width: 213px;
    }
    .style36
    {
        height: 27px;
    }
    .style37
    {
        height: 30px;
        width: 98px;
    }
    .style39
    {
        height: 30px;
        width: 213px;
    }
    .style40
    {
        height: 30px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnlAddNewSession" runat="server" BackColor="#CCFF99">

    <table class="style1">
    <tr>
        <td class="style3" colspan="2">
            &nbsp;</td>
        <td colspan="5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
            <asp:Label ID="Label13" runat="server" Font-Names="Tahoma" Font-Size="X-Large" 
                Text="Add Session"></asp:Label>
        </td>
        <td colspan="5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
            &nbsp;</td>
        <td colspan="5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style13" colspan="2">
            <asp:Label ID="Label1" runat="server" Text="Title" Font-Names="Tahoma" 
                Font-Size="11pt"></asp:Label>
        </td>
        <td colspan="5" class="style13">
            <asp:TextBox ID="txtTitle" runat="server" Font-Names="Tahoma" Height="23px" 
                Width="145px"></asp:TextBox>
        </td>
        <td class="style13">
            </td>
    </tr>
    <tr>
        <td class="style36" colspan="2">
            <asp:Label ID="Label2" runat="server" Text="Description" Font-Names="Tahoma" 
                Font-Size="11pt"></asp:Label>
        </td>
        <td colspan="5" class="style36">
            <asp:TextBox ID="txtDescription" runat="server" Font-Names="Tahoma" 
                Height="23px" Width="145px"></asp:TextBox>
        </td>
        <td class="style36">
            </td>
    </tr>
    <tr>
        <td class="style14" colspan="2" rowspan="2">
            <asp:Label ID="Label9" runat="server" Text="Moderator" Font-Names="Tahoma" 
                Font-Size="11pt"></asp:Label>
        </td>
        <td class="style30">
            <asp:Label ID="lblMdtrFName" runat="server" Text="First Name" 
                Font-Names="Tahoma" Font-Size="11pt"></asp:Label>
        </td>
        <td colspan="2">
            <asp:Label ID="lblMdtrMName" runat="server" Font-Names="Tahoma" 
                Font-Size="11pt" Text="Middle Name"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblMdtrLName" runat="server" Font-Names="Tahoma" 
                Font-Size="11pt" Text="last Name"></asp:Label>
        </td>
        <td class="style32">
        </td>
        <td class="style14" rowspan="2">
            </td>
    </tr>
        <tr>
            <td class="style37">
                <asp:TextBox ID="txtMdtrFName" runat="server" Font-Names="Tahoma" Height="23px" 
                    Width="145px"></asp:TextBox>
            </td>
            <td class="style40" colspan="2">
                <asp:TextBox ID="txtMdtrMName" runat="server" Font-Names="Tahoma" Height="23px" 
                    Width="145px"></asp:TextBox>
            </td>
            <td class="style40">
                <asp:TextBox ID="txtMdtrLName" runat="server" Font-Names="Tahoma" Height="23px" 
                    Width="145px"></asp:TextBox>
            </td>
            <td class="style39">
            </td>
        </tr>
    <tr>
        <td class="style13" colspan="2">
            <asp:Label ID="Label3" runat="server" Text="Maximum number of attendees" 
                Font-Names="Tahoma" Font-Size="11pt"></asp:Label>
        </td>
        <td colspan="5" class="style13">
            <asp:TextBox ID="txtNoAttendees" runat="server" Font-Names="Tahoma" 
                Height="23px" Width="145px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtNoAttendees" ErrorMessage="Enter Number only" 
                ValidationExpression="[0-9]+" ForeColor="#CC0000"></asp:RegularExpressionValidator>
        </td>
        <td class="style13">
            </td>
    </tr>
    <tr>
        <td class="style13" colspan="2">
            <asp:Label ID="Label4" runat="server" Text="Presenters" Font-Names="Tahoma" 
                Font-Size="11pt"></asp:Label>
        </td>
        <td colspan="5" class="style13">
            </td>
        <td class="style13">
            </td>
    </tr>
    <tr>
        <td class="style3" colspan="7">
            <asp:GridView ID="gvPresenter" DataKeyNames="pr_id,pr_name"   runat="server" AlternatingRowStyle-CssClass="alt" 
                AutoGenerateColumns="False" CssClass="mGrid" 
                GridLines="None" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true" 
                HeaderStyle-ForeColor="White" Height="16px" 
                onrowcancelingedit="gvPresenter_RowCancelingEdit" 
                onrowcommand="gvPresenter_RowCommand" onrowdeleting="gvPresenter_RowDeleting" 
                onrowediting="gvPresenter_RowEditing" onrowupdating="gvPresenter_RowUpdating" 
                ShowFooter="True" Width="575px" onrowdatabound="gvPresenter_RowDataBound">
                <AlternatingRowStyle CssClass="alt" />
                <Columns>
                    <asp:TemplateField HeaderText="Speaker Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("pr_name") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblcity" runat="server" Text='<%#Eval("pr_name") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftrName" runat="server" />
                           <%-- <asp:RequiredFieldValidator ID="rfvcity" runat="server" 
                                ControlToValidate="txtftrName" Text="*" ValidationGroup="validaiton" />--%>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Topic">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTopic" runat="server" Text='<%#Eval("pr_topic") %>' />
                        
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblstate" runat="server" Text='<%#Eval("pr_topic") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftrTopic" runat="server" />
                           <%-- <asp:RequiredFieldValidator ID="rfvdesignation" runat="server" 
                                ControlToValidate="txtftrTopic" Text="*" 
                                ValidationGroup="validaiton" />--%>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:ImageButton ID="imgbtnUpdate" runat="server" CommandName="Update" 
                                Height="20px" ImageUrl="~/Images/update.jpg" ToolTip="Update" Width="20px" />
                            <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" 
                                Height="20px" ImageUrl="~/Images/Cancel.jpg" ToolTip="Cancel" Width="20px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnEdit" runat="server" CommandName="Edit" 
                                Height="20px" ImageUrl="~/Images/Edit.jpg" ToolTip="Edit" Width="20px" 
                                Visible="False" />
                            <asp:ImageButton ID="imgbtnDelete" runat="server" CommandName="Delete" 
                                Height="20px" ImageUrl="~/Images/delete.jpg" Text="Edit" ToolTip="Delete" 
                                Width="20px" Visible="False" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="imgbtnAdd" runat="server" CommandName="AddNew" 
                                Height="30px" ImageUrl="~/Images/AddNewitem.jpg" ToolTip="Add new User" 
                                ValidationGroup="validaiton" Width="30px" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#61A6F8" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:Label ID="lblresult" runat="server" Text="Label"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
            &nbsp;</td>
        <td colspan="5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style13" colspan="2">
            <asp:Label ID="Label10" runat="server" Text="Prior paper submission" 
                Font-Names="Tahoma" Font-Size="11pt"></asp:Label>
        </td>
        <td colspan="5" class="style13">
            <asp:DropDownList ID="ddlPriorPaperSubm" runat="server" Height="23px" 
                Width="145px">
                <asp:ListItem Selected="True">Select One</asp:ListItem>
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblpriorPaperSubmValidation" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="style13">
            </td>
    </tr>
    <tr>
        <td class="style3" colspan="2" rowspan="3">
            <asp:Label ID="Label5" runat="server" Text="Sharing Options" 
                Font-Names="Tahoma" Font-Size="11pt"></asp:Label>
        </td>
        <td class="style16" colspan="2">
            <asp:Label ID="Label11" runat="server" Text="Organizer" Font-Names="Tahoma" 
                Font-Size="11pt"></asp:Label>
        </td>
        <td class="style13" colspan="3">
            <asp:RadioButtonList ID="rblOrganizer" runat="server" 
                RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td rowspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16" colspan="2">
            <asp:Label ID="Label12" runat="server" Text="Co-Presenter" Font-Names="Tahoma" 
                Font-Size="11pt"></asp:Label>
        </td>
        <td class="style13" colspan="3">
            <asp:RadioButtonList ID="rblCopresenter" runat="server" 
                RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="style16" colspan="2">
            <asp:Label ID="Label13b" runat="server" Text="Public" Font-Names="Tahoma" 
                Font-Size="11pt"></asp:Label>
        </td>
        <td class="style13" colspan="3">
            <asp:RadioButtonList ID="rblPublic" runat="server" 
                RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
            <asp:Label ID="Label6" runat="server" Text="Additional Requirements" 
                Font-Names="Tahoma" Font-Size="11pt"></asp:Label>
        </td>
        <td colspan="5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3" colspan="7">






            <asp:GridView ID="gvAdditionalReq" DataKeyNames="ar_id,ar_equipment"   
                runat="server" AlternatingRowStyle-CssClass="alt" 
                AutoGenerateColumns="False" CssClass="mGrid" 
                GridLines="None" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true" 
                HeaderStyle-ForeColor="White" Height="16px" 
                onrowcancelingedit="gvAdditionalReq_RowCancelingEdit" 
                onrowcommand="gvAdditionalReq_RowCommand" onrowdeleting="gvAdditionalReq_RowDeleting" 
                onrowediting="gvAdditionalReq_RowEditing" onrowupdating="gvAdditionalReq_RowUpdating" 
                ShowFooter="True" Width="575px" 
                onrowdatabound="gvAdditionalReq_RowDataBound" Font-Names="Tahoma">
                <AlternatingRowStyle CssClass="alt" />
                <Columns>
                    <asp:TemplateField HeaderText="Equipment">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEquipment" runat="server" Text='<%#Eval("ar_equipment") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblcity0" runat="server" Text='<%#Eval("ar_equipment") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftrEquipment" runat="server" />
                           <%-- <asp:RequiredFieldValidator ID="rfvcity0" runat="server" 
                                ControlToValidate="txtftrEquipment" Text="*" ValidationGroup="validaiton" />--%>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Specification">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSpecification" runat="server" Text='<%#Eval("ar_specification") %>' />
                        
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblstate0" runat="server" Text='<%#Eval("ar_specification") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftrSpecification" runat="server" />
                           <%-- <asp:RequiredFieldValidator ID="rfvdesignation0" runat="server" 
                                ControlToValidate="txtftrSpecification" Text="*" 
                                ValidationGroup="validaiton" />--%>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:ImageButton ID="imgbtnUpdate0" runat="server" CommandName="Update" 
                                Height="20px" ImageUrl="~/Images/update.jpg" ToolTip="Update" 
                                Width="20px" />
                            <asp:ImageButton ID="imgbtnCancel0" runat="server" CommandName="Cancel" 
                                Height="20px" ImageUrl="~/Images/Cancel.jpg" ToolTip="Cancel" 
                                Width="20px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnEdit0" runat="server" CommandName="Edit" 
                                Height="20px" ImageUrl="~/Images/Edit.jpg" ToolTip="Edit" Width="20px" 
                                Visible="False" />
                            <asp:ImageButton ID="imgbtnDelete0" runat="server" CommandName="Delete" 
                                Height="20px" ImageUrl="~/Images/delete.jpg" Text="Edit" ToolTip="Delete" 
                                Width="20px" Visible="False" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="imgbtnAdd0" runat="server" CommandName="AddNew" 
                                Height="30px" ImageUrl="~/Images/AddNewitem.jpg" ToolTip="Add new User" 
                                ValidationGroup="validaiton" Width="30px" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#61A6F8" Font-Bold="True" ForeColor="White" />
            </asp:GridView>




            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style13" colspan="2">
            <asp:Label ID="Label7" runat="server" Text="Price for Attending" 
                Font-Names="Tahoma" Font-Size="11pt"></asp:Label>
        </td>
        <td colspan="5" class="style13">
            <asp:RadioButtonList ID="rblPriceAttend" runat="server" 
                RepeatDirection="Horizontal" Font-Names="Tahoma" Font-Size="11pt">
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="style13">
            </td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
            &nbsp;</td>
        <td colspan="5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3" colspan="7">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style12" colspan="2">
            </td>
        <td colspan="5" class="style12">
            <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="style12">
            </td>
    </tr>
    <tr>
        <td class="style10">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                onclick="btnCancel_Click" Font-Names="Tahoma" Height="28px" 
                Width="118px" />
        </td>
        <td class="style15">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                onclick="btnSubmit_Click" Font-Names="Tahoma" Height="28px" 
                Width="118px" />
        </td>
        <td colspan="5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
    </asp:Panel>
</asp:Content>

