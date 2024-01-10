<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="TableMedicalRecord.aspx.cs" Inherits="Gebuu.aspx_Patient.TableMedicalRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

    <style>
.gridview-style {
    font-size: x-large;
    border-collapse: collapse;
    width: 100%;
}

.gridview-style th,
.gridview-style td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.gridview-style th {
    background-color: #F0D3D3;
}

.gridview-style a {
    color: blue;
    text-decoration: none;
}

.gridview-style i {
    margin-right: 5px;
}

.gridview-style a:hover {
    color: lightgrey;
}

.delete-button {
    color: #dc3545;
    text-decoration: none;
}

.delete-button:hover {
    color: #c82333;
}

.update-button {
    color: #000;
    text-decoration: none;
}

.update-button:hover {
    color: lightgrey;
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
    background-color: #e0c1c1;
}

.box a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview-style" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="Record_ID">
    <Columns>
        <asp:BoundField DataField="Record_ID" HeaderText="Record ID" />
        <asp:BoundField DataField="Vet_ID" HeaderText="Vet ID" />
        <asp:BoundField DataField="Record_Date" HeaderText="Record Date" />
        <asp:BoundField DataField="Record_Time" HeaderText="Record Time" />
        <asp:BoundField DataField="Record_Reason" HeaderText="Record Reason" />

        <asp:TemplateField HeaderText="Modify">
            <ItemTemplate>
                <asp:LinkButton 
                    ID="lnkUpdate" 
                    runat="server" 
                    Text="Update" 
                    CommandName="Update" 
                    CommandArgument='<%# Eval("Record_ID") %>' 
                    OnClick="lnkUpdate_Click"
                    ForeColor="Black"
                    style="text-align: center;"
                >
                    <i class="fas fa-edit"></i>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

       <asp:TemplateField HeaderText="Delete">
    <ItemTemplate>
        <asp:LinkButton 
            ID="lnkDelete" 
            runat="server" 
            Text="Delete" 
            CommandName="Delete" 
            CommandArgument='<%# Eval("Record_ID") %>' 
            OnClientClick="return confirm('Are you sure you want to delete this medical record?');"
            ForeColor="Red"
            style="text-align: center;"
        >
            <i class="fas fa-trash"></i>
        </asp:LinkButton>
    </ItemTemplate>
</asp:TemplateField>

    </Columns>
</asp:GridView>

    <div class="fixed-bottom-right">
    <div class="box">
        <a href="AddMedical.aspx?petownerID=<%= Request.QueryString["petownerID"] %>">
            <i class="fas fa-plus-circle"></i> Add Medical Record
        </a>
    </div>
</div>



</asp:Content>
