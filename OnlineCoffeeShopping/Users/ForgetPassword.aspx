<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="OnlineCoffeeShopping.Users.ForgetPassword" %>

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
                   
                    <p>Enter Email</p>
                    <asp:TextBox ID="TxtEmail" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail" ValidationGroup="rstBtn" ForeColor="Red" ErrorMessage="Please enter correct email." ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtEmail" ValidationGroup="rstBtn" ForeColor="Red" ErrorMessage="Please enter email."></asp:RequiredFieldValidator>
                     <div class="box">
                         <asp:LinkButton ID="resetbtn"  CssClass="button rounded-pill" OnClick="resetbtn_Click" ValidationGroup="rstBtn" runat="server" PostBackUrl="#ResetPassword">Reset password</asp:LinkButton>
                    </div>
                    <div id="ResetPassword" class="overlay">
                        <div class="popup">
                            <p>Please check your email. <br /> We have sent for you a link to reset your password.</p>
                            <p>Thank you!</p>
                            <a class="close" href="#">&times;</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
