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

      $("#join-alert").on("click", function() {
         alert("You must be in a team to contact families!");
      });

      $("#customer-button").on("click", function() {
         $("#service-number").css("display", "block");
      });

      $("#condition-other").on("click", function() {
        if($("#condition-other").is(":checked")){
          $("#condition-other-input").css("display", "block");
        } else {
          $("#condition-other-input").css("display", "none");
        }
      });

      $("#service-other").on("click", function() {
        if($("#service-other").is(":checked")){
          $("#service-other-input").css("display", "block");
        } else {
          $("#service-other-input").css("display", "none");
        }
      });

      $("#condition-other-fam").on("click", function() {
        if($("#condition-other-fam").is(":checked")){
          $("#condition-other-input-fam").css("display", "block");
        } else {
          $("#condition-other-input-fam").css("display", "none");
        }
      });

      function validateCheckbox(){
         console.log("are you sure");
      }
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

      $("#quality-text-box").attr("name", "");                        
      
      $('body').on('input', "#quality-text-box", function() {
         if($(this).val().length) {
            $("#quality-text-box").attr("name", "recipient[quality]");                        
         }
      });

      $('#already').on("click", function() {
         alert("Please stop working with your current team to connect with a new one.");
      });

      $('#need-more').on("click", function() {
         alert("This team needs more than one member for you to connect to them");
      });

      $("#hours-button").on("click", function() {
         if($("#companion-hours").val().length === 0) {
            alert("Please fill in companion hours worked");            
         } else if ($("#personal-hours").val().length === 0) {
            alert("Please fill in personal hours worked");                        
         } else {
            confirm("Are you sure these hours are correct?");                        
         }
      });

      var jobs = document.getElementsByClassName("job");
      var jobTitles = document.getElementsByClassName("job-title");
      var jobStates = document.getElementsByClassName("job-state");
      var jobCities = document.getElementsByClassName("job-city");
      var jobFrom = document.getElementsByClassName("job-from");
      var jobTo =  document.getElementsByClassName("job-to");
      var label = document.getElementsByClassName("job-label");

      jobs[1].required = false;
      jobs[2].required = false;
      jobTitles[1].required = false;
      jobTitles[2].required = false;
      jobStates[1].required = false;
      jobStates[2].required = false;
      jobCities[1].required = false;
      jobCities[2].required = false;
      jobFrom[1].required = false;
      jobFrom[2].required = false;
      jobTo[1].required = false;
      jobTo[2].required = false;

      label[0].innerHTML += "(Most Recent Employment)";
            
      $("#who-pays-text-box").attr("name", "");            
      
      $("#who-pays").on("change", function(){
         if($(this).val() === "Other (please specify)") {
            $(this).css("display", "none");
            $("#who-pays-text-box").css("display", "block");
            $("#who-pays-text-box").attr("required", "true"); 
            $("#who-pays-text-box").attr("name", "family[who_pays]");                        
         } else {
            $(this).css("display", "block");            
            $("#who-pays-text-box").css("display", "none");            
         }
      });

      $("#who-pays-text-box-cg").attr("name", "");                  

      $("#who-pays-cg").on("change", function(){
         if($(this).val() === "Other (please specify)") {
            $(this).css("display", "none");
            $("#who-pays-text-box-cg").css("display", "block");
            $("#who-pays-text-box-cg").attr("required", "true"); 
            $("#who-pays-text-box-cg").attr("name", "care_giver[who_pays]");                        
         } else {
            $(this).css("display", "block");            
            $("#who-pays-text-box-cg").css("display", "none");            
         }
      });

      var stateCg = document.getElementById("state-picker-cg");
      stateCg.addEventListener("change", function() {
         $.ajax({
            url: "/states-cg?state=" + stateCg.value,
            type: "GET",
            cache: false
         })
      })

      var state = document.getElementById("state-picker");
      state.addEventListener("change", function() {
         $.ajax({
            url: "/states?state=" + state.value,
            type: "GET",
            cache: false
         })
      })
   });
})(jQuery);
