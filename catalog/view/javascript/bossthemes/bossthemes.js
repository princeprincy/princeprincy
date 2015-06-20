var isMobile = /iPhone|iPod|iPad|Phone|Mobile|Android|hpwos/i.test(navigator.userAgent);
var isPhone = /iPhone|iPod|Phone|Android/i.test(navigator.userAgent);

jQuery(document).ready(function($) {
	var show_hide = 0; 
    var show_search = 0;
	
	$('.boss_menu input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			location = url;
		}
	});
	
	// Currency
	$('#currency a').on('click', function(e) {
		e.preventDefault();
		
		$('#currency input[name=\'currency_code\']').attr('value', $(this).attr('href'));
	
		$('#currency').submit();
	});	
	
	/* Tooltip */
	$('.btooltip').tooltip();	
	

	if(isMobile||isPhone){
		$('.show_hide_cart').click(function(){
			$("#boss_cart .content").slideToggle();
		});
	}else{
		$('#boss_cart').hover(function() {
			$('#boss_cart').addClass('active');
			$("#boss_cart .content").slideDown();
			$('#boss_cart').mouseleave(function() {
				$('#boss_cart').removeClass('active');
				$("#boss_cart .content").hide();
			});
		});
	}
	
	/* Remove Cart */
	$('#boss_cart .remove > a').live('click', function() {		
		$('#boss_cart').addClass('active');	
		$('#boss_cart').live('mouseleave', function() {
			$('#boss_cart').removeClass('active');
		});
	});
	
	$("#boss_menu ul.ul_mega_menu > li > a").hover(
        function () {
			$(this).next('.dropdown-menu').slideDown();
        },
        function () {
            $(this).parent().mouseleave(function() {
            $('#boss_menu .dropdown-menu').hide();
        });
    });
	
	$("#menu_default ul.navbar-nav > li > a").hover(
        function () {
            $(this).next('.sub_menu_default').slideDown();
        },
        function () {
            $(this).parent().mouseleave(function() {
            $(this).find('.sub_menu_default').hide();
        });
    });
	
	$('body').mouseup(function(login) {
        if(!($(login.target).parents('#search').length > 0)) {
            show_search = 0;
            $('#search-form').hide();
        }
        if(!($(login.target).parents('#boss-login').length > 0)) {
            show_hide=0;
            $('#content-login').hide();
        }
    });
	
});
function boss_addToCart(product_id) {
  $.ajax({
      url: 'index.php?route=bossthemes/cart/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) {
          if (json['redirect']) {
              location = json['redirect'];
          }

          if (json['success']) {
              addProductNotice(json['title'], json['thumb'], json['success'], 'success');
			  $('#cart-total').html(json['total']);
			  $('#cart_content').load('index.php?route=module/cart #cart_content > *');
          }
      }
  });
}

function boss_addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=bossthemes/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
				addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				$('#wishlist-total').html(json['total']);
			}
		}
	});
}

function boss_addToCompare(product_id) {
	$.ajax({
		url: 'index.php?route=bossthemes/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
                addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				$('#compare-total').html(json['total']);
			}
		}
	});
}


function addProductNotice(title, thumb, text, type) {
	$.jGrowl.defaults.closer = true;
	var tpl = thumb + '<h3>'+text+'</h3>';
	$.jGrowl(tpl, {		
		life: 4000,
		header: title,
		speed: 'slow'
	});
}


/* mega boss menu */
$(window).load(function(){
	resizeWidth();
});
(function($,sr){
  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
      var timeout;

      return function debounced () {
          var obj = this, args = arguments;
          function delayed () {
              if (!execAsap)
                  func.apply(obj, args);
              timeout = null; 
          };

          if (timeout)
              clearTimeout(timeout);
          else if (execAsap)
              func.apply(obj, args);

          timeout = setTimeout(delayed, threshold || 100); 
      };
  }
// smartresize 
 jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');

var TO = false;
$(window).smartresize(function(){
if(TO !== false)
    clearTimeout(TO);
 TO = setTimeout(resizeWidth, 400); //400 is time in miliseconds
 //resizeWidth();
});

function resizeWidth()
{
	var menuWidth = 1181;
	var numColumn = 6;
	var currentWidth = $("#boss_menu .boss-menu").outerWidth();
	if (currentWidth < menuWidth) {
		new_width_column = currentWidth / numColumn;
		$('#boss_menu div.options_list').each(function(index, element) { 
			var options_list = $(this).next();	
      $(this).width(Math.ceil(parseFloat(options_list.css("width"))/menuWidth*numColumn * new_width_column));     
		});
		$('#boss_menu div.option').each(function(index, element) {
			var option = $(this).next();
		$(this).width(parseFloat(option.css("width"))/menuWidth*numColumn * new_width_column);
		$("ul", this).width(parseFloat(option.css("width"))/menuWidth*numColumn * new_width_column);
		
		});
		$('#boss_menu ul.column').each(function(index, element) {
			var column = $(this).next();
		$(this).width(parseFloat(column.css("width"))/menuWidth*numColumn * new_width_column);
		});
	}
	
	$('#boss_menu ul > li > a + div').each(function(index, element) {
		var menu = $('#boss_menu .boss-menu').offset();
		var dropdown = $(this).parent().offset();
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#boss_menu .boss-menu').outerWidth());
		if (i > 0) {
			$(this).css('margin-left', '-' + i + 'px');
		}
		else
			$(this).css('margin-left', '0px');
	});
}