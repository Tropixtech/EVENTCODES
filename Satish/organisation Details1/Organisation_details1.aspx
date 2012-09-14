<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Organisation_details1.aspx.cs" Inherits="Organisation_details1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="countries.js" type="text/javascript"></script>
  <style type="text/css">
        .style1
        {
            width: 623px;
        }
        .style2
        {
            width: 897px;
            height: 70px;
            font-family: Tahoma;
            font-size: xx-large;
        }
        .style5
        {
            width: 174px;
        }
        .style6
        {
            width: 204px;
        }
        .style7
        {
            width: 182px;
        }
      #country
      {
          height: 23px;
          width: 145px;
      }
      .style8
      {
          width: 44px;
          font-family: Tahoma;
      }
      .style9
      {
          color: #CC0000;
      }
      .style10
      {
          width: 182px;
          color: #CC0000;
      }
      #form1
      {
          height: 562px;
          width: 920px;
      }
      .style11
      {
          font-family: Tahoma;
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
<asp:Panel ID="Panel1" runat="server" Height="557px" Width="921px" BackColorr="#CCFF99"
        BorderColor="#CCFF99" BackColor="#CCFF99">
                <table>
            <tr>
                <td align="center" class="style2">
                    Organisation Details</td>
            </tr>
        </table>
        <br />
        <table align="center" cellspacing="1" class="style1">
            <tr>
                <td class="style25">
                    </td>
                <td class="style11" colspan="2">
                    Organisation Name</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label1" runat="server" CssClass="style22" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Organisation Type</td>
                <td class="style5">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="145px">
                    <asp:ListItem>Select type</asp:ListItem>
                        <asp:ListItem>Bank</asp:ListItem>
                        <asp:ListItem>cooperatives</asp:ListItem>
                        <asp:ListItem>corporation</asp:ListItem>
                        <asp:ListItem>Foundation &amp; Charities</asp:ListItem>
                        <asp:ListItem>Government</asp:ListItem>
                        <asp:ListItem>International organizations</asp:ListItem>
                        <asp:ListItem>Partnerships</asp:ListItem>
                        <asp:ListItem>Private Limited</asp:ListItem>
                        <asp:ListItem>Public Limited</asp:ListItem>
                        <asp:ListItem>Universities</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style7">
                    <asp:Label ID="Label9" runat="server" Text="Label" CssClass="style9"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Industry</td>
                <td class="style21" colspan="2">
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="23px" Width="300px">
                    <asp:ListItem>Select industry</asp:ListItem>
                        <asp:ListItem>Accounting, Auditors, Tax & Bookkeepers</asp:ListItem>
                        <asp:ListItem>Advertising & Public Relations</asp:ListItem>
                        <asp:ListItem>Agriculture Products & Services</asp:ListItem>
                        <asp:ListItem>Airlines, Aviation Services / Supplies</asp:ListItem>
                        <asp:ListItem>Apparel / Accessories / Textiles</asp:ListItem>
                        <asp:ListItem>Architectural, Engineering & Technical</asp:ListItem>
                        <asp:ListItem>Banking & Financial Services</asp:ListItem>
                        <asp:ListItem>Beverages, Alcoholic & Non-alcoholic</asp:ListItem>
                        <asp:ListItem>Building Systems / Materials / Fixtures</asp:ListItem>
                        <asp:ListItem>Business Consultancy & Advisory</asp:ListItem>
                        <asp:ListItem>Computer & IT Products & Services</asp:ListItem>
                        <asp:ListItem>Construction General</asp:ListItem>
                        <asp:ListItem>Education & Training</asp:ListItem>
                        <asp:ListItem>Entertainment & Recreation</asp:ListItem>
                        <asp:ListItem>Environmental Products & Services</asp:ListItem>
                        <asp:ListItem>Executive Search & Personnel Recruitment</asp:ListItem>                        
                        <asp:ListItem> Farm Equipment</asp:ListItem>
                        <asp:ListItem>Food Manufacturing / Distribution / Services</asp:ListItem>
                        <asp:ListItem>Freight Forwarders / Couriers</asp:ListItem>
                        <asp:ListItem>Gases, Natural & Processed</asp:ListItem>
                        <asp:ListItem>Hospitals</asp:ListItem>
                        <asp:ListItem>Hotels / Restaurants / Caterers</asp:ListItem>
                        <asp:ListItem>Industrial Equipment</asp:ListItem>
                        <asp:ListItem>Information & Communications Technology</asp:ListItem>
                        <asp:ListItem>Inspection, Safety & Security</asp:ListItem>
                        <asp:ListItem>Insurance</asp:ListItem>
                        <asp:ListItem>Manufacturing - Automotive</asp:ListItem>
                        <asp:ListItem>Manufacturing - Consumer</asp:ListItem>
                        <asp:ListItem>Manufacturing - Electronics</asp:ListItem>
                        <asp:ListItem>Manufacturing - Industrial</asp:ListItem>                        
                        <asp:ListItem>Manufacturing -Chemical Elements & Allied Products</asp:ListItem>
                        <asp:ListItem>Marketing & Communications</asp:ListItem>
                        <asp:ListItem>Outplacement Services</asp:ListItem>
                        <asp:ListItem>Petroleum & Petroleum Products</asp:ListItem>
                        <asp:ListItem>Pharmaceutical & Medicinal Products</asp:ListItem>
                        <asp:ListItem>Power & Electrical</asp:ListItem>
                        <asp:ListItem>Printing & Publishing</asp:ListItem>
                        <asp:ListItem>Property & Real Estate Services</asp:ListItem>
                        <asp:ListItem>Retail Consumer Products</asp:ListItem>
                        <asp:ListItem>Schools</asp:ListItem>
                        <asp:ListItem>Scientific & Medical Instruments</asp:ListItem>
                        <asp:ListItem>Security, Investigative Services & Products</asp:ListItem>
                        <asp:ListItem>Sourcing, Trading & Buying</asp:ListItem>
                        <asp:ListItem>Transport Vehicles & Parts</asp:ListItem>
                        <asp:ListItem>Transportation & Logistics</asp:ListItem>
                        <asp:ListItem>Travel & Tourism</asp:ListItem>
                        <asp:ListItem>Valuation & Disposal</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label10" runat="server" style="color: #CC0000" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Country</td>
                <td class="style5">
                <%--country drop--%>
                   <%-- <select id="country" name="country" 
                        onchange="print_state('state',this.selectedIndex);">
                    </select>--%>
                   
                    <asp:DropDownList ID="DropDownList3" runat="server" Height="23px" onchange="print_state(this.selectedIndex);" Width="145px">
                    </asp:DropDownList>
                   <script language="javascript" type="text/jscript">

                       print_country("DropDownList3");
                                         </script>
                </td>
                <td class="style7">
              
                   

                </td>
            </tr>
            <tr>
                <td class="style25">
                    </td>
                <td class="style11" colspan="2">
                    State</td>
                <td class="style5">
                    <asp:DropDownList ID="DropDownList4" runat="server" Height="23px" Width="145px">
                    </asp:DropDownList>
                </td>
                <td class="style7">
              
                    </td>
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    City</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox7" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label7" runat="server" CssClass="style28" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11">
                    Address</td>
                <td class="style8">
                    Line 1:</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox2" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label2" runat="server" CssClass="style28" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
                <td class="style8">
                    Line2:</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox3" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label3" runat="server" CssClass="style28" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Zip-code</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox4" runat="server" Height="23px" Width="145px" 
                        MaxLength="6"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label4" runat="server" CssClass="style22" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="*enter a valid zipcode" 
                        ValidationExpression="^([1-9])([0-9]){5}$" CssClass="style9"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style14">
                    </td>
                <td class="style11" colspan="2">
                    Phone No.</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox5" runat="server" Height="23px" Width="145px" 
                        MaxLength="10"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label5" runat="server" CssClass="style22" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="*enter a valid phone no." 
                        ValidationExpression="^([7-9]{1})([0-9]{9})$" CssClass="style9"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Website</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox6" runat="server" Height="23px" Width="145px">http://www.</asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label6" runat="server" CssClass="style28" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style6" colspan="2">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style6" align="right" colspan="2">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" 
                        Height="28px" Width="118px" />
                </td>
                <td class="style5">
                     
                    
                     
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Reset" 
                        Height="28px" Width="118px" />
                     
                    
                     
                </td>
                <td class="style7">
                    <asp:Label ID="Label8" runat="server" Text="Label" style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style6" colspan="2">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
            </tr>
        </table>
                </asp:Panel>
                </form>
</asp:Content>

