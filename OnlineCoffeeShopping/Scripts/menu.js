
var MyProfileHead = document.getElementById("Profile-contentHead");
var Myproduct = document.getElementById("Product-contenHead");
var NewProduct = document.getElementById("NewProductHead");
var Report = document.getElementById("ReportHead");
var MyOrder = document.getElementById("MyOrderHead");
var orders = document.getElementById("OrderHead");



    MyProfileHead.addEventListener("click", function(){
        var Content = document.getElementById("Profile-content");
        $('.active:not("Profile-content")').removeClass("active");
        $('.active:not("Profile-contentHead")').removeClass("active");
        Content.classList.toggle("active");
        MyProfileHead.classList.toggle("active");
    });
    Myproduct.addEventListener("click", function(){
        var Content = document.getElementById("Product-content");
       $('.active:not("Product-content")').removeClass("active");
       $('.active:not("Product-contentHead")').removeClass("active");
        Content.classList.toggle("active");
        Myproduct.classList.toggle("active");
    });

    NewProduct.addEventListener("click", function(){
        var Content = document.getElementById("NewProduct");
       $('.active:not("NewProduct")').removeClass("active");
       $('.active:not("NewProductHead")').removeClass("active");
        Content.classList.toggle("active");
        NewProduct.classList.toggle("active");
    });
    Report.addEventListener("click", function(){
        var Content = document.getElementById("Report");
       $('.active:not("Report")').removeClass("active");
       $('.active:not("ReportHead")').removeClass("active");
        Content.classList.toggle("active");
        Report.classList.toggle("active");
    });
    orders.addEventListener("click", function(){
      var Content = document.getElementById("Orders");
     $('.active:not("Orders")').removeClass("active");
     $('.active:not("OrderHead")').removeClass("active");
      Content.classList.toggle("active");
      orders.classList.toggle("active");
    });
MyOrder.addEventListener("click", function () {
    var Content = document.getElementById("MyOrders");
    $('.active:not("MyOrders")').removeClass("active");
    $('.active:not("MyOrderHead")').removeClass("active");
    Content.classList.toggle("active");
    MyOrder.classList.toggle("active");
});


 

  