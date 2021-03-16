window.onload = function () {
    $('.promotion-section').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        prevArrow: "<img class='a-left control-c prev slick-prev button-arr-slick' src='images/prevArr.png'>",
        nextArrow: "<img class='a-right control-c next slick-next button-arr-slick' src='images/nextArr.png'>"
    });
}


$('#button-scroll-to-Top').on('click', function (e) {
    $('html, body').animate({scrollTop: 0}, '300');
});

$(function () {
    var $a = $(".tabs li");
    $a.click(function () {
        $a.removeClass("active");
        $(this).addClass("active");
    });
});


function changeImage1() {
    var x = document.getElementById("img1").src;

    document.getElementById("img-lager").src = x;
}

function changeImage2() {
    var x = document.getElementById("img2").src;
    document.getElementById("img-lager").src = x;
}

function changeImage3() {
    var x = document.getElementById("img3").src;
    document.getElementById("img-lager").src = x;
}

function changeImage4() {
    var x = document.getElementById("img4").src;
    document.getElementById("img-lager").src = x;
}




