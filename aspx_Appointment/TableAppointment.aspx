<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="TableAppointment.aspx.cs" Inherits="Gebuu.Appointment1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

    <style>
    .update-button {
        color: #000; 
        text-decoration: none; 
    }

    .update-button:hover {
        color: lightgrey; 
    }

     .delete-button {
        color: #dc3545; /* Red color */
        text-decoration: none; /* Remove default link underline */
    }

    .delete-button:hover {
        color: #c82333; /* Darker red color on hover */
    }
        .gridview-style {
            font-size: x-large;
        }

        .fixed-bottom-right {
        position: fixed;
        bottom: 20px;
        right: 20px;
    }

    .box {
        background-color: #F0D3D3;
        padding: 10px 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        transition: background-color 0.3s ease-in-out;
    }

    .box:hover {
        background-color: #e0c1c1; /* Lighter shade on hover */
    }

    .box a {
        text-decoration: none;
        color: #333;
        font-weight: bold;
    }

    .box i {
        margin-right: 5px;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="pagetitle" runat="server" style="font-weight: 700; font-size: xx-large; margin: 0 auto; display: block; text-align: center;">Appointment List</asp:Label>

    <div style="text-align: center; padding-top: 5px; padding-bottom: 5px;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview-style" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="Appointment_ID" Width="100%">
        <HeaderStyle BackColor="#F0D3D3" Font-Bold="True" ForeColor="#333" />
        <AlternatingRowStyle BackColor="#FAEBE8" />
        <Columns>
            <asp:BoundField DataField="Appointment_ID" HeaderText="Appointment ID" ItemStyle-CssClass="gridview-column" />
            <asp:BoundField DataField="Appointment_Name" HeaderText="Appointment Name" ItemStyle-CssClass="gridview-column" />
            <asp:BoundField DataField="Appointment_Date" HeaderText="Date" ItemStyle-CssClass="gridview-column" />
            <asp:BoundField DataField="Appointment_Time" HeaderText="Time" ItemStyle-CssClass="gridview-column" />

            <asp:TemplateField HeaderText="Modify" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CommandArgument='<%# Eval("Appointment_ID") %>' OnClick="lnkUpdate_Click" CssClass="update-button">
                        <i class="fas fa-edit"></i>
                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle CssClass="gridview-column" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("Appointment_ID") %>' OnClientClick="return confirm('Are you sure you want to delete this appointment?');" CssClass="delete-button">
                        <i class="fas fa-trash"></i>
                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle CssClass="gridview-column" />
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
</div>

        <div class="fixed-bottom-right">
            <div class="box">
                <a href="CreateAppointment.aspx">
                    <i class="fas fa-plus"></i> Create Appointment
                </a>
            </div>
        </div>

</asp:Content>
