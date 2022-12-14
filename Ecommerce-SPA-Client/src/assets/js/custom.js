/*********************************************************************************

	Template Name: Belle - Multipurpose eCommerce Bootstrap4 HTML Template
	Description: A perfect template to build beautiful and unique Glasses websites. It comes with nice and clean design.
	Version: 1.0

**********************************************************************************/

/*************************************************
  1. Preloader Loading
  2. Promotional Bar Header
  3. Currency Show/Hide dropdown  
  4. Language Show/Hide dropdown
  5. Top Links Show/Hide dropdown
  6. Minicart Dropdown
  7. Sticky Header
  8. Search Trigger
  9. Mobile Menu
  10 Slick Slider
	 10.1 Homepage Slideshow 
	 10.2 Product Slider Slick
	 10.3 Product Slider Slick Style2
	 10.4 Product Slider Slick Style3
	 10.5 Product Slider Slick Fullwidth
	 10.6 Product Slider Slick Product Page
	 10.7 Collection Slider Slick
	 10.8 Collection Slider Slick 4 items
	 10.9 Logo Slider Slick
	 10.10 Testimonial Slider Slick
  11. Tabs With Accordian Responsive
  12. Sidebar Categories Level links
  13. Price Range Slider
  14. Color Swacthes
  15. Footer links for mobiles
  16. Site Animation
  17. SHOW HIDE PRODUCT TAG
  18. SHOW HIDE PRODUCT Filters
  19. Timer Count Down
  20. Scroll Top
  21. Height Product Grid Image
  22. Product details slider 2
  23. Product details slider 1
  24. Product Zoom
  25. Product Page Popup
  26. Quantity Plus Minus
  27. Visitor Fake Message
  28. Product Tabs
  29. Promotion / Notification Cookie Bar 
  30. Image to background js
  31. COLOR SWATCH ON COLLECTION PAGE
  32. Related Product Slider
  33. Infinite Scroll js
*************************************************/

