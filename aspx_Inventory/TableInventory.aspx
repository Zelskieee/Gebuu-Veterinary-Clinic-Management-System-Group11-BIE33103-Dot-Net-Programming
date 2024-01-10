<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="TableInventory.aspx.cs" Inherits="Gebuu.aspx_Inventory.TableInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

    <style>
        /* GridView Styles */
        .gridview-style {
            font-size: x-large;
            border-collapse: collapse; /* Ensure borders collapse properly */
            width: 100%;
        }

        #GridView1 th {
            background-color: #F0D3D3; /* Use the desired background color */
            color: #333; /* Text color for column headers */
        }

        /* GridView Row Styles */
        #GridView1 tr {
            border-bottom: 1px solid #ddd; /* Add border between rows */
        }

        #GridView1 tr:nth-child(even) {
            background-color: #f9f9f9; /* Alternate row background color */
        }

        /* GridView Cell Styles */
        #GridView1 td {
            padding: 10px;
            text-align: center;
        }

        /* Update Button Styles */
        #GridView1 .update-button {
            color: #000;
            text-decoration: none;
        }

        #GridView1 .update-button:hover {
            color: lightgrey;
        }

        /* Delete Button Styles */
        #GridView1 .delete-button {
            color: #dc3545;
            text-decoration: none;
        }

        #GridView1 .delete-button:hover {
            color: #c82333;
        }

        /* Box Styles */
        #GridView1 .box {
            background-color: #F0D3D3;
            padding: 10px 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: background-color 0.3s ease-in-out;
        }

        #GridView1 .box:hover {
            background-color: #e0c1c1;
        }

        #GridView1 .box a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        #GridView1 .box i {
            margin-right: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview-style">
        <Columns>
            <asp:BoundField DataField="Med_ID" HeaderText="Medicine ID" HeaderStyle-BackColor="#F0D3D3" />
            <asp:BoundField DataField="Med_Name" HeaderText="Medicine Name" HeaderStyle-BackColor="#F0D3D3" />
            <asp:BoundField DataField="TotalStock" HeaderText="Total Stock" HeaderStyle-BackColor="#F0D3D3" />

            <asp:TemplateField HeaderText="View">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkView" runat="server" Text="View" CommandName="View" CommandArgument='<%# Eval("Med_ID") %>' OnClick="lnkView_Click"
                        style="color: black; text-decoration: none; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-eye"></i>
                    </asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle BackColor="#F0D3D3" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
