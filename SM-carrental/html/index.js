$(function () {
    function display(bool) {
        if (bool) {
              $("#container").fadeIn(300);
         } else {

              $("#container").fadeOut(300);
         }
    }

    display(false)

    window.addEventListener("message", function(event) {
         var data = event.data;
         if (data.type === "ui") {
              display(data.status);
         }
    })

    document.onkeyup = function (data) {

         if (data.code == "Escape") { // ESC
              $.post("https://SM-carrental/button", JSON.stringify({}));
                $.post("https://SM-carrental/close", JSON.stringify({}));
              display(false);
         }
    };

    $("#close").click(function () {
         $.post("https://SM-carrental/button", JSON.stringify({}));
    });

    $("#submit").click(function () {
         $.post("https://SM-carrental/button", JSON.stringify({}));
    });

    $("#car-1").click(function () {
         $.post("https://SM-carrental/car-1", JSON.stringify({}));
    });

    $("#car-2").click(function () {
     $.post("https://SM-carrental/car-2", JSON.stringify({}));
});

$("#car-3").click(function () {
     $.post("https://SM-carrental/car-3", JSON.stringify({}));
});

$("#bike-1").click(function () {
     $.post("https://SM-carrental/bike-1", JSON.stringify({}));
});

$("#bike-2").click(function () {
 $.post("https://SM-carrental/bike-2", JSON.stringify({}));
});

$("#bike-3").click(function () {
 $.post("https://SM-carrental/bike-3", JSON.stringify({}));
});

$("#offroad-1").click(function () {
     $.post("https://SM-carrental/offroad-1", JSON.stringify({}));
});

$("#offroad-2").click(function () {
 $.post("https://SM-carrental/offroad-2", JSON.stringify({}));
});

$("#offroad-3").click(function () {
 $.post("https://SM-carrental/offroad-3", JSON.stringify({}));
});

})