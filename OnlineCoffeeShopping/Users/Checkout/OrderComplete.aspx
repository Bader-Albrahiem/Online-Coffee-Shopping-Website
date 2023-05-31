<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderComplete.aspx.cs" Inherits="OnlineCoffeeShopping.Users.Checkout.OrderComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../../css/bootstrap.css" rel="stylesheet" />
    <link href="../..//Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="padding:85px;">
    <div class="container bg-white">
            <div class="row py-3">
                <div class="col-12">
                    <h2 class="py-3 border-bottom">Order Complete</h2>
                </div>
            </div>
            <div class="row d-block d-lg-flex position-relative">
                <div class="col-12">
                    <div class="product-content py-3 mb-3">

                        <div class="row d-block mx-auto d-lg-flex">
                            <div class="col-12 d-flex justify-content-center align-items-center flex-column mt-4">
                                <div class="Poroduct-deatils w-50">
                                    <h2 class="text-dark mb-3">Your order has been received.</h2>
                                    <h1 class="mt-3">Thank you!</h1>
                                            <hr />
                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-light rounded-pill" runat="server" OnClick="LinkButton1_Click" PostBackUrl="~/index.aspx">Return to home.</asp:LinkButton>
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
