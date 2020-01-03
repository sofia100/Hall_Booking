<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HallBooking.request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login page</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body  class="body">

   

    <form id="form1" runat="server" style="text-align:center">
        
        <asp:Menu ID="Menu1" class="menubar" runat="server" Orientation="Horizontal" CssClass="menu">
    <Items>
        <asp:MenuItem Text="Login |"  NavigateUrl="Login.aspx" /> 
        <asp:MenuItem Text="Report" NavigateUrl="Report.aspx" />
    </Items>
</asp:Menu>
                    
        <h1 class="text">IOCL HALL BOOKING</h1>
       <h2 class="text"> LOGIN PAGE
           </h2>
         <div >
            <br />
            <div class="box" style="align-self:center; padding: 20px;">
              <div class="text">  UserName :</div>
                <asp:textbox ID="userid" runat="server" />
                <br />
                <br />
               <div class="text">Password&nbsp; :</div>
                <asp:textbox id="password"  TextMode="Password" runat ="server" ></asp:textbox>
                <br />
                <br />
                <br />
                &nbsp;&nbsp;
             <asp:Button OnClick="Unnamed_Click" ID="loginUser" Text="Login As User" runat="server" />
             <asp:Button OnClick="Unnamed_Click2" ID="Button1" Text="Login As Approver" runat="server" />
     
</div>
        <br />
        </div>
        <asp:Image id="img" runat="server" imageurl="~/ioclpdp.jpg" />
    </form>
    
</body>
</html>
