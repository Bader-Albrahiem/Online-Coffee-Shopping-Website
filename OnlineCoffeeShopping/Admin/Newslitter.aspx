<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Newslitter.aspx.cs" Inherits="OnlineCoffeeShopping.Admin.Newslitter" %>
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
        <li class="nav-item ">
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
          <a class="nav-link rounded-pill" href="Role.aspx">Roles</a>
        </li>
             <li class="nav-item">
          <a class="nav-link active rounded-pill" href="Newslitter.aspx">Newsletter subscription</a>
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
                  <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                      <AlternatingItemTemplate>
                          <tr style="">
                              <td>
                                  <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                              </td>
                              <td>
                                  <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                              </td>
                          </tr>
                      </AlternatingItemTemplate>
                      <EditItemTemplate>
                          <tr style="">
                              <td>
                                  <asp:Button ID="UpdateButton" CssClass="btn btn-light" runat="server" CommandName="Update" Text="Update" />
                                  <asp:Button ID="CancelButton"  CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Cancel" />
                              </td>
                              <td>
                                  <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                              </td>
                              <td>
                                  <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
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
                                  <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                  <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                              </td>
                              <td>&nbsp;</td>
                              <td>
                                  <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                              </td>
                          </tr>
                              
                      </InsertItemTemplate>
                      <ItemTemplate>                       
                          <table class="table" runat="server">
                          <tr style="">
                              <td>
                                  <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                              </td>
                              <td>
                                  <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
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
                                              <th runat="server">Id</th>
                                              <th runat="server">Email</th>
                                          </tr>
                                          <tr id="itemPlaceholder" runat="server">
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                              <tr runat="server">
                                  <td runat="server" style=""></td>
                              </tr>
                          </table>
                      </LayoutTemplate>
                      <SelectedItemTemplate>
                          <tr style="">
                              <td>
                                  <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                              </td>
                              <td>
                                  <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                              </td>
                          </tr>
                      </SelectedItemTemplate>

                  </asp:ListView>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OCS_DB %>" SelectCommand="SELECT * FROM [Newsletter]"></asp:SqlDataSource>
                  </div>
              </div>
      <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
