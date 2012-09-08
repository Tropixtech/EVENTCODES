<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnlDefault" runat="server" BackColor="#CCFF99">
  
    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Session"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
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
                <asp:Button ID="btnAddSession" runat="server" Text="Add New Session" 
                    onclick="btnAddSession_Click" />
            </td>
            <td>
                &nbsp;</td>
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
            <td>
                <asp:GridView ID="gvSession" runat="server" AutoGenerateColumns="False" 
                    CssClass="mGrid" onrowcommand="gvSession_RowCommand" 
                    onrowdeleting="gvSession_RowDeleting" DataKeyNames="ss_id" 
                    onrowediting="gvSession_RowEditing" >
                    <Columns>
                        <asp:BoundField DataField="ss_title" HeaderText="Title" />
                        <asp:BoundField DataField="ss_mdtr_fname" HeaderText="Moderator" />
                        <asp:BoundField DataField="ss_prior_paper_subm" HeaderText="Paper Submission" />
                        <asp:BoundField DataField="ss_created" HeaderText="Created On" />
                        <asp:BoundField DataField="ss_modified" HeaderText="Modified On" />
                      


                        <asp:TemplateField HeaderText="Paper Submission">
                          <ItemTemplate>
                                <%#PaperSubmissionStatus(int.Parse(DataBinder.Eval(Container.DataItem,"ss_prior_paper_subm" ).ToString()))%>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:TemplateField HeaderText="Moderator">
                          <ItemTemplate>
                                <%#PaperSubmissionStatus(int.Parse(DataBinder.Eval(Container.DataItem,"ss_prior_paper_subm" ).ToString()))%>

                            </ItemTemplate>
                        </asp:TemplateField>
                      --%>


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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblTest1" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
      </asp:Panel>
</asp:Content>

