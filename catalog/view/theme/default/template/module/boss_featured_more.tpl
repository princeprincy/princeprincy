<?php $item = 4; ?> 
<?php $col = 24/$item;?>
<?php foreach ($products as $i => $product) { ?>
     <?php if($i++%$item==0){ ?> <?php } ?>
	<div class="box-item col-sm-8 col-xs-24 col-md-<?php echo $col; ?>">
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
	  <?php if((($i%$item)==0) || ($i==count($products))){ ?><?php } ?>
<?php } ?>
<?php if($limit > $nowitem){ ?>
<div class="prod-load-more">
	<a onclick="loadMoreProduct(<?php echo $page; ?>,<?php echo $module; ?>)" href="javascript:void(0)">LOAD MORE</a>
</div>
<?php } ?>