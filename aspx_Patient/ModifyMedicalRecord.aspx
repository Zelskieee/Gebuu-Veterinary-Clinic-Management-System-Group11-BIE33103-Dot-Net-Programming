<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="ModifyMedicalRecord.aspx.cs" Inherits="Gebuu.aspx_Patient.ModifyMedicalRecord" %>
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
            <asp:Label ID="Lbl_RecordID" runat="server" Text="Record ID: "></asp:Label>
            <asp:TextBox ID="txtBox_RecordID" runat="server" ReadOnly="true"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_RecordID" runat="server" ControlToValidate="txtBox_RecordID" ErrorMessage="Record ID must be an integer" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_PetOwnerID" runat="server" Text="Pet Owner ID: "></asp:Label>
            <asp:TextBox ID="txtBox_PetOwnerID" runat="server" ReadOnly="true"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_PetOwnerID" runat="server" ControlToValidate="txtBox_PetOwnerID" ErrorMessage="Pet Owner ID must be an integer" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_VetID" runat="server" Text="Vet ID: "></asp:Label>
            <asp:DropDownList ID="ddl_VetID" runat="server">
                <asp:ListItem Text="Ismadi" Value="1"></asp:ListItem>
                <asp:ListItem Text="Lisa" Value="2"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_VetID" runat="server" ControlToValidate="ddl_VetID" ErrorMessage="Vet ID is required"></asp:RequiredFieldValidator>
        </div>


        <div class="form-field">
            <asp:Label ID="Lbl_RecordDate" runat="server" Text="Record Date: "></asp:Label>
            <asp:TextBox ID="txtBox_RecordDate" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_RecordDate" runat="server" ControlToValidate="txtBox_RecordDate" ErrorMessage="Record Date is required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_RecordDate" runat="server" ControlToValidate="txtBox_RecordDate" ErrorMessage="Invalid date format" ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator>
        </div>
        <div class="form-field">
            <asp:Label ID="Lbl_RecordTime" runat="server" Text="Record Time (HH:MM:ss): "></asp:Label>
            <asp:TextBox ID="txtBox_RecordTime" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_RecordTime" runat="server" ControlToValidate="txtBox_RecordTime" ErrorMessage="Record Time is required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_RecordTime" runat="server" ControlToValidate="txtBox_RecordTime" ErrorMessage="Invalid time format" ValidationExpression="^([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$"></asp:RegularExpressionValidator>
        </div>


        <div class="form-field">
            <asp:Label ID="Lbl_RecordReason" runat="server" Text="Record Reason: "></asp:Label>
            <asp:TextBox ID="txtBox_RecordReason" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_RecordReason" runat="server" ControlToValidate="txtBox_RecordReason" ErrorMessage="Record Reason is required"></asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="Button_Submit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" 
            style="background-color: white; color: black; border: 1px solid black; border-radius: 5px; padding: 5px 10px; cursor: pointer;"
            onmouseover="this.style.backgroundColor='black'; this.style.color='white';"
            onmouseout="this.style.backgroundColor='white'; this.style.color='black';" />
    </div>
</asp:Content>
