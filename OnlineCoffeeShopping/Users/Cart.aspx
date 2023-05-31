<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OnlineCoffeeShopping.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <!-- Cart info start ---------------------------------->
        <div class="container-fluid cart-wrapper p-3">
            <div class="container bg-white">
                <div class="row py-3">
                    <div class="col-12">
                        <h2 class="py-3 border-bottom">My cart</h2>
                    </div>
                </div>
                <div class="row d-block d-lg-flex position-relative">
                        <asp:Label ID="Avliablelbl" CssClass="col-12 text-center" runat="server" Text="No Item Avaliable." Font-Size="X-Large"></asp:Label>
                    <asp:Repeater ID="CartRpeater" runat="server">
                        <ItemTemplate>
                    <div class="col-12 col-lg-8">
                        <div class="product-content py-3 mb-3">
                          
                          <div class="row d-block mx-auto d-lg-flex">
                            <div class="col-12 col-lg-4 d-block d-lg-flex">
                        <div class="img-wrapper">
                            <img src='<%#Eval("ProductImg") %>' alt="">
                            <asp:LinkButton ID="RemoveBtn" CssClass="btn btn-primary rounded-pill" OnCommand="RemoveBtn_Click" CommandName="Remove" CommandArgument='<%#Eval("ProductId") %>' runat="server" Text="X"></asp:LinkButton>
                        </div>
                        </div>
                        <div class="col-12 col-lg-6 d-flex justify-content-center align-items-center flex-column">
                        <div class="Poroduct-deatils">
                          <h5><%# Eval("ProductName") %></h5>
                          <p>By:<%#Eval("CompanyName") %></p>
                          <p>Quantity:<%# Eval("Quantity") %></p>
                            
                        </div>
                     </div>
                     <div class="col-12 col-lg-2 d-flex justify-content-center align-items-center flex-column">
                      <p>Subtotal:</p>
                      <P>SAR<%#Eval("TotalPrice")%></P>


                     </div>
                  </div>
                 </div>

                        <!----------------------------------------------------------------------------->
              </div>
                        </ItemTemplate>
                        </asp:Repeater>
                    <div class="col-12 col-lg-4 d-flex justify-content-center align-items-center flex-column" id="Checkout" runat="server">
                     <h2>Total</h2>
                        <asp:Label ID="LblTotal" CssClass="py-3 my-5" runat="server" Text="SAR0"></asp:Label>
                        <asp:LinkButton ID="CheckOutBtn" CssClass="btn btn-primary rounded-pill my-3" runat="server" PostBackUrl="~/Users/Checkout/CheckOut.aspx">Check out</asp:LinkButton>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Users/Products.aspx">Continue shopping...</asp:HyperLink>
                      
                    </div>
                </div>
            </div>
        </div>

     <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
