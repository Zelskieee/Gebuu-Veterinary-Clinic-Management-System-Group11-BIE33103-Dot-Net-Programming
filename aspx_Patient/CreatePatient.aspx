<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="CreatePatient.aspx.cs" Inherits="Gebuu.CreatePatient" %>

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
            <asp:Label ID="Lbl_PetOwnerID" runat="server" Text="Pet Owner ID: "></asp:Label>
            <asp:TextBox ID="txtBox_PetOwnerID" runat="server" ReadOnly="true"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_PetOwnerID" runat="server" ControlToValidate="txtBox_PetOwnerID" ErrorMessage="Pet Owner ID must be an integer" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_PetOwnerName" runat="server" Text="Pet Owner Name: "></asp:Label>
            <asp:TextBox ID="txtBox_PetOwnerName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PetOwnerName" runat="server" ControlToValidate="txtBox_PetOwnerName" ErrorMessage="Pet Owner Name is required"></asp:RequiredFieldValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_PetOwnerGender" runat="server" Text="Gender: "></asp:Label>
            <asp:DropDownList ID="ddl_PetOwnerGender" runat="server">
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PetOwnerGender" runat="server" ControlToValidate="ddl_PetOwnerGender" ErrorMessage="Pet Owner Gender is required"></asp:RequiredFieldValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_PetOwnerAddress" runat="server" Text="Address: "></asp:Label>
            <asp:TextBox ID="txtBox_PetOwnerAddress" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PetOwnerAddress" runat="server" ControlToValidate="txtBox_PetOwnerAddress" ErrorMessage="Pet Owner Address is required"></asp:RequiredFieldValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_PetOwnerPhoneNo" runat="server" Text="Phone Number: "></asp:Label>
            <asp:TextBox ID="txtBox_PetOwnerPhoneNo" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PetOwnerPhoneNo" runat="server" ControlToValidate="txtBox_PetOwnerPhoneNo" ErrorMessage="Pet Owner Phone Number is required"></asp:RequiredFieldValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_PetOwnerEmergencyContact" runat="server" Text="Emergency Contact: "></asp:Label>
            <asp:TextBox ID="txtBox_PetOwnerEmergencyContact" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PetOwnerEmergencyContact" runat="server" ControlToValidate="txtBox_PetOwnerEmergencyContact" ErrorMessage="Pet Owner Emergency Contact is required"></asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="Button_Submit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" 
            style="background-color: white; color: black; border: 1px solid black; border-radius: 5px; padding: 5px 10px; cursor: pointer;"
            onmouseover="this.style.backgroundColor='black'; this.style.color='white';"
            onmouseout="this.style.backgroundColor='white'; this.style.color='black';" />

    </div>
</asp:Content>