(function ($) {
  // Start of use strict
  'use strict'

  /*-----------------------------------------
	  1. Preloader Loading ----------------------- 
	  -----------------------------------------*/
  $(document).ready(function () {
    $('#load').fadeOut()
    $('#pre-loader')
      .delay(0)
      .fadeOut('slow')
  })

  /*-----------------------------------------
	 2. Promotional Bar Header ------------------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.closeHeader').on('click', function () {
      $('.promotion-header').slideUp()
      Cookies.set('promotion', 'true', { expires: 1 })
      return false
    })
  })

  /*-----------------------------------------
	 3. Currency Show/Hide dropdown -----------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.selected-currency').on('click', function () {
      $('#currencies').slideToggle()
    })
    $('#currencies li').on('click', function () {
      $(this)
        .parent()
        .slideUp()
    })
  })

  /*-----------------------------------------
	  4. Language Show/Hide dropdown ----------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.language-dd').on('click', function () {
      $('#language').slideToggle()
    })
    $('#language li').on('click', function () {
      $(this)
        .parent()
        .slideUp()
    })
  })

  /*-----------------------------------------
	  5. Top Links Show/Hide dropdown ---------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.top-header .user-menu').on('click', function () {
      if ($(window).width() < 990) {
        $(this)
          .next()
          .slideToggle(300)
        $(this)
          .parent()
          .toggleClass('active')
      }
    })
  })

  /*-----------------------------------------
	 6. Minicart Dropdown ---------------------
	 ------------------------------------------ */
  $(document).ready(function () {
    $('.site-header__cart').on('click', function (i) {
      i.preventDefault()
      $('#header-cart').slideToggle()
    })
    // Hide Cart on document click
    $('body').on('click', function (event) {
      let $target = $(event.target)
      if (!$target.parents().is('.site-cart') && !$target.is('.site-cart')) {
        $('body')
          .find('#header-cart')
          .slideUp()
      }
    })
  })

  /*-----------------------------------------
	  7. Sticky Header ------------------------
	  -----------------------------------------*/
  window.onscroll = function () {
    myFunction()
  }
  function myFunction () {
    if ($(window).width() > 1199) {
      if ($(window).scrollTop() > 145) {
        $('.header-wrap').addClass('stickyNav animated fadeInDown')
      } else {
        $('.header-wrap').removeClass('stickyNav fadeInDown')
      }
    }
  }

  /*-----------------------------------------
	  8. Search Trigger -----------------------
	  ----------------------------------------- */
  $(document).ready(function () {
    $('.search-trigger').on('click', function () {
      const search = $('.search')

      if (search.is('.search--opened')) {
        search.removeClass('search--opened')
      } else {
        search.addClass('search--opened')
        $('.search__input')[0].focus()
      }
    })
  })
  $(document).on('click', function (event) {
    if (!$(event.target).closest('.search, .search-trigger').length) {
      $('.search').removeClass('search--opened')
    }
  })

  /*-----------------------------------------
	  9. Mobile Menu --------------------------
	  -----------------------------------------*/
  let selectors = {
    body: 'body',
    sitenav: '#siteNav',
    navLinks: '#siteNav .lvl1 > a',
    menuToggle: '.js-mobile-nav-toggle',
    mobilenav: '.mobile-nav-wrapper',
    menuLinks: '#MobileNav .anm',
    closemenu: '.closemobileMenu'
  }

  $(document).ready(function () {
    $(selectors.navLinks).each(function () {
      if ($(this).attr('href') == window.location.pathname)
        $(this).addClass('active')
    })

    $(selectors.menuToggle).on('click', function () {
      body: 'body', $(selectors.mobilenav).toggleClass('active')
      $(selectors.body).toggleClass('menuOn')
      $(selectors.menuToggle).toggleClass('mobile-nav--open mobile-nav--close')
    })

    $(selectors.closemenu).on('click', function () {
      body: 'body', $(selectors.mobilenav).toggleClass('active')
      $(selectors.body).toggleClass('menuOn')
      $(selectors.menuToggle).toggleClass('mobile-nav--open mobile-nav--close')
    })
  })

  $(document).ready(function () {
    $('body').on('click', function (event) {
      let $target = $(event.target)
      if (
        !$target.parents().is(selectors.mobilenav) &&
        !$target.parents().is(selectors.menuToggle) &&
        !$target.is(selectors.menuToggle)
      ) {
        $(selectors.mobilenav).removeClass('active')
        $(selectors.body).removeClass('menuOn')
        $(selectors.menuToggle)
          .removeClass('mobile-nav--close')
          .addClass('mobile-nav--open')
      }
    })
  })

  $(document).ready(function () {
    $(selectors.menuLinks).on('click', function (e) {
      e.preventDefault()
      $(this).toggleClass('anm-plus-l anm-minus-l')
      $(this)
        .parent()
        .next()
        .slideToggle()
    })
  })

  /*-----------------------------------------
	  10.1 Homepage Slideshow -----------------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.home-slideshow').slick({
      dots: false,
      infinite: true,
      slidesToShow: 1,
      slidesToScroll: 1,
      fade: true,
      arrows: true,
      autoplay: true,
      autoplaySpeed: 4000,
      lazyLoad: 'ondemand'
    })
  })

  // Full Size Banner on the Any Screen
  $(window)
    .resize(function () {
      let bodyheight = $(this).height() - 20
      $('.sliderFull .bg-size').height(bodyheight)
    })
    .resize()

  /*-----------------------------------------
	  10.2 Product Slider Slick ---------------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.productSlider').slick({
      dots: false,
      infinite: true,
      slidesToShow: 4,
      slidesToScroll: 1,
      arrows: true,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    })
  })

  /*-----------------------------------------
	  10.3 Product Slider Slick Style2 --------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.productSlider-style1').slick({
      dots: false,
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 1,
      arrows: true,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    })
  })

  /*-----------------------------------------
	  10.4 Product Slider Slick Style3 --------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.productSlider-style2').slick({
      dots: false,
      infinite: true,
      slidesToShow: 5,
      slidesToScroll: 1,
      arrows: true,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    })
  })

  /*-----------------------------------------
	  10.5 Product Slider Slick Fullwidth -----
	  ----------------------------------------- */
  $(document).ready(function () {
    $('.productSlider-fullwidth').slick({
      dots: false,
      infinite: true,
      slidesToShow: 6,
      slidesToScroll: 1,
      arrows: true,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    })
  })

  /*-----------------------------------------
	  10.6 Product Slider Slick Product Page --
	  ----------------------------------------- */
  $(document).ready(function () {
    $('.productPageSlider').slick({
      dots: false,
      infinite: true,
      slidesToShow: 5,
      slidesToScroll: 1,
      arrows: true,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 680,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 380,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    })
  })

  /*-----------------------------------------
	  10.7 Collection Slider Slick ------------
	  ----------------------------------------- */
  $(document).ready(function () {
    $('.collection-grid').slick({
      dots: false,
      infinite: true,
      slidesToShow: 5,
      slidesToScroll: 1,
      arrows: true,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        }
      ]
    })
  })

  /*-----------------------------------------
	  10.8 Collection Slider Slick 4 items ----
	  ----------------------------------------- */
  $(document).ready(function () {
    $('.collection-grid-4item').slick({
      dots: false,
      infinite: true,
      slidesToShow: 4,
      slidesToScroll: 1,
      arrows: true,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        }
      ]
    })
  })

  /*-----------------------------------------
	  10.9 Logo Slider Slick ------------------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.logo-bar').slick({
      dots: false,
      infinite: true,
      slidesToShow: 6,
      slidesToScroll: 1,
      arrows: true,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        }
      ]
    })
  })

  /*-----------------------------------------
	  10.10 Testimonial Slider Slick ----------
	  -----------------------------------------*/
  $(document).ready(function () {
    $('.quotes-slider').slick({
      dots: false,
      infinite: true,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: true
    })
  })

  /*-----------------------------------
	  11. Tabs With Accordian Responsive
	-------------------------------------*/
  $(document).ready(function () {
    $('.tab_content').hide()
    $('.tab_content:first').show()

    /* if in tab mode */
    $('ul.tabs li').on('click', function () {
      $('.tab_content').hide()
      let activeTab = $(this).attr('rel')
      $('#' + activeTab).fadeIn()

      $('ul.tabs li').removeClass('active')
      $(this).addClass('active')

      $('.tab_drawer_heading').removeClass('d_active')
      $(".tab_drawer_heading[rel^='" + activeTab + "']").addClass('d_active')

      $('.productSlider').slick('refresh')
    })
    /* if in drawer mode */
    $('.tab_drawer_heading').on('click', function () {
      $('.tab_content').hide()
      let d_activeTab = $(this).attr('rel')
      $('#' + d_activeTab).fadeIn()

      $('.tab_drawer_heading').removeClass('d_active')
      $(this).addClass('d_active')

      $('ul.tabs li').removeClass('active')
      $("ul.tabs li[rel^='" + d_activeTab + "']").addClass('active')

      $('.productSlider').slick('refresh')
    })

    $('ul.tabs li')
      .last()
      .addClass('tab_last')
  })

  /*-----------------------------------
	  End Tabs With Accordian Responsive
	-------------------------------------*/

  /*-----------------------------------
	  12. Sidebar Categories Level links
	-------------------------------------*/
  $(document).ready(function () {
    $('.sidebar_categories .sub-level a').on('click', function () {
      $(this).toggleClass('active')
      $(this)
        .next('.sublinks')
        .slideToggle('slow')
    })
  })
  $(document).ready(function () {
    $('.filter-widget .widget-title').on('click', function () {
      $(this)
        .next()
        .slideToggle('300')
      $(this).toggleClass('active')
    })
  })

  /*-----------------------------------
	 13. Price Range Slider
	-------------------------------------*/
  $(document).ready(function () {
    $('#slider-range').slider({
      range: true,
      min: 12,
      max: 200,
      values: [0, 100],
      slide: function (event, ui) {
        $('#amount').val('$' + ui.values[0] + ' - $' + ui.values[1])
      }
    })
    $('#amount').val(
      '$' +
        $('#slider-range').slider('values', 0) +
        ' - $' +
        $('#slider-range').slider('values', 1)
    )
  })

  /*-----------------------------------
	 14. Color Swacthes
	-------------------------------------*/
  $(document).ready(function () {
    $.each($('.swacth-list'), function () {
      let n = $('.swacth-btn')
      n.on('click', function () {
        $(this)
          .parent()
          .find(n)
          .removeClass('checked')
        $(this).addClass('checked')
      })
    })
  })

  /*-----------------------------------
	  15. Footer links for mobiles
	-------------------------------------*/
  $(document).ready(function () {
    $('.footer-links .h4').on('click', function () {
      if ($(window).width() < 766) {
        $(this)
          .next()
          .slideToggle()
        $(this).toggleClass('active')
      }
    })
  })

  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
	//Resize Function 
  //Resize Function
  let resizeTimer
  $(window).resize(function (e) {
    clearTimeout(resizeTimer)
    resizeTimer = setTimeout(function () {
      $(window).trigger('delayed-resize', e)
    }, 250)
  })
  $(window).on('load resize', function (e) {
    if ($(window).width() > 766) {
      $('.footer-links ul').show()
    } else {
      $('.footer-links ul').hide()
    }
  })

  /*-------------------------------
	  16. Site Animation
	----------------------------------*/
  if ($(window).width() < 771) {
    $('.wow').removeClass('wow')
  }
  let wow = new WOW({
    boxClass: 'wow', // animated element css class (default is wow)
    animateClass: 'animated', // animation css class (default is animated)
    offset: 0, // distance to the element when triggering the animation (default is 0)
    mobile: false, // trigger animations on mobile devices (default is true)
    live: true, // act on asynchronously loaded content (default is true)
    callback: function (box) {
      // the callback is fired every time an animation is started
      // the argument that is passed in is the DOM node being animated
    },
    scrollContainer: null // optional scroll container selector, otherwise use window
  })
  wow.init()

  /*-------------------------------
  17. SHOW HIDE PRODUCT TAG
----------------------------------*/
  $(document).ready(function () {
    $('.product-tags li')
      .eq(10)
      .nextAll()
      .hide()
    $('.btnview').on('click', function () {
      $('.product-tags li')
        .not('.filter--active')
        .show()
      $(this).hide()
    })
  })
  /*-------------------------------
  18. SHOW HIDE PRODUCT Filters
----------------------------------*/
  $(document).ready(function () {
    $('.btn-filter').on('click', function () {
      $('.filterbar').toggleClass('active')
    })
    $('.closeFilter').on('click', function () {
      $('.filterbar').removeClass('active')
    })
    // Hide Cart on document click
    $('body').on('click', function (event) {
      let $target = $(event.target)
      if (!$target.parents().is('.filterbar') && !$target.is('.btn-filter')) {
        $('.filterbar').removeClass('active')
      }
    })
  })

  /*-------------------------------
	 19. Timer Count Down
	----------------------------------*/
  $(document).ready(function () {
    $('[data-countdown]').each(function () {
      let $this = $(this),
        finalDate = $(this).data('countdown')
      $this.countdown(finalDate, function (event) {
        $this.html(
          event.strftime(
            '<span class="ht-count days"><span class="count-inner"><span class="time-count">%-D</span> <span>Days</span></span></span> <span class="ht-count hour"><span class="count-inner"><span class="time-count">%-H</span> <span>HR</span></span></span> <span class="ht-count minutes"><span class="count-inner"><span class="time-count">%M</span> <span>Min</span></span></span> <span class="ht-count second"><span class="count-inner"><span class="time-count">%S</span> <span>Sc</span></span></span>'
          )
        )
      })
    })
  })

  /*-------------------------------
	 20.Scroll Top ------------------
	---------------------------------*/
  $(document).ready(function () {
    $('#site-scroll').on('click', function () {
      $('html, body').animate({ scrollTop: 0 }, 1000)
      return false
    })
  })

  $(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
      $('#site-scroll').fadeIn()
    } else {
      $('#site-scroll').fadeOut()
    }
  })

  /*-------------------------------
	  21. Height Product Grid Image
	----------------------------------*/
	function productGridView() {
		var gridRows = [];
		var tempRow = [];
		productGridElements = $('.grid-products .item');
		productGridElements.each(function (index) {
			if ($(this).css('clear') != 'none' && index != 0) {
				gridRows.push(tempRow);
				tempRow = [];
			}
			tempRow.push(this);

			if (productGridElements.length == index + 1) {
				gridRows.push(tempRow);
			}
		});

		$.each(gridRows, function () {
			var tallestHeight = 0;
			var tallestHeight1 = 0;
			$.each(this, function () {
				$(this).find('.product-image > a').css('height', '');
				elHeight = parseInt($(this).find('.product-image').css('height'));
				if (elHeight > tallestHeight) { tallestHeight = elHeight; }
			});

			$.each(this, function () {
				if ($(window).width() > 768) {
					$(this).find('.product-image > a').css('height', tallestHeight);
				}
			});
		});
	}

  /*----------------------------
	   22. Product details slider 2
	------------------------------ */
  $(document).ready(function () {
    $('.product-dec-slider-2').slick({
      infinite: true,
      slidesToShow: 5,
      vertical: true,
      slidesToScroll: 1,
      centerPadding: '60px'
    })
  })

  /*----------------------------
	   23. Product details slider 1
	------------------------------ */
  $(document).ready(function () {
    $('.product-dec-slider-1').slick({
      infinite: true,
      slidesToShow: 6,
      stageMargin: 5,
      slidesToScroll: 1
    })
  })

  /*--------------------------
	  24. Product Zoom
	---------------------------- */
  $(document).ready(function () {
    $('.zoompro').elevateZoom({
      gallery: 'gallery',
      galleryActiveClass: 'active',
      zoomWindowWidth: 300,
      zoomWindowHeight: 100,
      scrollZoom: false,
      zoomType: 'inner',
      cursor: 'crosshair'
    })
  })

  /*--------------------------
	  25. Product Page Popup ---
	---------------------------- */
  $(document).ready(function () {
    if ($('.popup-video').length) {
      $('.popup-video').magnificPopup({
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false
      })
    }
  })

  $(document).ready(function () {
    $('.sizelink').magnificPopup({
      type: 'inline',
      midClick: true
    })
  })

  $(document).ready(function () {
    $('.emaillink').magnificPopup({
      type: 'inline',
      midClick: true
    })
  })

  /*----------------------------------
	  26. Quantity Plus Minus
	------------------------------------*/
  $(document).ready(function () {
    $('.qtyBtn').on('click', function () {
      let qtyField = $(this).parent('.qtyField'),
        oldValue = $(qtyField)
          .find('.qty')
          .val(),
        newVal = 1

      if ($(this).is('.plus')) {
        newVal = parseInt(oldValue) + 1
      } else if (oldValue > 1) {
        newVal = parseInt(oldValue) - 1
      }
      $(qtyField)
        .find('.qty')
        .val(newVal)
    })
  })

  /*----------------------------------
	  27. Visitor Fake Message
	------------------------------------*/
  $(document).ready(function () {
    let userLimit = $('.userViewMsg').attr('data-user'),
      userTime = $('.userViewMsg').attr('data-time')
    $('.uersView').text(Math.floor(Math.random() * userLimit))
    setInterval(function () {
      $('.uersView').text(Math.floor(Math.random() * userLimit))
    }, userTime)
  })

  /*----------------------------------
	  28. Product Tabs
	------------------------------------*/
  $(document).ready(function () {
    $('.tab-content').hide()
    $('.tab-content:first').show()
    /* if in tab mode */
    $('.product-tabs li').on('click', function () {
      $('.tab-content').hide()
      let activeTab = $(this).attr('rel')
      $('#' + activeTab).fadeIn()

      $('.product-tabs li').removeClass('active')
      $(this).addClass('active')

      $(this).fadeIn()
      if ($(window).width() < 767) {
        let tabposition = $(this).offset()
        $('html, body').animate({ scrollTop: tabposition.top }, 700)
      }
    })

    $('.product-tabs li:first-child').addClass('active')
    $('.tab-container h3:first-child + .tab-content').show()

    /* if in drawer mode */
    $('.acor-ttl').on('click', function () {
      $('.tab-content').hide()
      let activeTab = $(this).attr('rel')
      $('#' + activeTab).fadeIn()

      $('.acor-ttl').removeClass('active')
      $(this).addClass('active')
    })

    $('.reviewLink').on('click', function (e) {
      e.preventDefault()
      $('.product-tabs li').removeClass('active')
      $('.reviewtab').addClass('active')
      let tab = $(this).attr('href')
      $('.tab-content')
        .not(tab)
        .css('display', 'none')
      $(tab).fadeIn()
      let tabposition = $('#tab2').offset()
      if ($(window).width() < 767) {
        $('html, body').animate({ scrollTop: tabposition.top - 50 }, 700)
      } else {
        $('html, body').animate({ scrollTop: tabposition.top - 80 }, 700)
      }
    })
  })

  /*--------------------------------------
	  29. Promotion / Notification Cookie Bar 
	  -------------------------------------- */
  $(document).ready(function () {
    if (Cookies.get('promotion') != 'true') {
      $('.notification-bar').show()
    }
    $('.close-announcement').on('click', function () {
      $('.notification-bar').slideUp()
      Cookies.set('promotion', 'true', { expires: 1 })
      return false
    })
  })
  /* --------------------------------------
		 End Promotion / Notification Cookie Bar 
	-------------------------------------- */

  /* --------------------------------------
		 30. Image to background js
	-------------------------------------- */
  $(document).ready(function () {
    $('.bg-top')
      .parent()
      .addClass('b-top')
    $('.bg-bottom')
      .parent()
      .addClass('b-bottom')
    $('.bg-center')
      .parent()
      .addClass('b-center')
    $('.bg-left')
      .parent()
      .addClass('b-left')
    $('.bg-right')
      .parent()
      .addClass('b-right')
    $('.bg_size_content')
      .parent()
      .addClass('b_size_content')
    $('.bg-img')
      .parent()
      .addClass('bg-size')
    $('.bg-img.blur-up')
      .parent()
      .addClass('')
    jQuery('.bg-img').each(function () {
      let el = $(this),
        src = el.attr('src'),
        parent = el.parent()

      parent.css({
        'background-image': 'url(' + src + ')',
        'background-size': 'cover',
        'background-position': 'center',
        'background-repeat': 'no-repeat'
      })

      el.hide()
    })
  })
  /* --------------------------------------
		  End Image to background js
	 -------------------------------------- */

  /*----------------------------------
	32. Related Product Slider ---------
	------------------------------------*/
  $(document).ready(function () {
    $('.related-product .productSlider').slick({
      dots: false,
      infinite: true,
      item: 5,
      slidesToScroll: 1,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 767,
          settings: {
            slidesToScroll: 1
          }
        }
      ]
    })
  })
  /*----------------------------------
	  End Related Product Slider
	  ------------------------------------*/

  /*-----------------------------------
	  33. Infinite Scroll js
	  -------------------------------------*/
  $(document).ready(function () {
    $('.product-load-more .item')
      .slice(0, 16)
      .show()
    $('.loadMore').on('click', function (e) {
      e.preventDefault()
      $('.product-load-more .item:hidden')
        .slice(0, 4)
        .slideDown()
      if ($('.product-load-more .item:hidden').length == 0) {
        $('.infinitpagin').html(
          '<div class="btn loadMore">no more products</div>'
        )
      }
    })
  })

  $(document).ready(function () {
    $('.blog--grid-load-more .article')
      .slice(0, 3)
      .show()
    $('.loadMorepost').on('click', function (e) {
      e.preventDefault()
      $('.blog--grid-load-more .article:hidden')
        .slice(0, 1)
        .slideDown()
      if ($('.blog--grid-load-more .article:hidden').length == 0) {
        $('.loadmore-post').html(
          '<div class="btn loadMorepost">No more Blog Post</div>'
        )
      }
    })
  })
  /*-----------------------------------
	  End Infinite Scroll js
	  -------------------------------------*/
  $(document).ready(function () {
    $('.closepopup').on('click', function () {
      $('#popup-container').fadeOut()
      $('#modalOverly').fadeOut()
    })

    let visits = Cookies.get('visits') || 0
    visits++
    Cookies.set('visits', visits, { expires: 1, path: '/' })
    if (visits > 1) {
      $('#modalOverly').hide()
      $('#popup-container').hide()
    } else {
      let pageHeight = $(document).height()
      $('<div id="modalOverly"></div>').insertBefore('body')
      $('#modalOverly').css('height', pageHeight)
      $('#popup-container').show()
    }
    if (Cookies.get('noShowWelcome')) {
      $('#popup-container').hide()
      $('#active-popup').hide()
    }
  })

  $(document).mouseup(function (e) {
    let container = $('#popup-container')
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      container.fadeOut()
      $('#modalOverly').fadeIn(200)
      $('#modalOverly').hide()
    }
  })

  /*--------------------------------------
	  Promotion / Notification Cookie Bar 
	  -------------------------------------- */
  $(document).ready(function () {
    if (Cookies.get('promotion') != 'true') {
      $('.notification-bar').show()
    }
    $('.close-announcement').on('click', function () {
      $('.notification-bar').slideUp()
      Cookies.set('promotion', 'true', { expires: 1 })
      return false
    })
  })
})(jQuery)
