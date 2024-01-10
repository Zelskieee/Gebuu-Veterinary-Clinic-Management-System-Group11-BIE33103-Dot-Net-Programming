<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="CreateAppointment.aspx.cs" Inherits="Gebuu.CreateAppointment" %>

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
            <asp:Label ID="Lbl_AppointmentID" runat="server" Text="Appointment ID: "></asp:Label>
            <asp:TextBox ID="txtBox_AppointmentID" runat="server" ReadOnly="true"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_AppointmentID" runat="server" ControlToValidate="txtBox_AppointmentID" ErrorMessage="Appointment ID must be an integer" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_AppointmentName" runat="server" Text="Appointment Name: "></asp:Label>
            <asp:TextBox ID="txtBox_AppointmentName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_AppointmentName" runat="server" ControlToValidate="txtBox_AppointmentName" ErrorMessage="Appointment Name is required"></asp:RequiredFieldValidator>
        </div>

        <div class="form-field">
            <asp:Label ID="Lbl_Date" runat="server" Text="Date: "></asp:Label>
            <asp:TextBox ID="txtBox_AppointmentDate" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_AppointmentDate" runat="server" ControlToValidate="txtBox_AppointmentDate" ErrorMessage="Date is required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_AppointmentDate" runat="server" ControlToValidate="txtBox_AppointmentDate" ErrorMessage="Invalid date format" ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator>
        </div>
        <div class="form-field">
            <asp:Label ID="Lbl_Time" runat="server" Text="Time (HH:MM:ss): "></asp:Label>
            <asp:TextBox ID="txtBox_AppointmentTime" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_AppointmentTime" runat="server" ControlToValidate="txtBox_AppointmentTime" ErrorMessage="Time is required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_AppointmentTime" runat="server" ControlToValidate="txtBox_AppointmentTime" ErrorMessage="Invalid time format" ValidationExpression="^([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$"></asp:RegularExpressionValidator>
        </div>

        <asp:Button ID="Button_Submit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" 
            style="background-color: white; color: black; border: 1px solid black; border-radius: 5px; padding: 5px 10px; cursor: pointer;"
            onmouseover="this.style.backgroundColor='black'; this.style.color='white';"
            onmouseout="this.style.backgroundColor='white'; this.style.color='black';" />
    </div>

</asp:Content>
