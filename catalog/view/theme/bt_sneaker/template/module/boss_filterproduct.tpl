<!--module boss - fillter product-->
<?php if(!empty($tabs)){ ?>
<script type="text/javascript">
jQuery(document).ready(function($){
  
	initCarousel(<?php echo $use_tab; ?>,<?php echo $module; ?>,<?php echo $use_scrolling_panel; ?>);
	
	<?php if(!$use_tab) { ?>
		checkDevices(<?php echo $module; ?>);
	<?php } ?>

	$("a.head_tabs<?php echo $module;?>").click(function() {
	
		<?php if(!$use_tab) { ?>
			if(getWidthBrowser() > 767){
				return false;
			}
		<?php } ?>
		
		if(!$(this).parent().hasClass('active')) {
		
			$(".head_tabs<?php echo $module;?>").parent().removeClass("active");
			var $src_tab = $(this).attr("data-src");
			$($src_tab).parent().addClass("active");
			$(".content_tabs<?php echo $module;?>").hide();
			var $selected_tab = $(this).attr("href");
			$($selected_tab).fadeIn();
			
			<?php if ($use_scrolling_panel) { ?>
				var $selected_carousel = $(this).attr("data-crs");
				if($selected_carousel != ""){
					execCarousel($selected_carousel);
				}
			<?php } ?>
		}
		return false;
	});

	$(window).resize(function() {
		<?php if(!$use_tab) { ?>
			checkDevices(<?php echo $module; ?>);
		<?php } ?>
	});
});
</script>

<div id="boss_homefilter_tabs<?php echo $module; ?>" class="boss_homefilter_tabs">
  
  <div id="tabs_container<?php echo $module; ?>" class="hide-on-mobile tabs_container">
  <?php if($use_tab){ ?>
	<ul id="tabs<?php echo $module;?>" class="tabs-headings tabs">
	<?php foreach ($tabs as $numTab => $tab) { ?>
		 <li <?php if($numTab == 0) echo 'class="active"'; ?>><a class="head_tab<?php echo $numTab.$module; ?> head_tabs<?php echo $module;?>" href="#content_tab<?php echo $numTab.$module; ?>" data-src=".head_tab<?php echo $numTab.$module; ?>" data-crs="#carousel_tab<?php echo $numTab.$module; ?>"><?php echo $tab['title']; ?></a></li>
	<?php } ?>
	</ul>
  <?php } ?>
  </div>
  
  <div id="tabs_content_container<?php echo $module; ?>" class="home_filter_content tabs_content_container">
  <div class="box-content">
	<?php foreach ($tabs as $numTab => $tab) { ?>
    <h3  class="<?php if($numTab == 0) echo 'active'; ?> <?php if($use_tab){ echo 'hide-on-desktop';} ?>"><a class="head_tab<?php echo $numTab.$module; ?> head_tabs<?php echo $module;?>" href="#content_tab<?php echo $numTab.$module; ?>" data-src=".head_tab<?php echo $numTab.$module; ?>" data-crs="#carousel_tab<?php echo $numTab.$module; ?>"><?php echo $tab['title']; ?></a></h3>
	
    <div id="content_tab<?php echo $numTab.$module; ?>" class="content_tabs<?php echo $module; ?> list_carousel responsive" style="display:<?php if($numTab == 0) echo 'block'; else echo 'none'; ?>">
      <?php if(!empty($tab['products'])){ ?>
		<ul id="carousel_tab<?php echo $numTab.$module; ?>" data-prev="#prev_tab<?php echo $numTab.$module; ?>" data-next="#next_tab<?php echo $numTab.$module; ?>" class="box-product">
			<?php foreach ($tab['products'] as $key => $product){?><li class="not-animated" data-animate="bounceIn" data-delay="<?php echo $key*110 + 200; ?>">
			<div class="box-item">
			<div class="product-block">
			<?php if ($product['thumb']) { ?>
				<div class="image">
				<a class="cs_img"  data-id="<?php echo $product['product_id']; ?>"  href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
				<b>&nbsp;</b>
				</a>
				</div>
				<?php } ?>
				<div class="product-meta">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
				<?php if ($product['rating']) { ?>
				<div class="rating"><img src="catalog/view/theme/<?php echo $template; ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
				<?php } ?>
				<?php if ($product['price']) { ?>
				<div class="price">
				  <?php if (!$product['special']) { ?>
				  <?php echo $product['price']; ?>
				  <?php } else { ?>
				  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
				  <?php } ?>
				</div>
				<?php } ?>
				<div class="product-actions">
				<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary" /></div>
				<div class="wishlist"><a onclick="boss_addToWishList('<?php echo $product['product_id']; ?>');"><b>&nbsp;</b><?php echo $button_wishlist; ?></a></div>
				<div class="compare"><a onclick="boss_addToCompare('<?php echo $product['product_id']; ?>');"><b>&nbsp;</b><?php echo $button_compare; ?></a></div>
				</div>
			</div>
			</div>
			</div>
			  </li><?php } ?></ul>
		<div class="clearfix"></div>
		<?php if ($use_scrolling_panel) { ?>
			<a id="prev_tab<?php echo $numTab.$module; ?>" class="prev" href="javascript:void(0)">&lt;</a>
			<a id="next_tab<?php echo $numTab.$module; ?>" class="next" href="javascript:void(0)">&gt;</a>
		<?php } ?>
		<?php } ?>
    </div>
	<?php } ?>
  </div>
  </div>
</div>
<?php } ?>
<!--module boss - fillter product-->