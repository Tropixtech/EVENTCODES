<%@ Page Title="" Language="C#" MasterPageFile="~/EventAdminMaster1.master" AutoEventWireup="true" CodeFile="regprice.aspx.cs" Inherits="regprice" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link rel="stylesheet" type="text/css" href="css/style.css" />
    <style type="text/css">
       
  
    </style>
    <script language=javascript type="text/javascript">
        var dt1;
        var one_day = 1000 * 60 * 60 * 24;
        var today = new Date().setHours(0, 0, 0, 0);
        var fromdate = document.getElementById('ContentPlaceHolder1_txtfrom').value;

        function CheckDate(sender, args) {
            dt1 = sender._selectedDate;
            var newdt1 = dt1.setHours(0, 0, 0, 0);

            if (newdt1 < today) {
                alert("Date can't be less than today");
                document.getElementById('ContentPlaceHolder1_txtfrom').value = "";
//                document.getElementById('ContentPlaceHolder1_txttodate').value = "";
            }
        }

        function CompareDates() {
            var str1 = document.getElementById("ContentPlaceHolder1_txtfrom").value;
            var str2 = document.getElementById("ContentPlaceHolder1_txttodate").value;
            var dt1 = parseInt(str1.substring(0, 2), 10);
            var mon1 = parseInt(str1.substring(3, 5), 10);
            var yr1 = parseInt(str1.substring(6, 10), 10);
            var dt2 = parseInt(str2.substring(0, 2), 10);
            var mon2 = parseInt(str2.substring(3, 5), 10);
            var yr2 = parseInt(str2.substring(6, 10), 10);
            var date1 = new Date(yr1, mon1, dt1);
            var date2 = new Date(yr2, mon2, dt2);
            if (date2 < date1) {
                alert("To date cannot be less than from date");
                document.getElementById('ContentPlaceHolder1_txttodate').value = "";
//                return false;
            }
//            else {
//                alert("Submitting ...");
//                document.form1.submit();
//            }
        }


        function validateAll() {

                    if (document.getElementById('ContentPlaceHolder1_txtpricetype').value == "") {
                alert("Price Type cannot be blank");
                        document.getElementById('ContentPlaceHolder1_txtpricetype').focus();
                return false;
            }

                    if (document.getElementById('ContentPlaceHolder1_txtfrom').value == "") {
                alert("From Date cannot be blank");
                        document.getElementById('ContentPlaceHolder1_txtfrom').focus();
                return false;
            }

            if (document.getElementById('ContentPlaceHolder1_txttodate').value == "") {
                alert("To Date cannot be blank");
                document.getElementById('ContentPlaceHolder1_txttodate').focus();
                return false;
            }
            if (document.getElementById('ContentPlaceHolder1_GridView1_ftrtxtindvl').value == "") {
                alert("Individual Price cannot be blank");
                document.getElementById('ContentPlaceHolder1_GridView1_ftrtxtindvl').focus();
                return false;
            }
            if (document.getElementById('ContentPlaceHolder1_GridView1_ftrtxtgrp').value == "") {
                alert("Group Price cannot be blank");
                document.getElementById('ContentPlaceHolder1_GridView1_ftrtxtgrp').focus();
                return false;
            }
            if (document.getElementById('ContentPlaceHolder1_GridView1_ftrtxtguest').value == "") {
                alert("Guest Price cannot be blank");
                document.getElementById('ContentPlaceHolder1_GridView1_ftrtxtguest').focus();
                return false;
            }

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <asp:Panel ID="Panel1" runat="server" Width="739px">
        <table style="width:100%;" ID="table1">
            <tr>
                <td class="style8" colspan="2">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    <asp:Label ID="Label2" runat="server" 
                        style="font-family: Tahoma; font-size: small;" Text="Price Type"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtpricetype" runat="server" Height="25px" Width="128px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    <asp:Label ID="Label3" runat="server" Text="From Date" 
                        style="font-family: Tahoma"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtfrom" runat="server" Height="25px" Width="128px"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtfrom_CalendarExtender" runat="server" OnClientDateSelectionChanged="CheckDate"
                        Enabled="True" TargetControlID="txtfrom">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    <asp:Label ID="Label4" runat="server" Text="To Date" 
                        style="font-family: Tahoma"></asp:Label>
                </td>
                <td style="font-family: Tahoma">
                    <asp:TextBox ID="txttodate" runat="server" Height="25px" Width="128px"></asp:TextBox>
                    <cc1:CalendarExtender ID="txttodate_CalendarExtender" runat="server"  OnClientDateSelectionChanged="CompareDates"
                        Enabled="True" TargetControlID="txttodate">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8" colspan="2">
                 <asp:Panel ID="Panel2" runat="server" ScrollBars="Both" >
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter=True
                        Width="730px" onrowcommand="GridView1_RowCommand" CssClass="mGrid"
                        onrowdatabound="GridView1_RowDataBound" 
                        onrowcancelingedit="GridView1_RowCancelingEdit" 
                        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                        onrowupdating="GridView1_RowUpdating">
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
                                                    <asp:TextBox ID="txtpname" Text='<%# Eval("pp_name")%>' runat="server" 
                                                        Height="25px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="ftrtxtpname" Text='' runat="server" Height="25px"></asp:TextBox>
                                                    <asp:DropDownList ID="ddlpname" runat="server" Height="25px" Width="100px">
                                                    </asp:DropDownList>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Individual price" SortExpression="rc_individual">
                                                <ItemTemplate><%# Eval("rc_individual")%></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtindvl" Text='<%# Eval("rc_individual")%>' runat="server" 
                                                        Height="25px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="txtindvl_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtindvl">
                                                    </cc1:FilteredTextBoxExtender>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="ftrtxtindvl" Text='' runat="server" Height="25px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftrtxtindvl_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Numbers" 
                                                        TargetControlID="ftrtxtindvl">
                                                    </cc1:FilteredTextBoxExtender>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Group Price" SortExpression="rc_group">
                                                <ItemTemplate><%# Eval("rc_group")%></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtgrp" Text='<%# Eval("rc_group")%>' runat="server" 
                                                        Height="25px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="txtgrp_FilteredTextBoxExtender" runat="server" 
                                                        Enabled="True" FilterType="Numbers" TargetControlID="txtgrp">
                                                    </cc1:FilteredTextBoxExtender>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="ftrtxtgrp" Text='' runat="server" Height="25px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftrtxtgrp_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="ftrtxtgrp">
                                                    </cc1:FilteredTextBoxExtender>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Guest Price" SortExpression="rc_guest">
                                                <ItemTemplate><%# Eval("rc_guest")%></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtguest" Text='<%# Eval("rc_guest")%>' runat="server" 
                                                        Height="25px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="txtguest_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtguest">
                                                    </cc1:FilteredTextBoxExtender>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="ftrtxtguest" Text='' runat="server" Height="25px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftrtxtguest_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Numbers" 
                                                        TargetControlID="ftrtxtguest">
                                                    </cc1:FilteredTextBoxExtender>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            
			                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
			                                <asp:TemplateField HeaderText="Delete">
                                                 <ItemTemplate>
                                                    <asp:LinkButton ID="linkDeleteCust" CommandName="Delete" runat="server">Delete</asp:LinkButton>
                                                 </ItemTemplate>
                                                 <FooterTemplate>
                                                    <asp:LinkButton ID="linkAddOrder" CommandName="AddOrder" runat="server" OnClientClick="return validateAll()">Add</asp:LinkButton>
                                                 </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                    </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                        style="font-family: Tahoma" onclick="Button1_Click" Height="28px" 
                        Width="100px" />
                    &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" style="font-family: Tahoma" 
                        Text="Cancel" onclick="Button2_Click" Height="28px" Width="100px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnupdate" runat="server" Height="25px" onclick="Button3_Click" 
                        Text="Update" Width="100px" />
                </td>
            </tr>
        </table>
    </asp:Panel>



</asp:Content>

