<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="OnlineCoffeeShopping.Admin.Role" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
     <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container adminDashboard">
      <nav class="navbar navbar-expand-lg bg-body-tertiary bg-white">
  <div class="container-fluid bg-white p-4">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link rounded-pill" aria-current="page" href="Product.aspx">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link rounded-pill" href="Orders.aspx">Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link rounded-pill" href="Users.aspx">Users</a>
        </li>
            <li class="nav-item">
          <a class="nav-link rounded-pill" href="Reports.aspx">Reports</a>
        </li>
           <li class="nav-item">
          <a class="nav-link active rounded-pill" href="Role.aspx">Roles</a>
        </li>
             <li class="nav-item">
          <a class="nav-link rounded-pill" href="Newslitter.aspx">Newsletter subscription</a>
        </li>
          <li class="nav-item">
          <a class="nav-link rounded-pill" href="Monitor.aspx">Monitor Products</a>
        </li>
      </ul>
        <h2 class="ms-auto">Admin panel</h2>
    </div>
  </div>
</nav>
            <div class="container-fluid ">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="Role_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                        <table class="table" runat="server">
                        <tr style="">
                            <td>
                                <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="Role_idLabel" runat="server" Text='<%# Eval("Role_id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Role_NameLabel" runat="server" Text='<%# Eval("Role_Name") %>' />
                            </td>
                        </tr>
                            </table>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <table class="table" runat="server">
                        <tr style="">
                            <td>
                                <asp:Button ID="UpdateButton" CssClass="btn btn-light" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td>
                                <asp:Label ID="Role_idLabel1" runat="server" Text='<%# Eval("Role_id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="Role_NameTextBox" runat="server" Text='<%# Bind("Role_Name") %>' />
                            </td>
                        </tr>
                            </table>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <table class="table" runat="server">
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" CssClass="btn btn-light" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:TextBox ID="Role_NameTextBox" runat="server" Text='<%# Bind("Role_Name") %>' />
                            </td>
                        </tr>
                            </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table class="table" runat="server">
                        <tr style="">
                            <td>
                                <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="Role_idLabel" runat="server" Text='<%# Eval("Role_id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Role_NameLabel" runat="server" Text='<%# Eval("Role_Name") %>' />
                            </td>
                        </tr>
                        </table>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" class="table" runat="server" border="0" style="">
                                        <tr runat="server" style="">
                                            <th runat="server"></th>
                                            <th runat="server">Role_id</th>
                                            <th runat="server">Role_Name</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <table class="table" runat="server">
                        <tr style="">
                            <td>
                                <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="Role_idLabel" runat="server" Text='<%# Eval("Role_id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Role_NameLabel" runat="server" Text='<%# Eval("Role_Name") %>' />
                            </td>
                        </tr>
                            </table>
                    </SelectedItemTemplate>

                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:OCS_DB %>" DeleteCommand="DELETE FROM [Roles] WHERE [Role_id] = @original_Role_id AND [Role_Name] = @original_Role_Name" InsertCommand="INSERT INTO [Roles] ([Role_Name]) VALUES (@Role_Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Roles]" UpdateCommand="UPDATE [Roles] SET [Role_Name] = @Role_Name WHERE [Role_id] = @original_Role_id AND [Role_Name] = @original_Role_Name">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Role_id" Type="Int32" />
                        <asp:Parameter Name="original_Role_Name" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Role_Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Role_Name" Type="String" />
                        <asp:Parameter Name="original_Role_id" Type="Int32" />
                        <asp:Parameter Name="original_Role_Name" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
            </div>
</asp:Content>
