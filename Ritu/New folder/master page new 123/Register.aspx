<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   <%-- <script src="javascript/Validation.js" type="text/javascript"></script>--%>
  <script type="text/javascript" language="javascript">

      function validationsregister() {

          var EmailId = document.getElementById("<%=txtMail.ClientID %>");

          if (document.getElementById("<%=txtMail.ClientID %>").value == "") 
          {
              alert("Email Id can not be blank");
              document.getElementById("<%=txtMail.ClientID %>").focus();
              return false;
          }

//          function validateEmail() {
              var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
              var emailid = document.getElementById("<%=txtMail.ClientID %>").value;
              var matchArray = emailid.match(emailPat);
              if (matchArray == null)
               {
                  alert("Your email address seems incorrect. Please try again.");
                  document.getElementById("<%=txtMail.ClientID %>").focus();
                  return false;
              }
//          }



      }

  
  
  </script>

    <style type="text/css">
        .style1
        {
            height: 290px;
            width: 805px;
        }
        .style2
        {
            height: 19px;
            text-align: left;
        }
        .style3
        {
            height: 18px;
        }
        .style4
        {
            height: 17px;
        }
        .style5
        {
            width: 98px;
        }
        .style6
        {
            width: 98px;
            height: 21px;
        }
        .style7
        {
            height: 21px;
        }
        .style8
        {
            height: 19px;
            text-align: left;
            width: 157px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server"  BackColor="#CCFF99" Height="294px">
<%--<table cellpadding="0" cellspacing="0" style="width: 920px" >
    <tr>
        <td  valign="top"  align="center">
            
                     
        
        </td>
    </tr>
</table>--%>
 <table class="style1">
            <tr>
                <td class="style5" align="center">
                    <asp:Label ID="lblRegister" runat="server" Text="Register" 
                        
                        
                        
                        style="font-weight: 700; text-decoration: underline; font-family: Tahoma; font-size: medium; color: #000000;"></asp:Label>
                </td>
                <td class="style3" colspan="2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3" colspan="2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3" colspan="2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td colspan="2" >
                    <asp:Label ID="lblEmailid" runat="server" Text="Email Id" 
                        style="font-family: Tahoma; font-size: 11pt; color: #000000;"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtMail" runat="server" Height="23px" Width="145px"></asp:TextBox>
                    &nbsp;&nbsp;
                    <asp:Button ID="btnRegister" runat="server" Height="27px" 
                        onclick="Button1_Click" OnClientClick="return validationsregister()" 
                        style="margin-left: 0px" Text="Create an account  " Width="125px" />
                </td>
                <td class="style7">
                    <%--<asp:RequiredFieldValidator ID="rfvEmailid" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Please enter your Id" 
                        Font-Italic="True" ForeColor="#CC0000" style="font-family: Georgia"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                   <%-- <asp:RegularExpressionValidator ID="revEmailid" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="#CC0000" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        style="font-family: Georgia"></asp:RegularExpressionValidator>--%>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    </td>
                <td class="style7" colspan="2">
                    </td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="lblUsermsg" runat="server" 
                        style="font-family: Georgia; color: #CC0000; font-style: italic;"></asp:Label>
                </td>
                <td class="style7">
                    &nbsp;</td>
                <td class="style7">
                    </td>
                <td class="style7">
                    </td>
                <td class="style7">
                    </td>
            </tr>
            <tr>
                <td class="style5">
                    </td>
                <td class="style9" colspan="2">
                    <asp:HyperLink ID="lnkAlreadyuser" runat="server" NavigateUrl="~/login.aspx" 
                        style="color: #000000">Already user? Login</asp:HyperLink>
                    </td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style11">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style9" colspan="2">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style2" colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td align="left" class="style8">
                    &nbsp;</td>
                <td align="left" class="style2">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3" colspan="2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3" colspan="2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3" colspan="2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    </td>
                <td colspan="2">
                    </td>
                <td>
                    </td>
                <td>
                    </td>
                <td>
                    </td>
                <td>
                    </td>
                <td>
                    </td>
                <td>
                    </td>
            </tr>
        </table>
 </asp:Panel> 



    <%-- <asp:Panel ID="Panel1"  runat="server" BorderStyle="Solid" Height="231px" 
        style="margin-left: 23px; font-family: Tahoma; font-size: medium;" 
        Width="755px">
        <table class="style1">
            <tr>
                <td class="style13" align="center">
                    <asp:Label ID="Label1" runat="server" Text="Register" 
                        style="font-weight: 700; text-decoration: underline"></asp:Label>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Label ID="Label2" runat="server" Text="Email Id"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtMail" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Please enter your Id" 
                        Font-Italic="True" ForeColor="Black"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="Black" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14">
                    </td>
                <td class="style9">
                    </td>
                <td class="style10">
                    </td>
                <td class="style11">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
            </tr>
            <tr>
                <td align="left" class="style2" colspan="3">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/login.aspx">Already user? Login</asp:HyperLink>
                </td>
                <td class="style7">
                    <asp:Button ID="Button1" runat="server" style="margin-left: 0px" 
                        Text="Register" Height="28px" Width="118px" onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>--%>



       <%-- <asp:Panel ID="Panel1"  runat="server" BorderStyle="Solid" Height="231px" 
        style="margin-left: 23px; font-family: Tahoma; font-size: medium;" 
        Width="755px">
        <table class="style1">
            <tr>
                <td class="style13" align="center">
                    <asp:Label ID="Label1" runat="server" Text="Register" 
                        style="font-weight: 700; text-decoration: underline"></asp:Label>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Label ID="Label2" runat="server" Text="Email Id"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtMail" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Please enter your Id" 
                        Font-Italic="True" ForeColor="Black"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="Invalid Expression" 
                        Font-Italic="True" ForeColor="Black" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14">
                    </td>
                <td class="style9">
                    </td>
                <td class="style10">
                    </td>
                <td class="style11">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
                <td class="style12">
                    </td>
            </tr>
            <tr>
                <td align="left" class="style2" colspan="3">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/login.aspx">Already user? Login</asp:HyperLink>
                </td>
                <td class="style7">
                    <asp:Button ID="Button1" runat="server" style="margin-left: 0px" 
                        Text="Register" Height="28px" Width="118px" onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>--%>



</asp:Content>

