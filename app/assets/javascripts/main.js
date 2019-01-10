(function($) {
   $(document).ready(function() {

      $(".toggle-nav").on("click", function() {
         $(".main").toggleClass("show-nav");
         $("body").toggleClass("scroll");
         $(".black-overlay").toggleClass("show");
      });

      $(".side-menu__list-item").eq(1).on("click", function() {
         $(".sub-menu").eq(0).slideToggle(200);
      });

      $(".side-menu__list-item").eq(2).on("click", function() {
         $(".sub-menu").eq(1).slideToggle(200);
      });

      $(".desktop-nav-list__item").eq(2).on({
         mouseenter: function () {
            $(".desktop-dropdown").eq(1).css("display" , "block")
         },
        mouseleave: function () {
            $(".desktop-dropdown").eq(1).css("display" , "none")
         }
      });

      $(".desktop-nav-list__item").eq(1).on({
         mouseenter: function () {
            $(".desktop-dropdown").eq(0).css("display" , "block")
         },
        mouseleave: function () {
            $(".desktop-dropdown").eq(0).css("display" , "none")
         }
      });

      $(".fa-arrow-circle-up").on("click", function() {
         $("html, body").animate({ scrollTop: 0 }, "smooth");
         return false;
      });

      $(".number-field").keyup(function() {
         $(this).val($(this).val().replace(/(\d{3})\-?(\d{3})\-?(\d{4})/,'$1-$2-$3'))
      });
      var state = document.getElementById("state-picker");
      state.addEventListener("change", function() {
         $.ajax({
            url: "/states?state=" + state.value,
            type: "GET"
         })
      })
   });
})(jQuery);

$(document).ready(function(){
console.log("shit loaded")
});

   


	
   
   