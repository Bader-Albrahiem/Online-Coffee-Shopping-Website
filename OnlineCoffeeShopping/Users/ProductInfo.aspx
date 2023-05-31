<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductInfo.aspx.cs" Inherits="OnlineCoffeeShopping.ProductInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
          <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- Products info start ---------------------------------->
        <div class="container-fluid product-info-cont p-3">

            <asp:Repeater ID="PdInfoRepeater"   runat="server">
                <ItemTemplate>
        <div class="container product-info bg-white mb-3">
            <div class="row d-block d-lg-flex justify-content-center align-items-center">
                <div class="col-12 col-lg-4">
                <div class="Product-img">
                    <img src="<%#Eval("Product_img") %>" alt="..."/>
                </div>
                </div>
                <div class="col-12 col-lg-4  d-flex flex-column justify-content-center align-items-center">
                    <div class="d-flex flex-column align-items-start justify-content-start">
                    <h3 class="my-3"><%#Eval("Product_Name") %></h3>
                    <p><%#Eval("CompanyName") %> </p>
                    <p>Weight:</p>
                    </div>
                    <div class="d-inline-block">
                        <asp:TextBox ID="Weighttxt" CssClass="btn btn-primary rounded-pill" runat="server" ReadOnly="true" Text='<%#Eval("Product_Weight")+"G" %>'></asp:TextBox>
                    </div>

                </div>
                <div class="col-12 col-lg-4 d-flex flex-column justify-content-center align-items-center ">
                    <h3 class="p-3">SAR<%#Eval("Product_Price") %></h3>
                    <label>Quantity:</label>
                    <asp:TextBox ID="Quantity" value="1" min="1" max="5" CssClass="my-3 rounded-pill" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:LinkButton ID="btnAddtoCart" CssClass="btn btn-primary rounded-pill my-3" OnClick="btnAddtoCart_Click" runat="server">Add To cart</asp:LinkButton>
                </div>
                <hr/>
            </div>
            <div class="row">
                <div class="col-12">
                    <h2>About This Product</h2>
                    <p class="w-75"><%# Eval("Product_Desc") %></p>
                </div>
            </div>
        </div>

              </ItemTemplate>
                </asp:Repeater>

        </div>

     <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
