
$(".sort li").click(function () {


    if ($(this).text() == 'Lowest to highest') {
        sortProductsPriceAscending();
    }
    else if ($(this).text() == 'Highest to lowest') {
        sortProductsPriceDescending();
    }

});

function getAmount(price) {
    return parseFloat(price.replace('SAR', ''));
}

function sortProductsPriceAscending() {

    var products = $('.list li');
    products.sort(function (a, b) { return getAmount($(a).find('.price').text()) - getAmount($(b).find('.price').text()) });

    $(".Product-Cont .list").empty().append(products);

}

function sortProductsPriceDescending() {
    var products = $('.list li');
    products.sort(function (a, b) { return getAmount($(b).find('.price').text()) - getAmount($(a).find('.price').text()) });
    $(".Product-Cont .list").empty().append(products);

}