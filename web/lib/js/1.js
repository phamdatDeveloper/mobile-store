$(function() {
    var $a = $(".tabs li");
    $a.click(function() {
        $a.removeClass("active");
        $(this).addClass("active");
    });
});

$('#button-scroll-to-Top').on('click', function(e) {
    $('html, body').animate({scrollTop:0}, '300');
});


function myFunction() {
    var dots = document.getElementById("dots");
    var moreText = document.getElementById("more");
    var btnText = document.getElementById("btn");

    if (dots.style.display === "none") {
        moreText.style.display = "none";
    } else {
        dots.style.display = "none";
        moreText.style.display = "block";
    }
}
