document.addEventListener('turbolinks:load', function () {

  if ($(window).width() < 840){
    $("#remove_center").removeClass("vertical-center");
    $("#remove_center").removeClass("col-12");
  };

});
