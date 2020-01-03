<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Approve.aspx.cs" Inherits="HallBooking.Approve" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Approver's Page</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>

</head>
<body>
    <form id="form1" runat="server" style="text-align:center">
        <div>
         <asp:Menu ID="Menu1" class="menubar" runat="server" Orientation="Horizontal" CssClass="menu">
    <Items>
         
        <asp:MenuItem Text="Report |" NavigateUrl="Report.aspx" />
        <asp:MenuItem Text="Logout"  NavigateUrl="Login.aspx" />
    </Items>
</asp:Menu>

                    <asp:GridView ID="GridView1"  runat="server" AllowPaging="True"  AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="RequestId" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="RequestId"  HeaderText="RequestId" ReadOnly="True" SortExpression="RequestId" />
                <asp:BoundField DataField="BookedDate" HeaderText="Booked on Date" SortExpression="BookedDate" readonly="true" />
                <asp:BoundField DataField="RequestedDate" readonly="true"  HeaderText="Requested on Date" SortExpression="RequestedDate" />
                <asp:BoundField DataField="EmployeeId" HeaderText="EmployeeId" readonly="true"  SortExpression="EmployeeId" />
                <asp:BoundField DataField="Hall" HeaderText="Community Hall" SortExpression="Hall" readonly="true"  />
                <asp:BoundField DataField="BookStatus" HeaderText="Booking Status" SortExpression="BookStatus" />
                <asp:BoundField DataField="LastUpdatedOn" HeaderText="Last Updated On" SortExpression="LastUpdatedOn" readonly="true"  />
                <asp:BoundField DataField="EntryBy" HeaderText="Entry By" SortExpression="EntryBy" readonly="true" />
               <asp:CommandField ButtonType="Button"  ShowDeleteButton="true" DeleteText="cancel" />
                <asp:CommandField  ButtonType="Button"  EditText="Approve" UpdateText="Save" ShowCancelButton="false"   ShowEditButton ="true" />
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
             InsertCommand="update HallBooking set BookStatus= 'approved', LastUpdatedOn=GETDATE() where RequestId=@RequestId;"
            SelectCommand="SELECT [RequestId], [BookedDate], [RequestedDate], [EmployeeId], [Hall], [BookStatus], [LastUpdatedOn], [EntryBy] FROM [HallBooking] where [BookStatus] != 'deleted' ORDER BY [RequestedDate]"
             DeleteCommand="update HallBooking set BookStatus= 'cancelled', LastUpdatedOn=GETDATE() where RequestId=@RequestId;"
            UpdateCommand="update HallBooking set BookStatus= 'approved', LastUpdatedOn=GETDATE() where RequestId=@RequestId;"></asp:SqlDataSource>
            


        </div>
    </form>
</body>
</html>
