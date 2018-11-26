document.addEventListener('DOMContentLoaded', function() {

   document.getElementsByTagName("h1")[0].addEventListener("click", function() {
      return this.style.color = "red";
   });
   
   console.log("Javascript is connected"); 
});
	
   
   