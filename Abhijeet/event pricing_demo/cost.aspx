<%@ Page Title="" Language="C#" MasterPageFile="~/EventAdminMaster1.master" AutoEventWireup="true" CodeFile="cost.aspx.cs" Inherits="cost" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
 <script language=javascript type="text/javascript">
     function expandcollapse(obj, row) {
         var div = document.getElementById(obj);
         var img = document.getElementById('img' + obj);

         if (div.style.display == "none") {
             div.style.display = "block";
             if (row == 'alt') {
                 img.src = "minus.gif";
             }
             else {
                 img.src = "minus.gif";
             }
             img.alt = "Close to view other Customers";
         }
         else {
             div.style.display = "none";
             if (row == 'alt') {
                 img.src = "plus.gif";
             }
             else {
                 img.src = "plus.gif";
             }
             img.alt = "Expand to show Orders";
         }
     }
     
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" >
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="pt_id"
            Width="687px" onrowcancelingedit="GridView1_RowCancelingEdit"  CssClass="mGrid"
            onrowcommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound" 
            onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
            onrowupdating="GridView1_RowUpdating"  BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Horizontal" ondatabound="GridView1_DataBound">
            <Columns>
                <asp:TemplateField>
                <ItemTemplate>
                        <a href="javascript:expandcollapse('div<%# Eval("pt_id") %>', 'one');">
                            <img id="imgdiv<%# Eval("pt_id") %>" alt="Click to show/hide Orders for Customer <%# Eval("pt_id") %>"  width="2px" border="0" src="plus.gif"  height="2px"/>
                        </a>
                    </ItemTemplate>
                
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="price id" SortExpression="pt_id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblptid" Text='<%# Eval("pt_id") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblptid" Text='<%# Eval("pt_id") %>' runat="server"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                <asp:TemplateField HeaderText="Price Type">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtptypeedit" runat="server" Text='<%# Eval("pt_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtptypeadd" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("pt_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="From Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="txteditfrom" runat="server" Text='<%# Eval("pt_from_date") %>'></asp:TextBox>
                        <cc1:CalendarExtender ID="txteditfrom_CalendarExtender" runat="server" 
                                     Enabled="True" TargetControlID="txteditfrom">
                                 </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtaddfrom" runat="server"></asp:TextBox>
                         <cc1:CalendarExtender ID="txtaddfrom_CalendarExtender" runat="server" 
                                     Enabled="True" TargetControlID="txtaddfrom">
                                 </cc1:CalendarExtender>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("pt_from_date") %>'></asp:Label>
                         
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="To Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="txteditto" runat="server" Text='<%# Eval("pt_to_date") %>'></asp:TextBox>
                         <cc1:CalendarExtender ID="txteditto_CalendarExtender" runat="server" 
                                     Enabled="True" TargetControlID="txteditto">
                                 </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtaddto" runat="server"></asp:TextBox>
                         <cc1:CalendarExtender ID="txtaddto_CalendarExtender" runat="server" 
                                     Enabled="True" TargetControlID="txtaddto">
                                 </cc1:CalendarExtender>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("pt_to_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <EditItemTemplate>
                        <asp:ImageButton ID="imgbtnupdate" runat="server" CommandName="Update" 
                            Height="20px" ImageUrl="~/Images/update.jpg" ToolTip="Update" Width="20px" />
                        &nbsp;
                        <asp:ImageButton ID="imgbtncancel" runat="server" CommandName="Cancel" 
                            Height="20px" ImageUrl="~/Images/Cancel.jpg" ToolTip="Cancel" Width="20px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtnedit" runat="server" CommandName="Edit" Height="20px" CommandArgument='<%# Eval("pt_id") %>' 
                            ImageUrl="~/Images/Edit.jpg" ToolTip="Edit" Width="20px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <FooterTemplate>
                       <%-- <asp:ImageButton ID="imgbtnadd" runat="server" CommandName="AddNew" Height="30px" 
                            ImageUrl="~/Images/AddNewitem.jpg" ToolTip="Add New Participant Type" 
                            Width="30px" />--%>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtndelete" runat="server" CommandName="Delete" 
                            Height="20px" ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Width="20px" />
                    </ItemTemplate>
                </asp:TemplateField>

               


                <asp:TemplateField>
                 <ItemTemplate>
                 <tr>
                            <td colspan="100%">
                                <div id="div<%# Eval("pt_id") %>" 
                                    style="display:none;position:relative;left:15px;OVERFLOW: auto;WIDTH:97%; font-size: small;" >

                                    <asp:GridView ID="GridView2" runat="server" DataKeyNames="pt_id" CssClass="mGrid"
                                        onrowcancelingedit="GridView1_RowCancelingEdit1" AutoGenerateColumns=false Font-Names="Verdana"
                                        onrowcommand="GridView1_RowCommand1" onrowdatabound="GridView1_RowDataBound1" BackColor="White" Width=100% Font-Size=X-Small
                                        onrowdeleting="GridView1_RowDeleting1" onrowediting="GridView1_RowEditing1" 
                                        onrowupdating="GridView1_RowUpdating1" BorderStyle=Double BorderColor="#0083C1">

                                        <RowStyle BackColor="Gainsboro" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <HeaderStyle BackColor="#0083C1" ForeColor="White"/>
                                        <FooterStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Participant id" SortExpression="pp_id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblppid" Text='<%# Eval("pp_id") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblppid" Text='<%# Eval("pp_id") %>' runat="server"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Participant Type" SortExpression="pp_name">
                                                <ItemTemplate> <asp:Label ID="lblppname" Text='<%# Eval("pp_name") %>' runat="server"></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtpname1" Text='<%# Eval("pp_name")%>' runat="server"></asp:TextBox>
                                                    <asp:DropDownList ID="ddleditpptype" runat="server">
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="ftrtxtpname" Text='' runat="server"></asp:TextBox>
                                                     <asp:DropDownList ID="ddlpname" runat="server">
                                                    </asp:DropDownList>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Individual price" SortExpression="rc_individual">
                                                <ItemTemplate> <asp:Label ID="lblppindvl" Text='<%# Eval("rc_individual") %>' runat="server"></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtindvl1" Text='<%# Eval("rc_individual")%>' runat="server"></asp:TextBox>
                                                    
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="ftrtxtindvl" Text='' runat="server"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftrtxtindvl_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Numbers" 
                                                        TargetControlID="ftrtxtindvl">
                                                    </cc1:FilteredTextBoxExtender>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Group Price" SortExpression="rc_group">
                                                <ItemTemplate><asp:Label ID="lblgrp" Text='<%# Eval("rc_group") %>' runat="server"></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtgrp1" Text='<%# Eval("rc_group")%>' runat="server"></asp:TextBox>
                                                   
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="ftrtxtgrp" Text='' runat="server"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftrtxtgrp_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="ftrtxtgrp">
                                                    </cc1:FilteredTextBoxExtender>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Guest Price" SortExpression="rc_guest">
                                                <ItemTemplate><asp:Label ID="lblguest" Text='<%# Eval("rc_guest") %>' runat="server"></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtguest1" Text='<%# Eval("rc_guest")%>' runat="server"></asp:TextBox>
                                                    
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="ftrtxtguest" Text='' runat="server"></asp:TextBox>
                                                     <cc1:FilteredTextBoxExtender ID="ftrtxtguest_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Numbers" 
                                                        TargetControlID="ftrtxtguest">
                                                    </cc1:FilteredTextBoxExtender>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Edit">
                    <EditItemTemplate>
                        <asp:ImageButton ID="imgbtnupdate1" runat="server" CommandName="Update" 
                            Height="20px" ImageUrl="~/Images/update.jpg" ToolTip="Update" Width="20px" />
                        &nbsp;
                        <asp:ImageButton ID="imgbtncancel1" runat="server" CommandName="Cancel" 
                            Height="20px" ImageUrl="~/Images/Cancel.jpg" ToolTip="Cancel" Width="20px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtnedit1" runat="server" CommandName="Edit" Height="20px" 
                            ImageUrl="~/Images/Edit.jpg" ToolTip="Edit" Width="20px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <FooterTemplate>
                        <asp:ImageButton ID="imgbtnadd1" runat="server" CommandName="AddNew" Height="30px" 
                            ImageUrl="~/Images/AddNewitem.jpg" ToolTip="Add New Participant Type" 
                            Width="30px" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtndelete1" runat="server" CommandName="Delete" 
                            Height="20px" ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Width="20px" />
                    </ItemTemplate>
                </asp:TemplateField>


                                            </Columns>



                                    </asp:GridView>


                                
                
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        </asp:Panel>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
    Text="Add New Price Type" />
    <br />
</asp:Content>

