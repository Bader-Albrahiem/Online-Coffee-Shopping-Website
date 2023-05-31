<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineCoffeeShopping.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="Login-Content">
        <div class="LoginWrapper mb-3">
        <div class="row align-items-center justify-content-center LoginContent">
            <div class="col-4 left-col mx-sm-auto">
                <h3>REGISTER</h3>
            </div>
            <div class="col-6 right-col p-4 mx-sm-auto">
                <p>Username</p>
                <asp:TextBox ID="TxtUserName" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" ForeColor="Red" ControlToValidate="TxtUserName" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" runat="server" ErrorMessage="" ></asp:CustomValidator>
                <p>Email</p>
                <asp:TextBox ID="TxtEmail" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" ControlToValidate="TxtEmail" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ErrorMessage=""></asp:CustomValidator>
                <p>Password</p>
                <asp:TextBox ID="TxtPassword" CssClass="rounded-pill data-entry" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ForeColor="Red" ControlToValidate="TxtPassword" ValidateEmptyText="true" OnServerValidate="CustomValidator3_ServerValidate" ErrorMessage=""></asp:CustomValidator>
                <p>Re-enter Password</p>
                <asp:TextBox ID="TxtReEnterPassword" CssClass="rounded-pill data-entry" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator4" runat="server" ForeColor="Red" ControlToValidate="TxtReEnterPassword" ValidateEmptyText="true" OnServerValidate="CustomValidator4_ServerValidate" ErrorMessage=""></asp:CustomValidator>
                <br/>
                <asp:Button ID="BtnReister" CssClass="btn btn-primary rounded-pill btn-cs" runat="server" Text="Register" OnClick="BtnReister_Click" />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <div class="row my-4 my-sm-0 down-content">
                    <div class="col-12 d-block my-3 text-center login-links">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Already have an account?</asp:HyperLink>
                        <br/>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Users/CompanyRegister.aspx">Create business account?</asp:HyperLink>
                     
                    </div> 
                </div>
            </div>
        </div>
      </div>
    </div>
       <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
