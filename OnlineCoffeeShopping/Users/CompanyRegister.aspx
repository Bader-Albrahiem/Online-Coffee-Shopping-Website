<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompanyRegister.aspx.cs" Inherits="OnlineCoffeeShopping.CompanyRegister" %>
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
                <h3>CREATE YOUR OWN BUSNIESS</h3>
            </div>
            <div class="col-6 right-col p-4 mx-sm-auto">
                <p>Company name  <asp:CustomValidator ID="CustomValidator5" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtCompanyName" OnServerValidate="CustomValidator5_ServerValidate" ErrorMessage=""></asp:CustomValidator></p>
                <asp:TextBox ID="TxtCompanyName" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
              
                <p>Username</p>
                <asp:TextBox ID="TxtUserName" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtUserName" ErrorMessage="" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                <p>Email</p>
                <asp:TextBox ID="TxtEmail" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" ValidateEmptyText="true" ErrorMessage="" ControlToValidate="TxtEmail" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                <p>Country</p>
                <asp:DropDownList ID="DrpCcuntry"  CssClass="rounded-pill data-entry" runat="server">
                    <asp:ListItem>Select Country</asp:ListItem>
                    <asp:ListItem>Saudi Arabia</asp:ListItem>
                    <asp:ListItem>UAE</asp:ListItem>
                    <asp:ListItem>Kuwait</asp:ListItem>
                    <asp:ListItem>Oman</asp:ListItem>
                    <asp:ListItem>Bahrain</asp:ListItem>
                    <asp:ListItem>Qatar</asp:ListItem>
                </asp:DropDownList>
                <asp:CustomValidator ID="CustomValidator6" runat="server" ErrorMessage="" ValidateEmptyText="true" ControlToValidate="DrpCcuntry" ForeColor="Red" OnServerValidate="CustomValidator6_ServerValidate"></asp:CustomValidator>
                <p>Password</p>
                <asp:TextBox ID="TxtPssword" CssClass="rounded-pill data-entry" TextMode="Password" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtPssword" ErrorMessage="" OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
                <p>Re-enter Password</p>
                <asp:TextBox ID="TxtReEnterPassword" CssClass="rounded-pill data-entry" TextMode="Password" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator4" runat="server" ForeColor="Red" ValidateEmptyText="true" ControlToValidate="TxtReEnterPassword" ErrorMessage="" TOnServerValidate="CustomValidator4_ServerValidate"></asp:CustomValidator>
                <br/>
                <asp:Button ID="btnReg" CssClass="btn btn-primary rounded-pill btn-cs" runat="server" Text="Register" OnClick="btnReg_Click" />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <div class="row my-4 my-sm-0 down-content">
                    <div class="col-12 d-block my-3 text-center login-links">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Login.aspx">Already have an account?</asp:HyperLink>
                        <br/>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Users/Register.aspx">Create personal account?</asp:HyperLink>
                    </div> 
                </div>
            </div>
        </div>
      </div>
    </div>
        <script src="../Scripts/bootstrap.bundle.min.js"></script>
    
</asp:Content>
