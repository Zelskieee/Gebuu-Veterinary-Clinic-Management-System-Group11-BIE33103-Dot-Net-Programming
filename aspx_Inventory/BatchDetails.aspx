<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="BatchDetails.aspx.cs" Inherits="Gebuu.aspx_Inventory.BatchDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
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

    .btn-decrease-stock {
        text-decoration: none;
        color: blue;
    }

    .btn-decrease-stock:hover {
        color: darkblue;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview-style" OnRowDeleting="GridView1_RowDeleting" style="margin: auto; width: 80%;">
        <Columns>
            <asp:BoundField DataField="Batch_ID" HeaderText="PO ID" />
            <asp:BoundField DataField="Batch_ExpDate" HeaderText="Expiry Date" />
            <asp:BoundField DataField="Stock" HeaderText="Quantity" />

            <asp:TemplateField HeaderText="Decrease Stock">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDecreaseStock" runat="server" CommandName="DecreaseStock" CommandArgument='<%# Eval("Batch_ID") %>' OnClick="btnDecreaseStock_Click" CssClass="btn-decrease-stock"
                        style="display: flex; align-items: center; justify-content: center; text-decoration: none; color: black; transition: color 0.3s ease-in-out;" onmouseover="this.style.color='#darkgrey';" onmouseout="this.style.color='#black';">
                        <i class="fas fa-minus-circle" style="color: black;"></i>
                    </asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle CssClass="centered-header" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="RowDelete">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("Batch_ID") %>' OnClientClick="return confirm('Are you sure you want to delete this item?');" 
                        style="display: flex; align-items: center; justify-content: center; text-decoration: none; color: red; transition: color 0.3s ease-in-out !important;">
                        <i class="fas fa-trash" style="color: red;"></i>
                    </asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle CssClass="centered-header" />
            </asp:TemplateField>

        </Columns>
        <HeaderStyle BackColor="#F0D3D3" />
    </asp:GridView>

    <div class="fixed-bottom-right">
    <div class="box">
        <a href="AddBatch.aspx?medID=<%= Request.QueryString["medID"] %>">
            <i class="fas fa-plus"></i> Add New Batch
        </a>
    </div>
</div>




</asp:Content>
