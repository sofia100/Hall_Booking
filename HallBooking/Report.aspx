<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="HallBooking.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report</title>
    
    <link rel="stylesheet" type="text/css" href="style.css"/>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Menu ID="Menu1" class="menubar" runat="server" Orientation="Horizontal" CssClass="menu">
    <Items>
        <asp:MenuItem Text="Login"  NavigateUrl="Login.aspx" /> 
        <asp:MenuItem Text="Report" NavigateUrl="Report.aspx" />
    </Items>
                 </asp:Menu>
        </div>
        <h3 class="text" style="color:#049738">Booking Report</h3>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="RequestId" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="RequestId" HeaderText="RequestId" ReadOnly="True" SortExpression="RequestId" />
                <asp:BoundField DataField="RequestedDate" HeaderText="RequestedDate" SortExpression="RequestedDate" />
                <asp:BoundField DataField="EmployeeId" HeaderText="EmployeeId" SortExpression="EmployeeId" />
                <asp:BoundField DataField="Hall" HeaderText="Hall" SortExpression="Hall" />
                <asp:BoundField DataField="BookedDate" HeaderText="BookedDate" SortExpression="BookedDate" />
                <asp:BoundField DataField="BookStatus" HeaderText="BookStatus" SortExpression="BookStatus" />
                <asp:BoundField DataField="LastUpdatedOn" HeaderText="LastUpdatedOn" SortExpression="LastUpdatedOn" />
                <asp:BoundField DataField="EntryBy" HeaderText="EntryBy" SortExpression="EntryBy" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [RequestId], [RequestedDate], [EmployeeId], [Hall], [BookedDate], [BookStatus], [LastUpdatedOn], [EntryBy] FROM [HallBooking] ORDER BY [RequestedDate]"></asp:SqlDataSource>
    </form>
</body>
</html>
