//status

$(document).on('ready page:load', function() {
    $(".btn-mark-as-read").on("ajax:success", function(event, data, status) {
        var $link = $("#"+data.id);
        $link.removeClass("link-read-false").addClass("link-read-true");
        $link.children(".title, .url").removeClass("read-false").addClass("read-true");
        $link.children(".read-status").text("true");
        $link.find(".btn-mark-as-read").hide();
        $link.find(".btn-mark-as-unread").show();
    });

    $(".btn-mark-as-unread").on("ajax:success", function(event, data, status) {
        var $link = $("#"+data.id);
        $link.removeClass("link-read-true").addClass("link-read-false");
        $link.children(".title, .url").removeClass("read-true").addClass("read-false");
        $link.children(".read-status").text("false");
        $link.find(".btn-mark-as-unread").hide();
        $link.find(".btn-mark-as-read").show();
    });
});

//sort

$(document).on('ready page:load', function () {

    $(".sort-btn").on("click", function() {
        var $sort = this;
        var $links = $('#links');
        var $link = $(".link");

        $link.sort(function(a, b) {
            var first = $(a).find('.title').text().toLowerCase();
            var second = $(b).find('title').text().toLowerCase();
            if($($sort).hasClass('ascending')) {
                return (first > second) ? 1 : 0;
            } else {
                return (first < second) ? 1 : 0;
            }
        });
        $.each($link, function(index, element) {
            $links.append(element);
        });
    });
});

//search

$(document).on('ready page:load', function () {
    $("#q").on('keyup', function() {
        $( ".link" ).children(".title").each( function( index, element ){
            var searchTerm = $(this).text().toLowerCase().indexOf($("#q").val().toLowerCase());

            if ( searchTerm >= 0 ) {
                $(this).closest(".link").show();
            } else if ( searchTerm == -1 ) {
                $(this).closest(".link").hide();
            }
        });
    });
});

//filter

$(document).on('ready page:load', function () {
    $("#btn-show-all").on('click', function () {
        $(".link").show();
    });

    $("#btn-show-read").on('click', function () {
        $(".link").hide();
        $(".link-read-true").show();
    });

    $("#btn-show-unread").on('click', function () {
        $(".link").hide();
        $(".link-read-false").show();
    });
});