<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OnlineCoffeeShopping.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
     <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="Content">
      <!-- Landing start ---------------------------------->
     <div class="landing">
        <div id="carouselExampleCaptions" class="carousel slide">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="img/1.jpg" class="d-block w-100" alt="...">
              <div class="carousel-caption">
                <h5>The Perfect Coffee, Every Time</h5>
                <p>Featuring the world's best coffee roasters to help you achieve the perfect batch each and everytime.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="img/2.jpg" class="d-block w-100" alt="...">
              <div class="carousel-caption">
                <h5>Your Top Coffee Specialist</h5>
                <p>we're looking for the same things that you are when it comes to coffee; high quality.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="img/3.jpg" class="d-block w-100" alt="...">
              <div class="carousel-caption ">
                <h5>The place to find your next home coffee roaster</h5>
                <p>We understand the dedication and passion behind investing in your coffee..</p>
              </div>
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
      <!--End of landing----------------------------->

      <div class="container-fluid Product-Demo">
        <div class="row Product-Demo-Continer p-1 p-lg-5">
          <div class="col-12 col-lg-4 mb-lg-0 mb-3">
            <img src="img/Mechine.jfif"  class="d-block w-100 h-100" alt="...">
          </div>
          <div class="col-12 col-lg-8 ">
            <div class="row">
              <div class="col-12">
                <img src="img/MechineNtools.jfif" height="500px" class="w-100" alt="...">
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-6">
                <img src="img/Esp.jfif" class="d-block w-100" alt="...">
              </div>
              <div class="col-6">
                <img src="img/CoffeeMachine.jfif" class="d-block w-100" alt="...">
              </div>
            </div>
          </div>
        </div>
      </div>
     <!--Join us Start ------------------------------>
      <div class="joinus-sec">
      <div class="landing d-flex justify-content-center align-items-center">
        <div class="text-center text-dark">
        <h2>SHARE YOUR OWN PRODUCT NOW!</h2>
        <asp:HyperLink ID="HyperLink1" CssClass="btn btn-primary my-4 px-5 rounded-pill" runat="server" NavigateUrl="~/Users/Register.aspx">Join us!</asp:HyperLink>
       </div>
      </div>
    </div>

      <!--Join us End --------------------------------->
       <!--Products start----------------------------->
       <div class="Products-Content">
        <div class="row gx-0 position-relative" id="Products">
          <div class="col-12 col-lg-6">
            <img src="img/clodbrew.jpg" alt="">
          </div>
          <div class="col-12 col-lg-6  text-center m-auto" id="right">
            <div class="text-data">
            <h3>MAKE YOUR OWN CREATIONS</h3>
            <p>COLD BREW COFFEE CONCENTRATE</p>
            </div>
          </div>
        </div>
        <div class="row gx-0 position-relative" id="Products">
          <div class="col-12 col-lg-6 text-center m-auto" id="right">
            <div class="text-data">
            <h3>COFFEE AND MORE!</h3>
            </div>
          </div>
          <div class="col-12 col-lg-6">
            <img src="img/pfilter.jpg" alt="">
          </div>
        </div>
        </div>
       <!--Products End ------------------------------->

       <!----Subscribe start ---------------------------->
       <div class="Sub">
        <div class="row justify-content-center align-items-center gx-0">
          <div class="col-8">
            <div class="text-center mb-4">
            <p>STAY IN THE LOOP</p>
            <h3>SUBSCRIBE TO OUR NEWSLETTER</h3>
            </div>
          </div>
        </div>
      
        <div class="subscribe-content overflow-hidden">
           
            <!-- ---------------------------------Input ------------------------>
            <div class="row  subscribe">
               <div class="col-12 text-center">
              <p class="text-center">Email</p>
                <asp:TextBox ID="txtEmail" CssClass="rounded-pill data-entry" runat="server"></asp:TextBox>
                <BR />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="mt-3" ForeColor="Red" runat="server" ErrorMessage="Please enter email." ClientIDMode="Inherit" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                   <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ControlToValidate="txtEmail" runat="server" ErrorMessage="Please enter correct email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   <asp:Label ID="lblInsert" CssClass="text-center" runat="server" Text=""></asp:Label>
            </div>
            <div class="mb-3 text-center">
                <asp:Button ID="BtnNWL" CssClass="btn btn-primary rounded-pill btn-cs" OnClick="BtnNWL_Click" runat="server" Text="Subscribe" />
          </div>
                </div>
        </div>
       </div>
       </div>
       <!---------Subscribe end ---------------------------->
    <script src="Scripts/bootstrap.bundle.min.js"></script>

</asp:Content>
