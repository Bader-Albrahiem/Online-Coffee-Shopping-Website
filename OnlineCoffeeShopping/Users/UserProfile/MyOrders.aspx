<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="OnlineCoffeeShopping.Users.UserProfile.MyOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="../../css/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <div class="container-fluid cart-wrapper p-3">
            <div class="container bg-white">
                <div class="row py-3">
                    <div class="col-12">
                        <h2 class="py-3 border-bottom">My Orders</h2>
                    </div>
                </div>
                <div class="row d-block d-lg-flex position-relative">
                        <asp:Label ID="Avliablelbl" CssClass="col-12 text-center" runat="server" Text="No Orders Avaliable." Font-Size="X-Large"></asp:Label>
                    <asp:Repeater ID="UserOrdersRPT" runat="server">
                        <ItemTemplate>
                    <div class="col-12 col-lg-8">
                        <div class="product-content py-3 mb-3">
                          <div class="row d-block mx-auto d-lg-flex">
                            <div class="col-12 col-lg-4 d-block d-lg-flex">
                        <div class="img-wrapper">
                            <img src='../<%#Eval("Product_img") %>' alt="">
                        </div>
                        </div>
                        <div class="col-12 col-lg-6 d-flex justify-content-center align-items-center flex-column">
                        <div class="Poroduct-deatils">
                          <h5><%# Eval("Product_Name") %></h5>
                          <p><%# Eval("Order_date") %></p>
                          <p><%#Eval("Order_Weight") %>G</p>
                          <p>Quantity:<%# Eval("Order_Quantity") %></p>
                          <p>OrderStatus:<%# Eval("Order_Status") %></p>
                        </div>
                     </div>
                     <div class="col-12 col-lg-2 d-flex justify-content-center align-items-center flex-column">
                      <p>Subtotal:</p>
                      <P>SAR<%#Eval("Total_Price")%></P>
                     </div>
                  </div>
                 </div>

                        <!----------------------------------------------------------------------------->
              </div>
                        </ItemTemplate>
                        </asp:Repeater>
              
                </div>
            </div>
        </div>

    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
