<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="HallBooking.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request Page</title>
    
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
   
    <script>
        $(function () {
            $("#txtsdate").datepicker({
                dateFormat: 'dd/mm/yy',
                defaultDate: "+1w",
                changeMonth: true,
                onClose: function (selectedDate) {
                    $("#txtedate").datepicker("option", "minDate", selectedDate);
                }
            });

           /* $("#txtedate").datepicker({
                dateFormat: 'dd/mm/yyyy',
                defaultDate: "+1w",
                changeMonth: true,
                onClose: function (selectedDate) {
                    $("#txtsdate").datepicker("option", "maxDate", selectedDate);
                }

            });*/
        })
    </script>
</head>
<body>
     
    <form id="form1" style="text-align:center" runat="server">
  
        <asp:Menu ID="Menu1" class="menubar" runat="server" Orientation="Horizontal" CssClass="menu">
    <Items>
        <asp:MenuItem Text="Report     |" NavigateUrl="Report.aspx" />
        
        
        <asp:MenuItem Text="Delete     |" Target="delete()"  NavigateUrl="UserDelete.aspx" /> 
        <asp:MenuItem Text="Logout     "  NavigateUrl="Login.aspx" /> 
    </Items>
</asp:Menu>

    <h2 style="text-align:center"> REQUEST FORM</h2>
            <div class="body">
          <h3 class="text">  HALL :</h3>

                <asp:RadioButtonList ID="hall_id" runat="server" RepeatLayout="Flow">
    <asp:ListItem Value="utsav">UTSAV</asp:ListItem>
    <asp:ListItem Value="umang">UMANG</asp:ListItem>
</asp:RadioButtonList>


              <br />
           <h3 class="text"> DATE:</h3>
                
            <asp:TextBox ID="txtsdate" runat="server"></asp:TextBox>
            <br />            <br />            <br />            <br />
            <br />            <br />            <br />            <br />
            <br />            <br />            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Check availiability" />
            <asp:Button ID="Button2" runat="server" OnClientClick="aspnetForm.target ='_blank';"  OnClick="DynamicButton_Click" Text="Send E-mail" Visible="false" />
        </div>
    </form>
</body>
</html>
