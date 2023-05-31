<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="OnlineCoffeeShopping.CompanyProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid Company-Profile-cont">
        <div class="row flex-nowrap">
            <div class="col-auto col-md-3 col-xl-2 px-2 px-0 side-bar-wrapper">
                <div class="d-flex flex-column align-items-center ms-2 align-items-sm-start px-3 pt-2">
                    <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto side-bar-header disabled">
                        <span class="fs-5 d-none d-sm-inline">Profile</span>
                    </a>
                    <ul class="nav  flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                        <li class="nav-item">
                            <a href="#" class="nav-link align-middle px-0 active" id="Profile-contentHead">
                                <i class="bi bi-person-fill"></i>
                                <span class="ms-1 d-none d-sm-inline">My Profile</span>
                            </a>
                        </li>
                        <li>
                            <a href="#submenu3" data-bs-toggle="collapse" id="Product-contenHead" class="nav-link px-0 align-middle">
                                <i class="bi bi-bag-check-fill"></i>
                                <span class="ms-1 d-none d-sm-inline">My Products</span> </a>
                        </li>
                        <li>
                            <a href="#submenu3" data-bs-toggle="collapse" id="NewProductHead" class="nav-link px-0 align-middle">
                                <i class="bi bi-cart-plus"></i><span class="ms-1 d-none d-sm-inline">New Product</span> </a>
                        </li>
                        <li>
                            <a href="#submenu3" data-bs-toggle="collapse" id="OrderHead" class="nav-link px-0 align-middle">
                                <i class="bi bi-basket3"></i><span class="ms-1 d-none d-sm-inline">Orders</span> </a>
                        </li>
                        <li>
                            <a href="#submenu3" data-bs-toggle="collapse" id="MyOrderHead" class="nav-link px-0 align-middle">
                               <i class="bi bi-bag"></i><span class="ms-1 d-none d-sm-inline">My Order</span> </a>
                        </li>
                        <li>
                            <a href="#submenu3" data-bs-toggle="collapse" id="ReportHead" class="nav-link px-0 align-middle">
                                <i class="bi bi-exclamation-diamond-fill"></i><span class="ms-1 d-none d-sm-inline">Report a problem</span> </a>
                        </li>

                    </ul>
                    <hr>
                </div>
            </div>
            <div class="col  data-sidebar">
                <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>
                <div class="row data-wrapper  bg-white active" id="Profile-content">
                    <div class="col-12 col-lg-6  d-flex flex-column  justify-content-center align-items-center">
                        <div class="text-start">
                            <h2>Personal inforamiton</h2>
                            <p><i class="bi bi-person-vcard-fill me-1"></i>Username</p>
                            <asp:TextBox ID="TxtUsername" ReadOnly="true" ValidationGroup="CINFO" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                            <p>
                                <i class="bi bi-envelope-fill me-1"></i>Email
                                <br />
                                <asp:CustomValidator ID="CustomValidator4" ValidateEmptyText="true" ControlToValidate="TxtEmail" ValidationGroup="CINFO" OnServerValidate="CustomValidator4_ServerValidate" runat="server" ForeColor="Red" ErrorMessage=""></asp:CustomValidator>
                            </p>
                            <asp:TextBox ID="TxtEmail" ReadOnly="true" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                            <p>
                                <i class="bi bi-person"></i>First-name
                                <asp:CustomValidator ID="CustomValidator5" ValidateEmptyText="true" ControlToValidate="TxtFirstName" ValidationGroup="CINFO" OnServerValidate="CustomValidator5_ServerValidate" runat="server" ForeColor="Red" ErrorMessage=""></asp:CustomValidator>
                            </p>
                            <asp:TextBox ID="TxtFirstName" ReadOnly="true" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                            <br />
                            <p>
                                <i class="bi bi-person me-1"></i>Last-name  
                                <asp:CustomValidator ID="CustomValidator6" ValidateEmptyText="true" ControlToValidate="TxtLasName" ValidationGroup="CINFO" runat="server" ForeColor="Red" OnServerValidate="CustomValidator6_ServerValidate" ErrorMessage=""></asp:CustomValidator>
                            </p>
                            <asp:TextBox ID="TxtLasName" ReadOnly="true" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                            <br />
                            <asp:Button ID="BtnEdit" CssClass="btn btn-primary btn-cs" Visible="true" runat="server" Text="Edit" OnClick="BtnEdit_Click" />
                            <asp:Button ID="BtnUpdate" CssClass="btn btn-primary btn-cs" Visible="false" ValidationGroup="CINFO" runat="server" Text="Update" OnClick="BtnUpdate_Click" />
                            <br />
                            <asp:Button ID="BtnCancelInfo" OnClick="BtnCancelInfo_Click" CssClass="btn btn-primary btn-cs" Visible="false" runat="server" Text="Cancel" />
                        </div>
                    </div>
                    <div class="col-12 col-lg-6 mt-4 d-flex flex-column  justify-content-center align-items-center">
                        <div class="text-start">
                            <h2>Change password</h2>
                            <p><i class="bi bi-key-fill me-1"></i>Enter new password</p>
                            <asp:TextBox ID="TxtNewPassword" CssClass="rounded-pill data-entry" TextMode="Password" runat="server"></asp:TextBox>
                            <br />
                            <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" ValidationGroup="CPWD" OnServerValidate="CustomValidator2_ServerValidate" ControlToValidate="TxtNewPassword" ForeColor="Red" runat="server" ErrorMessage=""></asp:CustomValidator>
                            <p><i class="bi bi-key-fill me-1"></i>Re-enter new password</p>
                            <asp:TextBox ID="TxtReEnterPassword" CssClass="rounded-pill data-entry" TextMode="Password" runat="server"></asp:TextBox>
                            <br />
                            <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" ValidationGroup="CPWD" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="TxtReEnterPassword" ForeColor="Red" runat="server" ErrorMessage=""></asp:CustomValidator>
                            <p><i class="bi bi-file-earmark-lock-fill me-1"></i>Enter old password</p>
                            <asp:TextBox ID="TxtOldPassword" CssClass="rounded-pill data-entry" TextMode="Password" runat="server"></asp:TextBox>
                            <br />
                            <asp:CustomValidator ID="CustomValidator3" runat="server" ForeColor="Red" ValidateEmptyText="true" OnServerValidate="CustomValidator3_ServerValidate" ControlToValidate="TxtOldPassword" ValidationGroup="CPWD" ErrorMessage=""></asp:CustomValidator>
                            <br />
                            <asp:Button ID="BtnChangePass" CssClass="btn btn-primary btn-cs" OnClick="BtnChangePass_Click" ValidationGroup="CPWD" runat="server" Text="Change Password" />
                        </div>
                    </div>
                </div>
                <div class="row data-wrapper bg-white" id="Product-content">
                    <asp:Repeater ID="MyprodRpeater" runat="server" OnItemCommand="MyprodRpeater_itemcommand">
                        <ItemTemplate>
                            <div class="col-11 col-lg-8 mx-auto">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="row border mb-3">
                                            <asp:Button ID="EditBtnProd" runat="server" UseSubmitBehavior="false" CommandName="EditBtnProd" CommandArgument="test1" CssClass="btn btn-primary Product-config rounded-pill" Text="Edit" />
                                            <asp:Button ID="UpdateProdBtn" runat="server" UseSubmitBehavior="false" CommandName="UpdateProdBtn" CommandArgument='<%#Eval ("Product_Id")%>' Visible="false" CssClass="btn btn-primary Product-config rounded-pill" ValidationGroup="UPDPROD" Text="Update" />
                                            <asp:Button ID="CancelBtn" UseSubmitBehavior="false" CommandName="CancelProdBtn" Visible="false" CssClass="btn btn-primary Product-config rounded-pill" ValidationGroup="UPDPROD" runat="server" Text="Cancel" />
                                            <asp:Button ID="DeleteBtnProd" runat="server" UseSubmitBehavior="false" CommandName="DeleteBtnProd" CommandArgument='<%#Eval ("Product_Id") %>' CssClass="btn btn-primary Product-config rounded-pill" Text="Delete" />
                                            <p>Category:<%#Eval("Category") %></p>
                                            <div class="col-12 col-lg-3">
                                                <p>Proudct name:<asp:CustomValidator ID="CustomValidator16" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtProudctEdit" ValidationGroup="UPDPROD" ErrorMessage=""></asp:CustomValidator><asp:TextBox ID="TxtProudctEdit" CssClass="form-control" ReadOnly="true" Text='<%#Eval("Product_Name") %> ' runat="server"></asp:TextBox></p>
                                            </div>
                                            <div class="col-12 col-lg-3">
                                                <p>weight:<asp:CustomValidator ID="CustomValidator17" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtWeightEdit" ValidationGroup="UPDPROD" ErrorMessage=""></asp:CustomValidator><asp:TextBox ID="TxtWeightEdit" TextMode="Number" CssClass="form-control w-50" ReadOnly="true" runat="server" Text='<%#Eval("Product_Weight") %>'></asp:TextBox></p>
                                            </div>
                                            <div class="col-12 col-lg-3">
                                                <p>
                                                    Price:<asp:CustomValidator ID="CustomValidator18" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtPriceEdit" ValidationGroup="UPDPROD" ErrorMessage=""></asp:CustomValidator>
                                                    <asp:TextBox ID="TxtPriceEdit" TextMode="Number" CssClass="form-control w-50" ReadOnly="true" Text='<%#Eval("Product_Price") %>' runat="server"></asp:TextBox>
                                                </p>
                                            </div>
                                            <div class="col-12 col-lg-3">
                                                <p>
                                                    Quantity:<asp:CustomValidator ID="CustomValidator19" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtQuantittyEdit" ValidationGroup="UPDPROD" ErrorMessage=""></asp:CustomValidator>
                                                    <asp:TextBox ID="TxtQuantittyEdit" TextMode="Number" CssClass="form-control w-50" ReadOnly="true" Text='<%#Eval("Product_Quantity")%>' runat="server"></asp:TextBox>
                                                </p>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="row justify-content-center align-items-center data-wrapper bg-white" id="NewProduct">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="col-12 col-lg-8">

                                <div class="input-group">
                                    <span class="input-group-text" id="basic-addon1">Product Name 
                                        <asp:CustomValidator ID="CustomValidator7" runat="server" ForeColor="Red" ErrorMessage="" ValidateEmptyText="true" ValidationGroup="NPROD" ControlToValidate="TxtProdName" OnServerValidate="CustomValidator7_ServerValidate"></asp:CustomValidator></span>
                                    <asp:TextBox ID="TxtProdName" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                                <div class="input-group">
                                    <span class="input-group-text" id="basic-addon1">Category 
                                        <asp:CustomValidator ID="CustomValidator8" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="DrpNewProdCate" ValidationGroup="NPROD" OnServerValidate="CustomValidator8_ServerValidate" ErrorMessage=""></asp:CustomValidator></span>
                                    <asp:DropDownList ID="DrpNewProdCate" CssClass="btn btn-outline-secondary dropdown-toggle" runat="server">
                                        <asp:ListItem Selected="True" Value="S"> Select Category</asp:ListItem>
                                        <asp:ListItem>Coffee beans</asp:ListItem>
                                        <asp:ListItem>Espresso machines</asp:ListItem>
                                        <asp:ListItem>Grinders</asp:ListItem>
                                        <asp:ListItem>Barista-gear</asp:ListItem>
                                        <asp:ListItem>Brewing</asp:ListItem>
                                        <asp:ListItem>Filter</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="input-group">
                                    <span class="input-group-text">Price
                                        <asp:CustomValidator ID="CustomValidator9" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtProdPrice" ValidationGroup="NPROD" OnServerValidate="CustomValidator9_ServerValidate" ErrorMessage=""></asp:CustomValidator></span>
                                    <asp:TextBox ID="TxtProdPrice" CssClass="form-control" aria-label="Amount (to the nearest dollar)" runat="server"></asp:TextBox>

                                    <span class="input-group-text">.00</span>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-text">Weight 
                                        <asp:CustomValidator ID="CustomValidator10" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="WEG1" ValidationGroup="NPROD" OnServerValidate="CustomValidator10_ServerValidate" ErrorMessage=""></asp:CustomValidator></span>
                                    <asp:TextBox ID="WEG1" CssClass="form-control" runat="server"></asp:TextBox>

                                    <span class="input-group-text">G</span>
                                    <asp:TextBox ID="txtQunatity" CssClass="form-control" runat="server"></asp:TextBox>
                                    <span class="input-group-text">Qunatity</span>
                                </div>

                                <div class="input-group">
                                    <span class="input-group-text">Product image
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="inputGroupFile02" ValidationGroup="NPROD" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></span>
                                    <asp:FileUpload ID="inputGroupFile02" CssClass="form-control" runat="server" BackColor="White" />
                                </div>
                                <div class="input-group">
                                    <span class="input-group-text">Product description
                                        <asp:CustomValidator ID="CustomValidator12" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtProdDescription" ValidationGroup="NPROD" OnServerValidate="CustomValidator12_ServerValidate" ErrorMessage=""></asp:CustomValidator></span>
                                    <asp:TextBox ID="TxtProdDescription" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="input-group">
                                    <asp:Button ID="AddNewProdBtn" OnClick="AddNewProdBtn_Click" CssClass="btn btn-outline-secondary" ValidationGroup="NPROD" runat="server" Text="Add new product" />
                                    <br />
                                    <asp:Label ID="lblNewProd" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="AddNewProdBtn" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="row data-wrapper bg-white" id="Orders">
                    <div class="col-12 col-lg-8 mx-sm-auto">
                        <div class="row">

                            <asp:Repeater ID="OrdersReapter" EnableViewState="false" OnItemCommand="OrdersReapter_ItemCommand" runat="server">
                                <ItemTemplate>
                                    <div class="col-12 border mb-3">
                                        <h3>Product informaiton</h3>
                                        <table class="table table-bordered ">

                                            <tr>
                                                <th class="table-light">Customer name</th>
                                                <td><%#Eval("Username") %></td>
                                            </tr>
                                            <tr>

                                                <th class="table-light">Price</th>
                                                <td><%#Eval("Total_Price") %></td>
                                            </tr>
                                            <tr>
                                                <th class="table-light">Order Name</th>
                                                <td><%#Eval("Product_Name") %></td>
                                            </tr>
                                            <tr>
                                                <th class="table-light">weight</th>
                                                <td><%#Eval("Order_Weight") %></td>
                                            </tr>
                                            <tr>

                                                <th class="table-light">Order date</th>
                                                <td><%#Eval("Order_date") %></td>
                                            </tr>
                                            <tr>
                                                <th class="table-light">Quantity</th>
                                                <td><%#Eval("Order_Quantity") %></td>
                                            </tr>

                                        </table>
                                        <h3>Shipping informaiton</h3>
                                        <table class="table table-bordered">

                                            <tr>
                                                <th class="table-light">Country</th>
                                                <td><%#Eval("CustomerCountry") %></td>




                                            </tr>

                                            <tr>
                                                <th class="table-light">City</th>
                                                <td><%#Eval("CustomerCity") %></td>



                                            </tr>
                                            <tr>
                                                <th class="table-light">Address</th>
                                                <td><%#Eval("CustomerAddress") %></td>
                                            </tr>
                                            <tr>
                                                <th class="table-light">Zip Code</th>
                                                <td><%#Eval("CustomerZipCode") %></td>
                                            </tr>
                                            <tr>
                                                <th class="table-light">Order Stauts</th>
                                                <td><%#Eval("Order_Status") %></td>
                                            </tr>

                                        </table>
                                        <asp:Button ID="ShippingBtn" CssClass="btn btn-outline-danger mb-3" UseSubmitBehavior="false" CommandName="UpdateStatus" CommandArgument='<%#Eval("Order_Id") %>' Visible='<%#Eval("Order_Status").ToString().ToLower() != "shipping" ? true : false %>' runat="server" Text="Shipping" />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>

                </div>
                <div class="row data-wrapper bg-white" id="MyOrders">
                    <div class="col-12 col-lg-8 mx-sm-auto">
                        <div class="row">
                            <div class="container-fluid cart-wrapper bg-white p-3">
                                <div class="container bg-white">
                                    <div class="row py-3">
                                        <div class="col-12">
                                            <h2 class="py-3 border-bottom">My Orders</h2>
                                        </div>
                                    </div>
                                    <div class="row d-block d-lg-flex position-relative">
                                        <asp:Label ID="Avliablelbl" CssClass="col-12 text-center" runat="server" Text="No Orders Avaliable." Font-Size="X-Large"></asp:Label>
                                        <asp:Repeater ID="CompanyOrder" runat="server">
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
                                                                <p>SAR<%#Eval("Total_Price")%></p>
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
                        </div>
                    </div>
                </div>
                <div class="row data-wrapper" id="Report">
                    <div class="col-12 col-lg-6 mx-sm-auto">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <div class="input-group">
                                    <span class="input-group-text" id="basic-addon1">@
                                        <asp:CustomValidator ID="CustomValidator15" runat="server" ForeColor="Red" ControlToValidate="TxtReportUserName" ValidateEmptyText="true" ValidationGroup="RPINO" ErrorMessage="" OnServerValidate="CustomValidator15_ServerValidate"></asp:CustomValidator></span>
                                    <asp:TextBox ID="TxtReportUserName" CssClass="form-control" PlaceHolder="Username" runat="server"></asp:TextBox>
                                </div>

                                <div class="input-group">
                                    <asp:TextBox ID="TxtReportEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                    <span class="input-group-text" id="basic-addon2">Email
                                        <asp:CustomValidator ID="CustomValidator14" runat="server" ForeColor="Red" ControlToValidate="TxtReportEmail" ValidateEmptyText="true" ValidationGroup="RPINO" ErrorMessage="" OnServerValidate="CustomValidator14_ServerValidate"></asp:CustomValidator></span>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-text">Problem deatils
                                        <asp:CustomValidator ID="CustomValidator13" runat="server" ForeColor="Red" ControlToValidate="TxtReportDesc" ValidateEmptyText="true" ValidationGroup="RPINO" ErrorMessage="" OnServerValidate="CustomValidator13_ServerValidate"></asp:CustomValidator></span>
                                    <asp:TextBox ID="TxtReportDesc" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="input-group">
                                    <asp:Button ID="SendRptBtn" CssClass="btn btn-primary mt-5" ValidationGroup="RPINO" OnClick="SendRptBtn_Click" runat="server" Text="Send" />
                                    <asp:Label ID="ReportText" CssClass="ms-2" runat="server" Text=""></asp:Label>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../Scripts/menu.js"></script>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.min.js"></script>

</asp:Content>
