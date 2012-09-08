<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Button ID="Button1" runat="server" Text="Button" />
<cc1:AnimationExtender ID="Button1_AnimationExtender" runat="server" Enabled="True" TargetControlID="Button1">


<Animations>
                             <OnMouseOver>
                                    <Sequence>
                                        <Color PropertyKey="background" StartVAlue="#D6D6D6" EndValue="#313131" ></Color>
                                    </Sequence>                
                                </OnMouseOver>
                                
                                 <OnMouseOut>
                                    <Sequence>
                                        <Color PropertyKey="background" StartVAlue="#993300" EndValue="#E9E8E8" ></Color>
                                    </Sequence>                
                                </OnMouseOut>            
                </Animations> 

</cc1:AnimationExtender>
</form>
</asp:Content>

