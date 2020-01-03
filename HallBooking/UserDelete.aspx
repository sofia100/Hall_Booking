<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Approve.aspx.cs" Inherits="HallBooking.UserDelete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DElete Booking</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>

</head>
<body>
    <form id="form1" runat="server" style="text-align:center">
        <div>
         <asp:Menu ID="Menu1" class="menubar" runat="server" Orientation="Horizontal" CssClass="menu">
    <Items>
        
        <asp:MenuItem Text="Request |" NavigateUrl="Request.aspx" />
        <asp:MenuItem Text="Logout |"  NavigateUrl="Login.aspx" /> 
        <asp:MenuItem Text="Report" NavigateUrl="Report.aspx" />
    </Items>
</asp:Menu>

                    <asp:GridView ID="GridView1"  runat="server" AllowPaging="True"  AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="RequestId" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="RequestId"  HeaderText="RequestId" ReadOnly="True" SortExpression="RequestId" />
                <asp:BoundField DataField="RequestedDate"  HeaderText="RequestedDate" SortExpression="RequestedDate" />
                <asp:BoundField DataField="EmployeeId" HeaderText="EmployeeId"  SortExpression="EmployeeId" />
                <asp:BoundField DataField="BookedDate" HeaderText="BookedDate" SortExpression="BookedDate"  />
                <asp:BoundField DataField="Hall" HeaderText="Hall" SortExpression="Hall" />
                <asp:BoundField DataField="BookStatus" HeaderText="BookStatus" SortExpression="BookStatus" />
                <asp:BoundField DataField="LastUpdatedOn" HeaderText="LastUpdatedOn" SortExpression="LastUpdatedOn"  />
                <asp:BoundField DataField="EntryBy" HeaderText="EntryBy" SortExpression="EntryBy" />
                <asp:CommandField DeleteText="delete" ShowDeleteButton="true" />
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:BookConnectionString %>"
            OnSelecting="SqlDataSource1_Selecting"
             DeleteCommand="update HallBooking set BookStatus= 'deleted', LastUpdatedOn=GETDATE() where RequestId=@RequestId;"
            SelectCommand="SELECT [RequestId], [RequestedDate], [EmployeeId], [BookedDate], [Hall], [BookStatus], [LastUpdatedOn], [EntryBy] FROM [HallBooking] WHERE ([EmployeeId] = @EmployeeId)">
            <SelectParameters>
                <asp:SessionParameter Name="EmployeeId" SessionField="username" Type="Int32" DefaultValue="12344" />
            </SelectParameters>
            </asp:SqlDataSource>
            


        </div>
    </form>
</body>
</html>
