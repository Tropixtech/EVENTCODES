<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sessions.aspx.cs" Inherits="Sessions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="sessions_style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function ConfirmationBox(name) {
            var result = confirm('Are you sure you want to delete ' + name + ' Details?');
            if (result) {

                return true;
            }
            else {
                return false;
            }
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnlDefault" runat="server" BackColor="#CCFF99">
  
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Names="Tahoma" Font-Size="X-Large" 
                    Text="Sessions"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td rowspan="2">
                <asp:Button ID="btnAddSession" runat="server" Font-Names="Tahoma" Height="28px" 
                    onclick="btnAddSession_Click" Text="Add Session" Width="118px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:GridView ID="gvSession" runat="server" AutoGenerateColumns="False" GridLines="None"
                    CssClass="mGrid" onrowcommand="gvSession_RowCommand" 
                    onrowdeleting="gvSession_RowDeleting" DataKeyNames="ss_id" 
                    onrowediting="gvSession_RowEditing" 
<<<<<<< HEAD
                    onrowdatabound="gvSession_RowDataBound" Height="16px" Width="895px" >
                    <Columns>
                        <asp:BoundField DataField="ss_title" HeaderText="Title" />
                        <asp:BoundField DataField="ss_mdtr_name" HeaderText="Moderator" />
=======
                    onrowdatabound="gvSession_RowDataBound" Height="203px" Width="895px" >
                    <Columns>
                        <asp:BoundField DataField="ss_title" HeaderText="Title" />
                        <asp:BoundField DataField="ss_mdtr_name" HeaderText="Moderator" />
                        <asp:TemplateField HeaderText="Paper Submission">
                            <ItemTemplate>
                                <%#PaperSubmissionStatus(int.Parse(DataBinder.Eval(Container.DataItem,"ss_prior_paper_subm" ).ToString()))%>
                            </ItemTemplate>
                        </asp:TemplateField>
>>>>>>> c4fda4394670306da9f9c0594f25340b18a5842d
                        <asp:BoundField DataField="ss_max_no_atnd" HeaderText="Capacity" />
                        <asp:BoundField DataField="ss_created" HeaderText="Created On" />
                        <asp:BoundField DataField="ss_modified" HeaderText="Modified On" />


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
                                    CommandArgument='<%# Eval("ss_id") %>' />
                                <asp:ImageButton ID="imgbtnDelete" runat="server" CommandName="Delete" 
                                    Height="20px" ImageUrl="~/Images/delete.jpg" Text="Edit" ToolTip="Delete" 
                                    Width="20px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnDone" runat="server" Font-Names="Tahoma" Height="28px" 
                    onclick="btnAddSession_Click" Text="Done" Width="118px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
      </asp:Panel>
</asp:Content>

