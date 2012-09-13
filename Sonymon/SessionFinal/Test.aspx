<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="pr_id" HeaderText="pr_id" />
                <asp:BoundField DataField="pr_name" HeaderText="pr_name" />
                <asp:BoundField DataField="pr_ss_id" HeaderText="pr_ss_id" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="pr_id" HeaderText="pr_id" ReadOnly="True" 
                SortExpression="pr_id" />
            <asp:BoundField DataField="pr_ss_id" HeaderText="pr_ss_id" 
                SortExpression="pr_ss_id" />
            <asp:BoundField DataField="pr_ev_id" HeaderText="pr_ev_id" 
                SortExpression="pr_ev_id" />
            <asp:BoundField DataField="pr_org_id" HeaderText="pr_org_id" 
                SortExpression="pr_org_id" />
            <asp:BoundField DataField="pr_name" HeaderText="pr_name" 
                SortExpression="pr_name" />
            <asp:BoundField DataField="pr_topic" HeaderText="pr_topic" 
                SortExpression="pr_topic" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
        ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [pr_id], [pr_ss_id], [pr_ev_id], [pr_org_id], [pr_name], [pr_topic] FROM [presenter]">
    </asp:SqlDataSource>
    </form>
</body>
</html>
