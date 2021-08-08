document.addEventListener('turbolinks:load', function () {


    setTimeout(function() {
            document.getElementById("des").click();
        },1);


  let l=document.getElementById("London");
  let p=document.getElementById("Paris");

document.getElementById("des").addEventListener("click", function(){
    l.style.display = "block";
    p.style.display = "none";
    document.getElementById("des").classList.add("active");
    document.getElementById("short_des").classList.remove("active");
  });

  $(document).on("click","#short_des", function(){
    p.style.display = "block";
    l.style.display = "none";
    $("#short_des").addClass("active");
    $("#des").removeClass("active");
  });

})
