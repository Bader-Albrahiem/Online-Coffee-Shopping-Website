<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUS.aspx.cs" Inherits="OnlineCoffeeShopping.Users.AboutUS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid aboutUs">
         <div class="container bg-white">
             <div class="row">
                 <div class="col-12 mt-3 p-3">
                     <h2 class="text-center border-bottom">About SpecialtyCoffee</h2>
                 </div>
                 <div class="col-12">
                     <h4 class="m-3 p-3">Is the place to find your next home coffee roaster and thier machines. Our catalog of high quality coffee roasters will help you find exactly what you need.
                         <br />
                         <br />
                For over 2 years now we have been working diligently with the most well known names in coffee roasting so you can make the best decision for your investment in making your coffee at home.</h4>
                 </div>
                 <div class="col-12 text-center my-5 ">
                     <img src="../img/abtUs.jfif" width:"500px" height="500px"/>
                 </div>
             </div>
             <div class="col-12 justify-content-center align-items-center mb-3">
                 <h4 class="text-center">In addition to providing a variety of coffee blends and brewing methods, we also import and distribute coffee equipment for both home users and commercial use. Our range of equipment includes trusted names such as Hario, Saint Anthony Industries, Handgrind, Frankgreen, Keepcup, Aeropress, Cafflano, and others. We are also distributors of capital coffee equipment, including Synesso, Breville, and Ratio, and we offer sales, after-sales services, and maintenance to ensure that our customers get the best out of their equipment.</h4>
             </div>

         </div>
     </div>
     
     <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
