<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WithBackBtn.Master" AutoEventWireup="true" CodeBehind="TableRoom.aspx.cs" Inherits="Gebuu.aspx_Room.TableRoom1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2Xofv37FLfFIDJMIKtuu6+pZZFet2MW2cGgW" crossorigin="anonymous">

    <link href="../Styles/TableRoom.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview-style" style="margin: auto; font-size: x-large;">
    <Columns>
        <asp:BoundField DataField="Order_ID" HeaderText="Order ID" HeaderStyle-BackColor="#F0D3D3" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="PetOwner_ID" HeaderText="Pet Owner ID" HeaderStyle-BackColor="#F0D3D3" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="Room_ID" HeaderText="Room ID" HeaderStyle-BackColor="#F0D3D3" ItemStyle-HorizontalAlign="Center" />
    </Columns>
</asp:GridView>

<div class="admit-buttons" style="text-align: center; margin-top: 20px;">
    <asp:Button ID="btnAdmitRoom1" runat="server" Text="Admit to Room 1 (Dr. Ismadi)" OnClick="AdmitToRoom1" style="padding: 10px; margin: 5px; border: 1px solid #ccc; border-radius: 5px; background-color: #F0D3D3; color: black; cursor: pointer;" />
    <asp:Button ID="btnRedirectToPage" runat="server" CssClass="functionality-icon" OnClick="RedirectToPage" style="/* Add specific styles for this button if needed */" />
    <asp:Button ID="btnAdmitRoom2" runat="server" Text="Admit to Room 2 (Dr. Lisa)" OnClick="AdmitToRoom2" style="padding: 10px; margin: 5px; border: 1px solid #ccc; border-radius: 5px; background-color: #F0D3D3; color: black; cursor: pointer;" />
</div>

<asp:Label ID="RoomErrorMessageLabel" runat="server" Visible="false" Text="" Style="color: red; font-weight: bold; display: block; margin: auto; text-align: center;"></asp:Label>

<div class="fixed-bottom-right" style="position: fixed; bottom: 20px; right: 20px;">
    <div class="box" style="padding: 10px; background-color: #F0D3D3; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
        <a href="CreateOrder.aspx" style="text-decoration: none; color: #000;">
            <i class="fas fa-plus-circle" style="margin-right: 5px;"></i> New Queue
        </a>
    </div>
</div>

</asp:Content>
