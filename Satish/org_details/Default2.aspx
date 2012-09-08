<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
            color: #3399FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">

    <asp:Panel ID="Panel1" runat="server" Height="607px" Width="926px" 
        BackColor="#CCFF99">
        <span class="style1">
        <br />
        thank u ....your data sucessfully inserted!!!<br />
        <br />
        </span></asp:Panel>

    </form>

</asp:Content>

