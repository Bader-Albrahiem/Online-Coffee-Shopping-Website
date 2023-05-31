<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OnlineCoffeeShopping.Users.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Login-Content">
        <div class="LoginWrapper">
            <div class="row align-items-center justify-content-center LoginContent">
                <div class="col-4 left-col mx-sm-auto">
                    <h3>Reset Password</h3>
                </div>
                <!------------- Input -------------------->
                <div class="col-6 right-col p-4 mx-sm-auto">
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtNewPassword" ValidationGroup="LgnBtn" ForeColor="Red" ErrorMessage="Please enter Password."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtNewPassword" ValidationGroup="LgnBtn" ForeColor="Red" ErrorMessage="Please enter Strong password." ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?!.*(.)\1\1)[a-zA-Z0-9@]{6,12}$"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="TxtNewPassword"  placeholder="Enter new password" TextMode="Password" CssClass="rounded-pill data-entry" runat="server">  </asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToValidate="txtReEnter" ValidationGroup="LgnBtn" ControlToCompare="TxtNewPassword" ErrorMessage="Password not match." ForeColor="Red"></asp:CompareValidator>
                    <asp:TextBox ID="txtReEnter" placeholder="ReEnter new password" TextMode="Password" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>  
                 
                  <asp:Button ID="Resetpassword" CssClass="btn btn-primary rounded-pill btn-cs" ValidationGroup="LgnBtn" OnClick="Resetpassword_Click" runat="server" Text="Change password" />
                    <asp:Label ID="lblPasswordchanged" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
