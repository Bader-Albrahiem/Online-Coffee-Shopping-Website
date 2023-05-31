<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="OnlineCoffeeShopping.Users.Company.CheckOut" %>

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

                            <div class="col-12 d-flex justify-content-center align-items-center flex-column">
                                <div class="Poroduct-deatils w-50">

                                    <div class="input-group">
                                        <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Name" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="red" ValidationGroup="ChOut" ControlToValidate="txtName" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtPhone" CssClass="form-control px-3" placeholder="Phone Number" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ValidationGroup="ChOut" ControlToValidate="txtPhone" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="input-group my-2">
                                        <asp:DropDownList ID="drpCountry" CssClass=" btn btn-outline-secondary dropdown-toggle" runat="server">
                                            <asp:ListItem CssClass="dropdown-item">Select Country</asp:ListItem>
                                            <asp:ListItem CssClass="dropdown-item">Saudi Arabia</asp:ListItem>
                                            <asp:ListItem CssClass="dropdown-item">UAE</asp:ListItem>
                                            <asp:ListItem CssClass="dropdown-item">Kuwait</asp:ListItem>
                                            <asp:ListItem CssClass="dropdown-item">Oman</asp:ListItem>
                                            <asp:ListItem CssClass="dropdown-item">Bahrain</asp:ListItem>
                                            <asp:ListItem CssClass="dropdown-item">Qatar</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtCity" ValidationGroup="ChOut" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtAddress" ValidationGroup="ChOut" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtZipcode" CssClass="form-control" placeholder="Zip code" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtZipcode" ValidationGroup="ChOut" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </div>

                                </div>
                            </div>
                            <div class="col-12 d-flex justify-content-center align-items-center flex-column mt-4">
                                <div class="Poroduct-deatils w-50">
                                    <h5 class="text-dark fw-bold">Order Summery</h5>
                                    <asp:Repeater ID="CheckOutRPTR" runat="server">
                                        <ItemTemplate>
                                            <p><%#Eval("ProductName") %></p>
                                            <p>Qunatity:<%#Eval("Quantity") %></p>
                                            <p>Unit Price: <%#Eval("TotalPrice") %></p>
                                            <hr />
                                        </ItemTemplate>
                                    </asp:Repeater>

                                  
                                    <p> <asp:Label ID="Shippinglbl" runat="server" Text=""></asp:Label> </p>
                                   
                                    <p>
                                        <asp:Label ID="SubtotalLBl" runat="server" Text=""></asp:Label></p>
                                    <p>
                                        <asp:Label ID="TaxLbl" runat="server" Text=""></asp:Label></p>
                                    <p>
                                        <asp:Label ID="LblTotal" runat="server" Text=""></asp:Label></p>

                                    <div class="input-group mb-3 w-50">
                                        <asp:TextBox ID="TxtPromo" CssClass="form-control" placeholder="Promo Code" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:ImageButton ID="CheckoutImageBtn" ValidationGroup="ChOut" ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"
                                        Width="145" AlternateText="Check out with PayPal"
                                        OnClick="CheckoutBtn_Click"
                                        BackColor="Transparent" BorderWidth="0"
                                        runat="server" />
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
