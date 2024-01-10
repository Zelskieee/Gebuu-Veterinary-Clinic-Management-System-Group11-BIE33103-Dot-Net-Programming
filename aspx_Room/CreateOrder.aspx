<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="Gebuu.CreateOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <style>
        .box {
    width: 60%;
    margin: 50px auto;
    padding: 20px;
    background-color: #F0D3D3;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-field {
    margin-bottom: 15px;
}

.form-field label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-field input[type="text"],
.form-field input[type="date"],
.form-field input[type="button"],
.form-field input[type="submit"] {
    width: calc(100% - 10px);
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

.form-field input[type="button"],
.form-field input[type="submit"] {
    background-color: #4CAF50; /* Green */
    color: white;
    cursor: pointer;
}

.form-field input[type="button"]:hover,
.form-field input[type="submit"]:hover {
    background-color: #45a049; /* Darker Green */
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box">
        <div class="form-field">
            <asp:Label ID="Lbl_OrderID" runat="server" Text="Order ID: "></asp:Label>
            <asp:TextBox ID="txtBox_OrderID" runat="server" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_PetOwnerID" runat="server" Text="Pet Owner ID: "></asp:Label>
            <asp:TextBox ID="txtBox_PetOwnerID" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PetOwnerID" runat="server" ControlToValidate="txtBox_PetOwnerID" ErrorMessage="Pet Owner ID is required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_PetOwnerID" runat="server" ControlToValidate="txtBox_PetOwnerID"
                ErrorMessage="Please enter a valid integer" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <asp:Button ID="Button_Submit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" 
            style="background-color: white; color: black; border: 1px solid black; border-radius: 5px; padding: 5px 10px; cursor: pointer;"
            onmouseover="this.style.backgroundColor='black'; this.style.color='white';"
            onmouseout="this.style.backgroundColor='white'; this.style.color='black';" />

        <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="false" 
    Style="display: block; margin: auto; text-align: center;"></asp:Label>

    </div>
</asp:Content>
