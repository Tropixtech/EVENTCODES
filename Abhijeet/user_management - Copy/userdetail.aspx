<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userdetail.aspx.cs" Inherits="userdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
      <link href="StyleSheet3.css" rel="stylesheet" type="text/css" />
      <script  type="text/javascript">
          function mailvalidate() {
              if (document.getElementById("<%=txtfirst.ClientID%>").value == "") {
                  alert("Please enter user first name");
                  document.getElementById("<%=txtfirst.ClientID%>").focus();
                  return false;
              }
              if (document.getElementById("<%=txtlast.ClientID %>").value == "") {
                  alert("Please enter user last name");
                  document.getElementById("<%=txtlast.ClientID %>").focus();
                  return false;
              }
              if (document.getElementById("<%=txtemail.ClientID %>").value == "") {
                  alert("Email Id cannot be blank");
                  document.getElementById("<%=txtemail.ClientID %>").focus();
                  return false;
              }
              
              var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
              var emailid = document.getElementById("<%=txtemail.ClientID %>").value;
              var matchArray = emailid.match(emailPat);
              if (matchArray == null) {
                  alert("Please enter a valid email Id");
                  document.getElementById("<%=txtemail.ClientID %>").focus();
                  return false;
              }
              if (document.getElementById("<%=txtpass.ClientID %>").value == "") {
                  alert("Please enter a password for the user");
                  document.getElementById("<%=txtpass.ClientID %>").focus();
                  return false;
              }
              if (document.getElementById("<%=txtconfirm.ClientID %>").value != document.getElementById("<%=txtpass.ClientID %>").value) {
                  alert("Password Not Match");
                  document.getElementById("<%=txtconfirm.ClientID %>").focus();
                  return false;
              }

          }
          

      
      
       </script>
    <style type="text/css">
     
        #Reset1
        {
            width: 118px;
            height: 28px;
        }
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="Panel2" runat="server" BackColor="#ccff99" ScrollBars="Both">
           

    <div>
    
        <table 
           
            align="center">
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label15" runat="server" 
                        style="font-family: Tahoma; font-size: x-large; color: #000000" Text="WELCOME"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblorg" runat="server" 
                        style="font-family: Tahoma; font-size: x-large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server" >
                        <table style="width:100%; height: 211px;">
                            <tr>
                                <td  >
                                    <asp:GridView ID="GridView1" runat="server" class="mGrid"
                                        style="font-family: Tahoma; font-size: 11pt" AllowSorting="True" 
                                        AutoGenerateColumns="False" CellPadding="4" 
                                        Width="824px" onrowcancelingedit="GridView1_RowCancelingEdit" 
                                        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                                        onrowupdating="GridView1_RowUpdating" 
                                        onselectedindexchanged="GridView1_SelectedIndexChanged1" Height="16px" 
                                        DataKeyNames="ud_id" onrowdatabound="GridView1_RowDataBound1" 
                                        AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging" 
                                        PageSize="5" BackColor="White" BorderColor="#CC9966" BorderStyle="None" 
                                        BorderWidth="1px">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Userid">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid" runat="server" Text='<%# Bind("ud_id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="First Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblfirst" runat="server" Text='<%# Bind("ud_fname") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtfirst" runat="server" Text='<%# Eval("ud_fname") %>' ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Midddle Initial">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmiddle" runat="server" Text='<%# Bind("ud_mname") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtmiddle" runat="server" Text='<%# Eval("ud_mname") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Last Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbllast" runat="server" Text='<%# Bind("ud_lname") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtlast" runat="server" Text='<%# Eval("ud_lname") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblemail" runat="server" Text='<%# Bind("ud_email_id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtemail" runat="server" Text='<%# Eval("ud_email_id") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Password">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblpass" runat="server" Text='<%# Bind("ud_password") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtpass" runat="server" Text='<%# Eval("ud_password") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Created Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcreate" runat="server" Text='<%# Bind("ud_created_date") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
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
                                            <asp:TemplateField HeaderText="Deactivated Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldeactive" runat="server" 
                                                        Text='<%# Bind("ud_deactiv_date") %>'></asp:Label>
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
                                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                        <RowStyle BackColor="White" ForeColor="#330099" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                    </asp:GridView>
                                    <asp:Button ID="btncreate" runat="server" onclick="btncreate_Click" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Create User" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button1" runat="server" Height="28px" 
                                        onclick="Button1_Click" Text="Back" Width="118px" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblmsg1" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt"></asp:Label>
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
                                    <asp:TextBox ID="txtfirst" runat="server" Height="23px" Width="145px" 
                                        ToolTip="Please enter your first name"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Middle Initial"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtmiddle" runat="server" Height="23px" Width="50px" 
                                        ToolTip="Please enter your middle initial name"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Last Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtlast" runat="server" Height="23px" Width="135px" 
                                        ToolTip="Please enter your last name"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Email Id"></asp:Label>
                                </td>
                                <td colspan="5">
                                    <asp:TextBox ID="txtemail" runat="server" Height="23px" Width="145px" 
                                        ToolTip="Please enter your emailid"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Password"></asp:Label>
                                </td>
                                <td colspan="5">
                                    <asp:TextBox ID="txtpass" runat="server" Height="23px" Width="145px" 
                                        TextMode="Password" ToolTip="Please enter a secure password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label16" runat="server" 
                                        style="font-family: Tahoma; font-size: 11pt" Text="Confirm Password"></asp:Label>
                                </td>
                                <td colspan="5">
                                    <asp:TextBox ID="txtconfirm" runat="server" Height="23px" TextMode="Password" 
                                        ToolTip="Please enter a secure password" Width="145px"></asp:TextBox>
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
                                        <asp:ListItem>Active</asp:ListItem>
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
                                    <asp:Button ID="btnsubmit" runat="server" onclick="btnsubmit_Click" OnClientClick=" return mailvalidate()"
                                        style="font-family: Tahoma; font-size: 11pt" Text="Submit" Width="118px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Height="28px" 
                                        onclick="Button2_Click" Text="Reset" Width="118px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnshow" runat="server" 
                                        onclick="btnshow_Click" style="font-family: Tahoma; font-size: 11pt" 
                                        Text="Cancel" Width="118px" />
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

