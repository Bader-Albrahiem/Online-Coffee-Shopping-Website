<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="OnlineCoffeeShopping.Admin.Reports" %>
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
          <a class="nav-link active rounded-pill" href="Reports.aspx">Reports</a>
        </li>
           <li class="nav-item">
          <a class="nav-link rounded-pill" href="Role.aspx">Roles</a>
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
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Report_id" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
               
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton"  CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton"  CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="Report_idLabel" runat="server" Text='<%# Eval("Report_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_idLabel" runat="server" Text='<%# Eval("User_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_EmailLabel" runat="server" Text='<%# Eval("User_Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Report_detailsLabel" runat="server" Text='<%# Eval("Report_details") %>' />
                    </td>
                </tr>
                   
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton"  CssClass="btn btn-light" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton"  CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="Report_idLabel1" runat="server" Text='<%# Eval("Report_id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="User_idTextBox" runat="server" Text='<%# Bind("User_id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="User_EmailTextBox" runat="server" Text='<%# Bind("User_Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Report_detailsTextBox" runat="server" Text='<%# Bind("Report_details") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton"  CssClass="btn btn-light" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton"  CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="User_idTextBox" runat="server" Text='<%# Bind("User_id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="User_EmailTextBox" runat="server" Text='<%# Bind("User_Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Report_detailsTextBox" runat="server" Text='<%# Bind("Report_details") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                 <table class="table" runat="server">
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton"  CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton"  CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="Report_idLabel" runat="server" Text='<%# Eval("Report_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_idLabel" runat="server" Text='<%# Eval("User_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_EmailLabel" runat="server" Text='<%# Eval("User_Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Report_detailsLabel" runat="server" Text='<%# Eval("Report_details") %>' />
                    </td>
                </tr>
                     </table>
            </ItemTemplate>
            <LayoutTemplate>
               
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="table" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">Report_id</th>
                                    <th runat="server">User_id</th>
                                    <th runat="server">User_Email</th>
                                    <th runat="server">Report_details</th>
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
          
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton"  CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton"  CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="Report_idLabel" runat="server" Text='<%# Eval("Report_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_idLabel" runat="server" Text='<%# Eval("User_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_EmailLabel" runat="server" Text='<%# Eval("User_Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Report_detailsLabel" runat="server" Text='<%# Eval("Report_details") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>

        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OCS_DB %>" DeleteCommand="DELETE FROM [Company_Feed] WHERE [Report_id] = @Report_id" InsertCommand="INSERT INTO [Company_Feed] ([User_id], [User_Email], [Report_details]) VALUES (@User_id, @User_Email, @Report_details)" SelectCommand="SELECT * FROM [Company_Feed] ORDER BY [Report_id]" UpdateCommand="UPDATE [Company_Feed] SET [User_id] = @User_id, [User_Email] = @User_Email, [Report_details] = @Report_details WHERE [Report_id] = @Report_id">
            <DeleteParameters>
                <asp:Parameter Name="Report_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_id" Type="String" />
                <asp:Parameter Name="User_Email" Type="String" />
                <asp:Parameter Name="Report_details" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_id" Type="String" />
                <asp:Parameter Name="User_Email" Type="String" />
                <asp:Parameter Name="Report_details" Type="String" />
                <asp:Parameter Name="Report_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        </div>
          </div>
      <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
