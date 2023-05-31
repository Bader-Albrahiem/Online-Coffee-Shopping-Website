<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OnlineCoffeeShopping.Users.UserProfile.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="container my-5 py-5">
            <div class="row text-center">
                <div class="col-12">

                    <div class="w-75 mx-auto">
                    <div class="input-group mb-5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="OldPWD" runat="server" ForeColor="Red" ValidationGroup="CHPWD" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="OldPWD" CssClass="form-control" placeholder="Enter old password" runat="server" TextMode="Password"></asp:TextBox>
                    </div>

                    <div class="input-group mb-5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="NewPWD" runat="server" ForeColor="Red" ValidationGroupe="CHPWD" ErrorMessage="*"></asp:RequiredFieldValidator>         
                        <asp:TextBox ID="NewPWD"  CssClass="form-control"  placeholder="Enter new password" runat="server" TextMode="Password"></asp:TextBox>
                     
                    </div>
                           
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="ReNewPwd" ControlToCompare="NewPwd" runat="server"  ValidationGroup="CHPWD" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
                          <div class="input-group">
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ReNewPwd" runat="server" ForeColor="Red" ValidationGroup="CHPWD" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="ReNewPwd" CssClass="form-control" placeholder="ReEnter new password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                      

                    <div class="input-group my-5 w-75 mx-auto">
                        <asp:Button ID="UpdatePass" CssClass="form-control" OnClick="UpdatePass_Click" ValidationGroup="CHPWD" runat="server" Text="Change password" />
                    </div>

                    </div>
                
                </div>
            </div>
        </div>
    </div>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
