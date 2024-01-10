<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gebuu.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../Styles/LoginPage.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            font-weight: normal;
            height: 36px;
            width: 320px;
        }
        .auto-style2 {
            font-weight: normal;
            height: 36px;
            width: 320px;
            font-size: medium;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <center>
            <div class="container">
                <div class="popup">
                    <img src="../Resources/Gebuu%20Veterinary%20Clinic.png" />
                    <h2>Gebuu Veterinary Clinic</h2>
                    <h2 class="auto-style2">Parit Raja Branch</h2>
                    <h2 class="auto-style1"><strong>Login</strong></h2>
                    <br />
                    <div class="form-group">
                        <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername" Text="Username"></asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfID" runat="server"
                            ControlToValidate="txtUsername"
                            InitialValue=""
                            ErrorMessage="* Please enter your ID!"
                            ForeColor="#FF3300"
                            Font-Bold="true"
                            Font-Size="Medium"
                            Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" required="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfPassword" runat="server"
                            ControlToValidate="txtPassword" 
                            ErrorMessage="* Please enter your password!"
                            ForeColor="#FF3300"
                            Font-Bold="true"
                            Font-Size="Medium"
                            Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
                    </div>
                    <br />
                    <asp:Label ID="lblStatus" runat="server" Font-Size="12pt" Color="Red" ForeColor="Red"></asp:Label>

                </div>
            </div>
        </center>
    </form>
</body>
</html>
