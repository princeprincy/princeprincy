<div class="boss-featured col-md-24 dis_pad" style="clear:both;">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">
		<?php $item = 4; ?> 
		<?php $col = 24/$item;?>
		<?php $time_delay = 100; ?>
      <?php foreach ($products as $i => $product) { ?>
     <?php if($i++%$item==0){ ?><?php } ?>
		<div class="box-item col-sm-8 col-xs-24 col-md-<?php echo $col; ?> not-animated" data-animate="bounceIn" data-delay="<?php echo $time_delay; ?>">
		<?php $time_delay = $time_delay + 100; ?>
		<div class="product-block">
        <?php if ($product['thumb']) { ?>
        <div class="image"><a class="cs_img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /><b>&nbsp;</b></a></div>
        <?php } ?>
		<div class="product-meta">
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
		<div class="product-actions">
        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary" /></div>
		<div class="wishlist"><a onclick="boss_addToWishList('<?php echo $product['product_id']; ?>');"><b>&nbsp;</b><?php echo $button_wishlist; ?></a></div>
		<div class="compare"><a onclick="boss_addToCompare('<?php echo $product['product_id']; ?>');"><b>&nbsp;</b><?php echo $button_compare; ?></a></div>
        </div>
        </div>
      </div>
      </div>
	  <?php if((($i%$item)==0) || ($i==count($products))){ ?> <?php } ?>
      <?php } ?>
	  <?php if($limit > $item){ ?>
	  <div class="prod-load-more"><a title="load more" onclick="loadMoreProduct(2,<?php echo $module; ?>)" href="javascript:void(0)">LOAD MORE</a></div>
	  <?php } ?>
    </div>
	<div class="loading_featured" style="position:absolute;bottom:-12px;left:50%"></div>
  </div>
</div>
<script type="text/javascript"><!--
function loadMoreProduct($page,$module){
	$.ajax({
		url: 'index.php?route=module/boss_featured/viewMoreProducts&page=' + $page+'&module=' + $module,
		dataType: 'json',
		beforeSend: function() {
			$('.loading_featured').html('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('.loading_featured .wait').remove();
		},
		success: function(json) {
			$('.prod-load-more').remove();
			$('.boss-featured .box-product').append(json['html']);
			if ( typeof boss_quick_shop == 'function' ) { 
				boss_quick_shop();
			}
		}
	});
}
//--></script>
