<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="OnlineCoffeeShopping.Admin.Users" %>
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
          <a class="nav-link active rounded-pill" href="Users.aspx">Users</a>
        </li>
           <li class="nav-item">
          <a class="nav-link rounded-pill" href="Reports.aspx">Reports</a>
        </li>
           <li class="nav-item">
          <a class="nav-link rounded-pill" href="Role.aspx">Roles</a>
        </li>
             <li class="nav-item">
          <a class="nav-link rounded-pill" href="Newslitter.aspx">Mewsletter subscription</a>
        </li>
          <li class="nav-item">
          <a class="nav-link rounded-pill" href="Monitor.aspx">Monitor Products</a>
        </li>
      </ul>
        <h2 class="ms-auto">Admin panel</h2>
    </div>
  </div>
</nav>
         <div class="container-fluid">
             <asp:ListView ID="ListView1" GroupPlaceholderID="Groupplaceholder" ItemPlaceholderID="itemplaceholder" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="User_id" InsertItemPosition="LastItem">
                  <LayoutTemplate>
                <table class="table" runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">User_id</th>
                                    <th runat="server">First_Name</th>
                                    <th runat="server">Last_Name</th>
                                    <th runat="server">Username</th>
                                    <th runat="server">Password</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">CompanyName</th>
                                    <th runat="server">Country</th>
                                    <th runat="server">Role</th>
                                </tr>
                                <tr id="itemplaceholder" runat="server">
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
                  <AlternatingItemTemplate>
                      <tr style="">
                          <td>
                              <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                              <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                          </td>
                          <td>
                              <asp:Label ID="User_idLabel" runat="server" Text='<%# Eval("User_id") %>' />
                          </td>
                          <td>
                              <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
                          </td>
                          <td>
                              <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                          </td>
                          <td>
                              <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                          </td>
                          <td>
                              <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                          </td>
                          <td>
                              <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                          </td>
                          <td>
                              <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                          </td>
                          <td>
                              <asp:Label ID="RoleLabel" runat="server" Text='<%# Eval("Role") %>' />
                          </td>
                      </tr>
                  </AlternatingItemTemplate>
                  <EditItemTemplate>
                      <tr style="">
                          <td>
                              <asp:Button ID="UpdateButton" CssClass="btn btn-light" runat="server" CommandName="Update" Text="Update" />
                              <asp:Button ID="CancelButton" CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Cancel" />
                          </td>
                          <td>
                              <asp:Label ID="User_idLabel1" runat="server" Text='<%# Eval("User_id") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="First_NameTextBox" runat="server" Text='<%# Bind("First_Name") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("Last_Name") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="RoleTextBox" runat="server" Text='<%# Bind("Role") %>' />
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
                              <asp:Button ID="InsertButton" CssClass="btn btn-light" runat="server" CommandName="Insert" Text="Insert" />
                              <asp:Button ID="CancelButton" CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Clear" />
                          </td>
                          <td>&nbsp;</td>
                          <td>
                              <asp:TextBox ID="First_NameTextBox" runat="server" Text='<%# Bind("First_Name") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("Last_Name") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="RoleTextBox" runat="server" Text='<%# Bind("Role") %>' />
                          </td>
                      </tr>
                  </InsertItemTemplate>
            <ItemTemplate>
          
                 <tr style="">
                     <td>
                         <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                         <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                     </td>
                     <td>
                         <asp:Label ID="User_idLabel" runat="server" Text='<%# Eval("User_id") %>' />
                     </td>
                     <td>
                         <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
                     </td>
                     <td>
                         <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                     </td>
                     <td>
                         <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                     </td>
                     <td>
                         <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                     </td>
                     <td>
                         <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                     </td>
                     <td>
                         <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                     </td>
                     <td>
                         <asp:Label ID="RoleLabel" runat="server" Text='<%# Eval("Role") %>' />
                     </td>
                 </tr>
            </ItemTemplate>
                  <SelectedItemTemplate>
                      <tr style="">
                          <td>
                              <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                              <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                          </td>
                          <td>
                              <asp:Label ID="User_idLabel" runat="server" Text='<%# Eval("User_id") %>' />
                          </td>
                          <td>
                              <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
                          </td>
                          <td>
                              <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                          </td>
                          <td>
                              <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                          </td>
                          <td>
                              <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                          </td>
                          <td>
                              <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                          </td>
                          <td>
                              <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                          </td>
                          <td>
                              <asp:Label ID="RoleLabel" runat="server" Text='<%# Eval("Role") %>' />
                          </td>
                      </tr>
                  </SelectedItemTemplate>
             </asp:ListView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OCS_DB %>" SelectCommand="SELECT * FROM [TBL_Users]" DeleteCommand="DELETE FROM [TBL_Users] WHERE [User_id] = @User_id" InsertCommand="INSERT INTO [TBL_Users] ([First_Name], [Last_Name], [Username], [Password], [Email], [CompanyName], [Country], [Role]) VALUES (@First_Name, @Last_Name, @Username, @Password, @Email, @CompanyName, @Country, @Role)" UpdateCommand="UPDATE [TBL_Users] SET [First_Name] = @First_Name, [Last_Name] = @Last_Name, [Username] = @Username, [Password] = @Password, [Email] = @Email, [CompanyName] = @CompanyName, [Country] = @Country, [Role] = @Role WHERE [User_id] = @User_id">
                 <DeleteParameters>
                     <asp:Parameter Name="User_id" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="First_Name" Type="String" />
                     <asp:Parameter Name="Last_Name" Type="String" />
                     <asp:Parameter Name="Username" Type="String" />
                     <asp:Parameter Name="Password" Type="String" />
                     <asp:Parameter Name="Email" Type="String" />
                     <asp:Parameter Name="CompanyName" Type="String" />
                     <asp:Parameter Name="Country" Type="String" />
                     <asp:Parameter Name="Role" Type="Int32" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="First_Name" Type="String" />
                     <asp:Parameter Name="Last_Name" Type="String" />
                     <asp:Parameter Name="Username" Type="String" />
                     <asp:Parameter Name="Password" Type="String" />
                     <asp:Parameter Name="Email" Type="String" />
                     <asp:Parameter Name="CompanyName" Type="String" />
                     <asp:Parameter Name="Country" Type="String" />
                     <asp:Parameter Name="Role" Type="Int32" />
                     <asp:Parameter Name="User_id" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
             </div>
</asp:Content>
