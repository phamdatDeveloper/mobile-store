$(function () {
    $("#accordion").accordion({
        collapsible: true
    });
});


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
function show1(){
    document.getElementById('promotion').style.display ='none';
}
function show2(){
    document.getElementById('promotion').style.display = 'block';
}




// window.onload = function () {
//     openCity(event, '<%=request.getParameter("page")%>');
// };


$(document).ready(function () {
    $("#btn-addnew").click(function () {
        $("#product_manager_edit").show();
        $("#product_manager_info").hide();
        $("#check_click").val("click");
        $("#submit-product").val("Thêm");
    });
});
$(document).ready(function () {
    $("input[name='promotion']").click(function () {
        var inputValue = $(this).attr("value");
        if (inputValue == "yes") {
            $("#promotion").show();
        } else {
            $("#promotion").hide();
        }
    });
});
var number = document.getElementById("number-detail").value;
console.log(number);
$(document).ready(function () {
    $("#add-detail").click(function () {
        number++;
        $("#title-detail").append("<li class=li-" + number + "><input type=text class='" + number + "' name=input-title-" + number + " required></li>");
        $("#text-detail").append("<li class=li-" + number + "><input type=text class='" + number + "' name=input-" + number + " required></li>");
        $("#number-detail").val(number);

    });
});
$(document).ready(function () {
    $("#delete-detail").click(function () {
        number--;
        if (number < 1) {
            number = 1;
        }
        var i = $("#number-detail").val();
        if(i>1){
            $(".li-" + i).remove();
        }
        $("#number-detail").val(number);

    })
});
var numberImage = document.getElementById("number-image").value;
console.log(numberImage);
$(document).ready(function () {
    $("#add-image").click(function () {
        numberImage++;
        $("#number-image").val(numberImage);
        var funtion = "BrowseServer('','input-image-"+numberImage+"');";
        $("#image-detail").append("<li class=li-img-" + numberImage + ">" +
            "<input  type=text id=input-image-" + numberImage + "  class='" + numberImage + " input-file' size=60 name=input-image-" + numberImage + " required ><input type='button' value='Chọn ảnh' onclick="+funtion+" /></li>");

    });
});
$(document).ready(function () {
    $("#delete-image").click(function () {
        numberImage--;
        console.log(numberImage);
        if (numberImage < 1) {
            numberImage = 1;
        }
        var i = $("#number-image").val();
        if (i>1){

            $(".li-img-" + i).remove();
        }
        $("#number-image").val(numberImage);
    })
});


//ckfinder
function BrowseServer( startupPath, functionData )
{
    // You can use the "CKFinder" class to render CKFinder in a page:
    var finder = new CKFinder();

    // The path for the installation of CKFinder (default = "/ckfinder/").
    finder.basePath = '../';

    //Startup path in a form: "Type:/path/to/directory/"
    finder.startupPath = startupPath;

    // Name of a function which is called when a file is selected in CKFinder.
    finder.selectActionFunction = SetFileField;

    // Additional data to be passed to the selectActionFunction in a second argument.
    // We'll use this feature to pass the Id of a field that will be updated.
    finder.selectActionData = functionData;

    // Name of a function which is called when a thumbnail is selected in CKFinder.
    finder.selectThumbnailActionFunction = ShowThumbnails;

    // Launch CKFinder
    finder.popup();
}

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl, data )
{
    document.getElementById( data["selectActionData"] ).value = fileUrl;
}

// This is a sample function which is called when a thumbnail is selected in CKFinder.
function ShowThumbnails( fileUrl, data )
{
    // this = CKFinderAPI
    var sFileName = this.getSelectedFile().name;
    document.getElementById( 'thumbnails' ).innerHTML +=
        '<div class="thumb">' +
        '<img src="' + fileUrl + '" />' +
        '<div class="caption">' +
        '<a href="' + data["fileUrl"] + '" target="_blank">' + sFileName + '</a> (' + data["fileSize"] + 'KB)' +
        '</div>' +
        '</div>';

    document.getElementById( 'preview' ).style.display = "";
    // It is not required to return any value.
    // When false is returned, CKFinder will not close automatically.
    return false;
}




