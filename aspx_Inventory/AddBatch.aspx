<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="AddBatch.aspx.cs" Inherits="Gebuu.aspx_Inventory.AddBatch" %>

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
            <asp:Label ID="Lbl_BatchID" runat="server" Text="Batch ID: "></asp:Label>
            <asp:TextBox ID="txtBox_BatchID" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_BatchID" runat="server" ControlToValidate="txtBox_BatchID" ErrorMessage="Batch ID is required"></asp:RequiredFieldValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_BatchExpDate" runat="server" Text="Batch Expiry Date: "></asp:Label>
            <asp:TextBox ID="txtBox_BatchExpDate" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_BatchExpDate" runat="server" ControlToValidate="txtBox_BatchExpDate" ErrorMessage="Batch Expiry Date is required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_BatchExpDate" runat="server" ControlToValidate="txtBox_BatchExpDate" ErrorMessage="Invalid date format" ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_Stock" runat="server" Text="Stock: "></asp:Label>
            <asp:TextBox ID="txtBox_Stock" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Stock" runat="server" ControlToValidate="txtBox_Stock" ErrorMessage="Stock is required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_Stock" runat="server" ControlToValidate="txtBox_Stock" ErrorMessage="Stock must be a non-negative integer" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>


            <asp:Button ID="Button_Submit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" 
                style="background-color: white; color: black; border: 1px solid black; border-radius: 5px; padding: 5px 10px; cursor: pointer;"
                onmouseover="this.style.backgroundColor='black'; this.style.color='white';"
                onmouseout="this.style.backgroundColor='white'; this.style.color='black';" />
    </div>
</asp:Content>
