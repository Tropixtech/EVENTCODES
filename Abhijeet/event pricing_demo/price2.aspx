<%@ Page Language="C#" AutoEventWireup="true" CodeFile="price2.aspx.cs" Inherits="price2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

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

//         var dt1;
//        var one_day = 1000 * 60 * 60 * 24;
//        var today = new Date().setHours(0, 0, 0, 0);


//        function CheckDate(sender, args) 
//        {
//            dt1 = sender._selectedDate;
//            var newdt1 = dt1.setHours(0, 0, 0, 0);

//            if (newdt1 < today)
//             {
//                alert("Date can't be less than today");
//                document.getElementById('txtfromdate').value = "";
//            }
//       } 

    </script>

    <title></title>
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 184px;
        }
        .style3
        {
            width: 84px;
        }
        .style4
        {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   
    
   <%-- DataSourceID="SqlDataSource1" --%>

        <asp:GridView ID="GridView1" AllowPaging="True" BackColor="#F1F1F1" 
            AutoGenerateColumns=False  DataKeyNames="pt_id" DataSourceID="" 
            style="Z-INDEX: 101;" 
            ShowFooter=True Font-Size=Small
            Font-Names="Verdana" runat="server" GridLines=None OnRowDataBound="GridView1_RowDataBound" 
            OnRowCommand = "GridView1_RowCommand" 
            OnRowUpdating = "GridView1_RowUpdating" BorderStyle=Outset
            OnRowDeleting = "GridView1_RowDeleting" OnRowDeleted = "GridView1_RowDeleted"
            OnRowUpdated = "GridView1_RowUpdated" AllowSorting=True Width="897px" 
        Height="222px">
            <RowStyle BackColor="Gainsboro" />
            <AlternatingRowStyle BackColor="White" />
            <HeaderStyle BackColor="#0083C1" ForeColor="White"/>
            <FooterStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="javascript:expandcollapse('div<%# Eval("pt_id") %>', 'one');">
                            <img id="imgdiv<%# Eval("pt_id") %>" alt="Click to show/hide Orders for Customer <%# Eval("pt_id") %>"  width="9px" border="0" src="plus.gif"/>
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
                <asp:TemplateField HeaderText="Price Type" SortExpression="pt_name">
                    <ItemTemplate><%# Eval("pt_name")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtptype" Text='<%# Eval("pt_name") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtptype" Text='' runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="From Date" SortExpression="pt_from_date">
                    <ItemTemplate><%# Eval("pt_from_date")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtfromdate" Text='<%# Eval("pt_from_date") %>' runat="server"></asp:TextBox>
                         <cc1:CalendarExtender ID="txtfromdate_CalendarExtender" runat="server"  OnClientDateSelectionChanged ="CheckDate"
                            Enabled="True" TargetControlID="txtfromdate" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtfromdate" Text='' runat="server"></asp:TextBox>
                         <cc1:CalendarExtender ID="txtfromdate_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="txtfromdate" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="To Date" SortExpression="pt_to_date">
                    <ItemTemplate><%# Eval("pt_to_date")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txttodate" Text='<%# Eval("pt_to_date") %>' runat="server"></asp:TextBox>
                         <cc1:CalendarExtender ID="txttodate_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="txttodate" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txttodate" Text='' runat="server"></asp:TextBox>
                         <cc1:CalendarExtender ID="txttodate_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="txttodate" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                    </FooterTemplate>
                </asp:TemplateField>
               
			    <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
			    <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="linkDeleteCust" CommandName="Delete" runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="linkAddCust" CommandName="AddCustomer" runat="server">Add</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
			    
			    <asp:TemplateField>
			        <ItemTemplate>
			            <tr>
                        <%--OnSorting = "GridView2_Sorting"--%>
                            <td colspan="100%">
                                <div id="div<%# Eval("pt_id") %>" style="display:none;position:relative;left:15px;OVERFLOW: auto;WIDTH:97%" >
                                    <asp:GridView ID="GridView2" AllowPaging="True" AllowSorting="true" BackColor="White" Width=100% Font-Size=X-Small
                                        AutoGenerateColumns=false Font-Names="Verdana" runat="server" DataKeyNames="pt_id" ShowFooter=true
                                        OnPageIndexChanging="GridView2_PageIndexChanging" OnRowUpdating = "GridView2_RowUpdating"
                                        OnRowCommand = "GridView2_RowCommand" OnRowEditing = "GridView2_RowEditing" GridLines=None
                                        OnRowUpdated = "GridView2_RowUpdated" OnRowCancelingEdit = "GridView2_CancelingEdit" OnRowDataBound = "GridView2_RowDataBound"
                                        OnRowDeleting = "GridView2_RowDeleting" OnRowDeleted = "GridView2_RowDeleted" 
                                        BorderStyle=Double BorderColor="#0083C1">
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
                                                <ItemTemplate><%# Eval("pp_name")%></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtpname" Text='<%# Eval("pp_name")%>' runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtpname" Text='' runat="server"></asp:TextBox>
                                                    <asp:DropDownList ID="ddlpname" runat="server">
                                                    </asp:DropDownList>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Individual price" SortExpression="rc_individual">
                                                <ItemTemplate><%# Eval("rc_individual")%></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtindvl" Text='<%# Eval("rc_individual")%>' runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtindvl" Text='' runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="grp Price" SortExpression="rc_group">
                                                <ItemTemplate><%# Eval("rc_group")%></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtgrp" Text='<%# Eval("rc_group")%>' runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtgrp" Text='' runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Guest Price" SortExpression="rc_guest">
                                                <ItemTemplate><%# Eval("rc_guest")%></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtguest" Text='<%# Eval("rc_guest")%>' runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtguest" Text='' runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            
			                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
			                                <asp:TemplateField HeaderText="Delete">
                                                 <ItemTemplate>
                                                    <asp:LinkButton ID="linkDeleteCust" CommandName="Delete" runat="server">Delete</asp:LinkButton>
                                                 </ItemTemplate>
                                                 <FooterTemplate>
                                                    <asp:LinkButton ID="linkAddOrder" CommandName="AddOrder" runat="server">Add</asp:LinkButton>
                                                 </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                   </asp:GridView>
                                </div>
                             </td>
                        </tr>
			        </ItemTemplate>			       
			    </asp:TemplateField>			    
			</Columns>
        </asp:GridView>
    
         <br />
   <%-- <asp:Button ID="Button1" runat="server" Text="Add New price Type" 
        onclick="Button1_Click" />--%>
    
         <asp:ScriptManager ID="ScriptManager1" runat="server">
         </asp:ScriptManager>
       
       
        <br />
        
    
    <br />
       
    
               
    </form>

</body>
</html>
