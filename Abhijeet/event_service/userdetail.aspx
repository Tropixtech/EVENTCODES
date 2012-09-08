<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userdetail.aspx.cs" Inherits="userdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
      <link href="StyleSheet3.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="Panel2" runat="server" BackColor="#ccff99" ScrollBars="Both">
           

    <div>
    
        <table 
           
            align="center">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server" >
                        <table style="width:100%; height: 211px;">
                            <tr>
                                <td  >
                                    <asp:GridView ID="GridView1" runat="server" class="mGrid"
                                        style="font-family: Tahoma; font-size: 11pt" AllowSorting="True" 
                                        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
                                        Width="824px" onrowcancelingedit="GridView1_RowCancelingEdit" 
                                        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                                        onrowupdating="GridView1_RowUpdating" 
                                        onselectedindexchanged="GridView1_SelectedIndexChanged1" Height="16px" 
                                        DataKeyNames="ud_id" onrowdatabound="GridView1_RowDataBound1">
                                        <AlternatingRowStyle BackColor="#DCDCDC" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="userid">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid" runat="server" Text='<%# Bind("ud_id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="first name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblfirst" runat="server" Text='<%# Bind("ud_fname") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtfirst" runat="server" Text='<%# Eval("ud_fname") %>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="midddle">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmiddle" runat="server" Text='<%# Bind("ud_mname") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtmiddle" runat="server" Text='<%# Eval("ud_mname") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="last">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbllast" runat="server" Text='<%# Bind("ud_lname") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtlast" runat="server" Text='<%# Eval("ud_lname") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="email">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblemail" runat="server" Text='<%# Bind("ud_email_id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtemail" runat="server" Text='<%# Eval("ud_email_id") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="password">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblpass" runat="server" Text='<%# Bind("ud_password") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtpass" runat="server" Text='<%# Eval("ud_password") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="created date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcreate" runat="server" Text='<%# Bind("ud_created_date") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="status">
                                                <EditItemTemplate>
                                                    <asp:RadioButtonList ID="rbtlstatus" runat="server" DataValueField='<%# Eval("ud_status") %>'>
                                                        <asp:ListItem Value="1">Activate</asp:ListItem>
                                                        <asp:ListItem Value="0">Deactivate</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("ud_status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Create Admin" ShowSelectButton="True" />
                                            <asp:TemplateField HeaderText="Edit">
                                                <EditItemTemplate>
                                                    <asp:ImageButton ID="imgbtnUpdate" runat="server" CommandName="Update" 
                                                        Height="20px" ImageUrl="~/images/update.jpg" ToolTip="Update" Width="20px" />
                                                    &nbsp;&nbsp;<asp:ImageButton ID="imgbtnCancel" runat="server" 
                                                        CommandName="Cancel" Height="20px" ImageUrl="~/images/Cancel.jpg" 
                                                        ToolTip="Cancel" Width="20px" />
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Edit" 
                                                        ImageUrl="~/images/Edit.jpg" Height="20px" Width="20px" />
                                                    &nbsp;&nbsp;&nbsp;
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" 
                                                        Height="20px" ImageUrl="~/images/delete.jpg" Width="20px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#000065" />
                                    </asp:GridView>
                                    <asp:Button ID="btncreate" runat="server" 
                                        ForeColor="#000077" onclick="btncreate_Click" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Create User" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button1" runat="server" Height="28px" 
                                        onclick="Button1_Click" Text="Back" Width="118px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel3" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="First Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtfirst" runat="server" Height="23px" Width="145px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="M Initial"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtmiddle" runat="server" Height="23px" Width="50px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Last Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtlast" runat="server" Height="23px" Width="135px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Email Id"></asp:Label>
                                </td>
                                <td colspan="5">
                                    <asp:TextBox ID="txtemail" runat="server" Height="23px" Width="145px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Password"></asp:Label>
                                </td>
                                <td colspan="5">
                                    <asp:TextBox ID="txtpass" runat="server" Height="23px" Width="145px" 
                                        TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Status"></asp:Label>
                                </td>
                                <td colspan="5">
                                    <asp:RadioButtonList ID="rbtnstatus" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt">
                                        <asp:ListItem>Activate</asp:ListItem>
                                        <asp:ListItem>Deactivate</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:Label ID="lblmsg" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td colspan="5">
                                    <asp:Button ID="btnsubmit" runat="server" 
                                        ForeColor="#000077" onclick="btnsubmit_Click" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Submit" Width="118px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnshow" runat="server" ForeColor="#000077" 
                                        onclick="btnshow_Click" style="font-family: Tahoma; font-size: 11pt" 
                                        Text="Show" Width="118px" />
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    
    </div>
   </asp:Panel>
  


</asp:Content>

