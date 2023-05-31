<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckOutReview.aspx.cs" Inherits="OnlineCoffeeShopping.Users.Checkout.CheckOutReview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="../../css/bootstrap.css" rel="stylesheet" />
    <link href="../..//Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid cart-wrapper p-3">
        <div class="container bg-white">
            <div class="row py-3">
                <div class="col-12">
                    <h2 class="py-3 border-bottom">Check out</h2>
                </div>
            </div>
            <div class="row d-block d-lg-flex position-relative">
                <div class="col-12">
                    <div class="product-content py-3 mb-3">

                        <div class="row d-block mx-auto d-lg-flex">
                            <div class="col-12 d-flex justify-content-center align-items-center flex-column mt-4">
                                <div class="Poroduct-deatils w-50" id="Pirnt" runat="server">
                                    <h5 class="text-dark fw-bold">Order Review</h5>
                                    <asp:Repeater ID="ReviewRPT" runat="server">
                                        <ItemTemplate>
                                            <p><%#Eval("ProductName") %></p>
                                            <p>Qunatity:<%#Eval("Quantity") %></p>
                                            <p>Subtotal: <%#Eval("TotalPrice") %></p>
                                            <hr />
                                            </ItemTemplate>
                                     </asp:Repeater>
                                    </div>
                                    <div class="col-12 d-flex justify-content-center align-items-center flex-column mt-4">
                                          <div class="Poroduct-deatils w-50">
                                        <h5  class="text-dark fw-bold">Shipping Address</h5>
                                        <asp:Repeater ID="AddRPT" runat="server">
                                            <ItemTemplate>
                                        <p>Country:<%#Eval("Country") %></p>
                                        <p>City:<%#Eval("City") %></p>
                                        <p>Addreess:<%#Eval("Address") %></p>
                                        <p>ZipCode:<%#Eval("ZipCode") %></p>
                                        <hr />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <asp:Button ID="addOrder" CssClass="btn btn-light" runat="server" Text="Complete Order" OnClick="addOrder_Click" />
                                    <asp:Label ID="LblTotal" runat="server" Text=""></asp:Label>
                            </div>
                                
                            </div>
                        </div>
                    </div>
                    <!----------------------------------------------------------------------------->
                </div>

            </div>
        </div>
    </div>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
