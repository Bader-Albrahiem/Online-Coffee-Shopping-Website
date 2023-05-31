<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Monitor.aspx.cs" Inherits="OnlineCoffeeShopping.Admin.Monitor" %>
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
          <a class="nav-link rounded-pill" href="Role.aspx">Roles</a>
        </li>
             <li class="nav-item">
          <a class="nav-link rounded-pill" href="Newslitter.aspx">Newsletter subscription</a>
        </li>
          <li class="nav-item">
          <a class="nav-link active rounded-pill" href="Monitor.aspx">Monitor Products</a>
        </li>
      </ul>
        <h2 class="ms-auto">Admin panel</h2>
    </div>
  </div>
</nav> 
              <div class="container-fluid ">
             
           <div class="col-12 bg-white Product-Cont ">
            <div class="row">
            <asp:Label ID="lblEmpty" CssClass="col-12 text-center p-5" Visible="false" runat="server" Text="No Products available" Font-Size="XX-Large"></asp:Label>
                </div>
          <ul class="list">
              <asp:Repeater ID="MNTProdRpeater" runat="server">
                  <ItemTemplate>
                      
          <li><div class="card text-center">
            <img src="<%#Eval ("Product_img") %>" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title"><%#Eval("Product_Name")%></h5>
              <p class="card-text price" title="SAR">SAR<%#Eval("Product_Price")%></p>  
            </div>
          </div></li>
                      
                     </ItemTemplate>
                  </asp:Repeater>
              
          </ul>
        </div>
                  </div>
              
              </div>
     <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
