$(document).ready(function(){
  let elem = document.getElementById('sidenav');
  let elem2 = document.getElementById('sidenav_blue');
  let search = document.getElementById('search-drop');

  $("#closeNav").click(function(){
     elem.style.width = "0";
     elem2.style.width = "0";
     });
   $("#openNav").click(function(){
     elem.style.width = "35%";
     elem2.style.width = "100%";
     });
     $(".blue").click(function(){
        elem.style.width = "0";
        elem2.style.width = "0";
        });

    $("#search-icon").click(function(){
      search.style.width = "100%";
          });
    $("#closesearch").click(function(){
       search.style.width = "0";

           });

           $(document).on('click', '.dropdown-menu', function (e) {
             e.stopPropagation();
           });

           // make it as accordion for smaller screens
           if ($(window).width() < 992) {
             $('.dropdown-menu a').click(function(e){
               e.preventDefault();
                 if($(this).next('.submenu').length){
                   $(this).next('.submenu').toggle();
                 }
                 $('.dropdown').on('hide.bs.dropdown', function () {
                $(this).find('.submenu').hide();
             })
             });
           }
  $('.index_img').last().addClass('last_img_index');

});
