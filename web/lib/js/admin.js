$(function () {
    $("#accordion").accordion({
        collapsible: true
    });
});

$(document).ready(function() {
    $('#table-info-news').DataTable();
} );

function openCity(evt, pagenumber) {
    var i, tabcontent, tablinks;
    if(pagenumber =="product_manager_info"){
        $(document).ready(function() {
            $('#table-info-product').DataTable();
        } );
    }else if(pagenumber =="order_manager_info"){
        $(document).ready(function() {
            $('#table-info-order').DataTable();
        } );
    }
    else if(pagenumber == "user_manager_info"){
        $(document).ready(function() {
            $('#table-info').DataTable();
        } );
    }else if(pagenumber == "news_manager_info"){
        $(document).ready(function() {
            $('#table-info-news').DataTable();
        } );
    }
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(pagenumber).style.display = "block";
    evt.currentTarget.className += " active";

    document.createAttribute("id").value ="defaultOpen";

}

