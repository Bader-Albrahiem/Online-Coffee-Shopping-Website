<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineCoffeeShopping.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="Login-Content">
        <div class="LoginWrapper">
        <div class="row align-items-center justify-content-center LoginContent">
            <div class="col-4 left-col mx-sm-auto">
                <h3>Login</h3>
            </div>
            <!------------- Input -------------------->
            <div class="col-6 right-col p-4 mx-sm-auto">
                <p>Username</p>
                <asp:TextBox ID="TxtUserName" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="red"  ValidationGroup="LgnBtn" ControlToValidate="TxtUserName" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ErrorMessage=""></asp:CustomValidator>
                <p>Password</p>
                <asp:TextBox ID="TxtPassowrd" CssClass="rounded-pill data-entry" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="" ValidationGroup="LgnBtn" ControlToValidate="TxtPassowrd" ValidateEmptyText="true" Visible="true" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                <br/>
                <asp:Button ID="BtnLogin" CssClass="btn btn-primary rounded-pill btn-cs"  ValidationGroup="LgnBtn" runat="server" Text="Login" OnClick="BtnLogin_Click" />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <div class="row my-4">
                    <div class="col-12 d-inline-block login-links">
                        <asp:HyperLink ID="DHaveAcc" runat="server" NavigateUrl="~/Users/Register.aspx">Don't have an account?</asp:HyperLink>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Users/ForgetPassword.aspx">Forget Password?</asp:HyperLink>
                    </div> 
                </div>
            </div>
        </div>
      </div>
    </div>
      <script src="Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
