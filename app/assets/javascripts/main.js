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

      $("#aboutus").on("click", function (){
         $('html, body').animate({scrollTop: $(".home-about-us").offset().top}, "smooth");
         return false;
     });

     $("#aboutus-mobile").on("click", function (){
         $(".main").toggleClass("show-nav");
         $("body").toggleClass("scroll");
         $(".black-overlay").toggleClass("show");
         $('html, body').animate({scrollTop: $(".home-about-us").offset().top}, 1700);
         return false;
      });

      $("#contact-mobile").on("click", function (){
         $(".main").toggleClass("show-nav");
         $("body").toggleClass("scroll");
         $(".black-overlay").toggleClass("show");
         $('html, body').animate({scrollTop: $(".home-contact-form").offset().top}, 1700);
         return false;
      });

     $("#contact").on("click", function (){
         $('html, body').animate({scrollTop: $(".home-contact-form").offset().top}, "smooth");
         return false;
      });

      $(".fa-arrow-circle-up").on("click", function() {
         $("html, body").animate({ scrollTop: 0 }, "smooth");
         return false;
      });

      $(".number-field").keyup(function() {
         $(this).val($(this).val().replace(/(\d{3})\-?(\d{3})\-?(\d{4})/,'$1-$2-$3'))
      });
      
      $("#dropdown-button-1").on("click", function() {
         $("#dropdown-1").slideToggle(100);
      });

      $("#dropdown-button-2").on("click", function() {
         $("#dropdown-2").slideToggle(100);
      });

      $("#dropdown-button-3").on("click", function() {
         $("#dropdown-3").slideToggle(100);
      });

      var showChar = 50;
      var ellipsestext = "...";

      $('.preview').each(function() {
         var content = $(this).html();
         if(content.length > showChar) {
            var c = content.substr(0, showChar);
            var h = content.substr(showChar-1, content.length - showChar);
            var html = c +  ellipsestext;
            $(this).html(html);
         }
      });

      $('#already').on("click", function() {
         alert("You are already assigned to a team");
      });
      
      var stateCg = document.getElementById("state-picker-cg");
      stateCg.addEventListener("change", function() {
         console.log("change")
         $.ajax({
            url: "/states-cg?state=" + stateCg.value,
            type: "GET"
         })
      })
      
      var state = document.getElementById("state-picker");
      state.addEventListener("change", function() {
         $.ajax({
            url: "/states?state=" + state.value,
            type: "GET"
         })
      })
   });
})(jQuery);


   


	
   
   