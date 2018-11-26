(function($) {
   
      skel.breakpoints({
         xlarge:	'(max-width: 1680px)',
         large:	'(max-width: 1280px)',
         medium:	'(max-width: 980px)',
         small:	'(max-width: 736px)',
         xsmall:	'(max-width: 480px)',
         xxsmall: '(max-width: 360px)'
      });
   
      /**
       * Applies parallax scrolling to an element's background image.
       * @return {jQuery} jQuery object.
       */
      $.fn._parallax = function(intensity) {
   
         var	$window = $(window),
            $this = $(this);
   
         if (this.length == 0 || intensity === 0)
            return $this;
   
         if (this.length > 1) {
   
            for (var i=0; i < this.length; i++)
               $(this[i])._parallax(intensity);
   
            return $this;
   
         }
   
         if (!intensity)
            intensity = 0.25;
   
         $this.each(function() {
   
            var $t = $(this),
               $bg = $('<div class="bg"></div>').appendTo($t),
               on, off;
   
            on = function() {
   
               $bg
                  .removeClass('fixed')
                  .css('transform', 'matrix(1,0,0,1,0,0)');
   
               $window
                  .on('scroll._parallax', function() {
   
                     var pos = parseInt($window.scrollTop()) - parseInt($t.position().top);
   
                     $bg.css('transform', 'matrix(1,0,0,1,0,' + (pos * intensity) + ')');
   
                  });
   
            };
   
            off = function() {
   
               $bg
                  .addClass('fixed')
                  .css('transform', 'none');
   
               $window
                  .off('scroll._parallax');
   
            };
   
            // Disable parallax on ..
               if (skel.vars.browser == 'ie'		// IE
               ||	skel.vars.browser == 'edge'		// Edge
               ||	window.devicePixelRatio > 1		// Retina/HiDPI (= poor performance)
               ||	skel.vars.mobile)				// Mobile devices
                  off();
   
            // Enable everywhere else.
               else {
   
                  skel.on('!large -large', on);
                  skel.on('+large', off);
   
               }
   
         });
   
         $window
            .off('load._parallax resize._parallax')
            .on('load._parallax resize._parallax', function() {
               $window.trigger('scroll');
            });
   
         return $(this);
   
      };
   
      $(function() {
   
         var	$window = $(window),
            $body = $('body'),
            $wrapper = $('#wrapper'),
            $header = $('#header'),
            $nav = $('#nav'),
            $main = $('#main'),
            $navPanelToggle, $navPanel, $navPanelInner;
   
         // Disable animations/transitions until the page has loaded.
            $window.on('load', function() {
               window.setTimeout(function() {
                  $body.removeClass('is-loading');
               }, 100);
            });
   
         // Prioritize "important" elements on medium.
            skel.on('+medium -medium', function() {
               $.prioritize(
                  '.important\\28 medium\\29',
                  skel.breakpoint('medium').active
               );
            });
   
         // Scrolly.
            $('.scrolly').scrolly();
   
         // Background.
            $wrapper._parallax(0.925);
   
         // Nav Panel.
   
            // Toggle.
               $navPanelToggle = $(
                  '<a href="#navPanel" id="navPanelToggle">Menu</a>'
               )
                  .appendTo($wrapper);
   
               // Change toggle styling once we've scrolled past the header.
                  $header.scrollex({
                     bottom: '5vh',
                     enter: function() {
                        $navPanelToggle.removeClass('alt');
                     },
                     leave: function() {
                        $navPanelToggle.addClass('alt');
                     }
                  });
   
            // Panel.
               $navPanel = $(
                  '<div id="navPanel">' +
                     '<nav>' +
                     '</nav>' +
                     '<a href="#navPanel" class="close"></a>' +
                  '</div>'
               )
                  .appendTo($body)
                  .panel({
                     delay: 500,
                     hideOnClick: true,
                     hideOnSwipe: true,
                     resetScroll: true,
                     resetForms: true,
                     side: 'right',
                     target: $body,
                     visibleClass: 'is-navPanel-visible'
                  });
   
               // Get inner.
                  $navPanelInner = $navPanel.children('nav');
   
               // Move nav content on breakpoint change.
                  var $navContent = $nav.children();
   
                  skel.on('!medium -medium', function() {
   
                     // NavPanel -> Nav.
                        $navContent.appendTo($nav);
   
                     // Flip icon classes.
                        $nav.find('.icons, .icon')
                           .removeClass('alt');
   
                  });
   
                  skel.on('+medium', function() {
   
                     // Nav -> NavPanel.
                     $navContent.appendTo($navPanelInner);
   
                     // Flip icon classes.
                        $navPanelInner.find('.icons, .icon')
                           .addClass('alt');
   
                  });
   
               // Hack: Disable transitions on WP.
                  if (skel.vars.os == 'wp'
                  &&	skel.vars.osVersion < 10)
                     $navPanel
                        .css('transition', 'none');
   
         // Intro.
            var $intro = $('#intro');
   
            if ($intro.length > 0) {
   
               // Hack: Fix flex min-height on IE.
                  if (skel.vars.browser == 'ie') {
                     $window.on('resize.ie-intro-fix', function() {
   
                        var h = $intro.height();
   
                        if (h > $window.height())
                           $intro.css('height', 'auto');
                        else
                           $intro.css('height', h);
   
                     }).trigger('resize.ie-intro-fix');
                  }
   
               // Hide intro on scroll (> small).
                  skel.on('!small -small', function() {
   
                     $main.unscrollex();
   
                     $main.scrollex({
                        mode: 'bottom',
                        top: '25vh',
                        bottom: '-50vh',
                        enter: function() {
                           $intro.addClass('hidden');
                        },
                        leave: function() {
                           $intro.removeClass('hidden');
                        }
                     });
   
                  });
   
               // Hide intro on scroll (<= small).
                  skel.on('+small', function() {
   
                     $main.unscrollex();
   
                     $main.scrollex({
                        mode: 'middle',
                        top: '15vh',
                        bottom: '-15vh',
                        enter: function() {
                           $intro.addClass('hidden');
                        },
                        leave: function() {
                           $intro.removeClass('hidden');
                        }
                     });
   
               });
   
            }
   
      });
   
      $(function() {
   
         var words = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"];
         
         var word = words[36];
   
         $(".logo").html(word);	
   
         var changeWord = setInterval(function(){
            var randomWord = words[Math.floor(Math.random() * words.length - 1)];
            $(".logo").html(randomWord);
         },2000);
         
         $(".actions").on("click", function(){
            var el = $("#main")[0];
            el.scrollIntoView({
               block: 'start',
               behavior: 'smooth' 
            });
         });
         
      });		
   
   })(jQuery);
   