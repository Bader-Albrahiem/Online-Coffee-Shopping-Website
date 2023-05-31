<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="OnlineCoffeeShopping.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <!-- Products start ---------------------------------->

     <div class="container-fluid products-wrapper">
      <div class="container py-3">
      <div class="row d-lg-flex d-block">
        <div class="col-lg-12 sort col-12 py-3  p-4">
          <div class="dropdown me-lg-auto">
            <button class="btn btn-secondary dropdown-toggle rounded-pill" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-funnel me-3"></i>Sort
            </button>
            <ul class="dropdown-menu .sort">
              <li><a class="dropdown-item" href="#L2h">Lowest to highest</a></li>
              <li><a class="dropdown-item" href="#H2l">Highest to lowest</a></li>
            </ul>
          </div>

          <div class="dropdown">   
                <button class="btn btn-secondary dropdown-toggle rounded-pill" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-bookmarks me-3"></i>Category
            </button>
         
              <asp:DropDownList ID="DropDownList1" AutoPostBack="true" CssClass="dropdown-menu" runat="server">
                  <asp:ListItem Selected="True">All products</asp:ListItem>
                  <asp:ListItem>Coffee beans</asp:ListItem>
                  <asp:ListItem>Espresso machines</asp:ListItem>
                  <asp:ListItem>Grinders</asp:ListItem>
                  <asp:ListItem>Barista-gear</asp:ListItem>
                  <asp:ListItem>Brewing</asp:ListItem>
                  <asp:ListItem>Filter</asp:ListItem>
                </asp:DropDownList>
          </div>
                <script src="../Scripts/Sort.js"></script>
           
        </div>
        <div class="col-12 bg-white Product-Cont">
            <div class="row">
            <asp:Label ID="lblEmpty" CssClass="col-12 text-center p-5" Visible="false" runat="server" Text="No Products available" Font-Size="XX-Large"></asp:Label>
                </div>
          <ul class="list">
              <asp:Repeater ID="ProdcutRpeater" runat="server">
                  <ItemTemplate>
                      
          <li><div class="card text-center">
            <img src="<%#Eval ("Product_img") %>" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title"><%#Eval("Product_Name")%></h5>
              <p class="card-text price" title="SAR">SAR<%#Eval("Product_Price")%></p>  
                <asp:HyperLink ID="HyperLink1" CssClass="btn btn-primary rounded-pill" runat="server" NavigateUrl='<%#String.Format("~/Users/ProductInfo.aspx?ProdId={0}",Eval("Product_Id"))%>'><i class="bi bi-cart-plus me-2"></i>Shop now</asp:HyperLink>
            </div>
          </div></li>

                     </ItemTemplate>
              </asp:Repeater>
          </ul>
        </div>
      </div>
     </div>
           </div> 
 
     <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
