document.addEventListener('turbolinks:load', function () {

  $(".product_card").mouseover(function() {
      $(this).find(".short_desc_index").css("display", "block");
    }).mouseout(function() {
      $(this).find(".short_desc_index").css("display", "none");
    });
  });
