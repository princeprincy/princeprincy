<div class="modal-content">
<div class="modal-header"><h1 class="modal-title" id="myModalLabel"><?php echo $heading_title; ?></h1><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></div>
<div class="modal-body">
<div id="notification"></div>
<div id="content">
  <div  id="product-quick" class="product-info">
  <div class="row">
	 <?php if ($thumb || $images) { ?>
     <div class="left col-md-10 col-xs-16">
     <?php if ($thumb) { ?>
	<div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id='zoomqs' rel=""><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>			
	</div>
	<?php } ?>
	<?php if ($images) { ?>
	<div class="list_carousel responsive">
		<ul id="boss-image-additionalqs"><?php foreach ($images as $image) { ?><li ><a  href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoomqs', smallImage: '<?php echo $image['thumb']; ?>' "><img src="<?php echo $image['addition']; ?>"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li><?php } ?></ul> 
	</div>	
	<?php } ?>
    </div>
    <?php } ?>
    <div class="right col-md-14 col-xs-24">
      <div class="description">
        <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span><b class="stock"><?php echo $stock; ?></b>
	  </div>
     
      <?php if ($profiles): ?>
      <div class="profiles options">
          <h2><?php echo $text_payment_profile ?><span class="required"> *</span></h2>
          
		  <select class="profiles_sl"name="profile_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($profiles as $profile): ?>
              <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
              <?php endforeach; ?>
          </select>
          <span id="profile-description"></span>
      </div>
      <?php endif; ?>
      <?php if ($options) { ?>
      <div class="options">
        <h2><?php echo $text_option; ?></h2>
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
		<div class="boss_check">
		<div class="box-check">
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <p><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></p>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
		</div>
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
		<div class="box-check">
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <p><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></p>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        </div>
		</div>
       
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <table class="option-image">
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option button_opt">
          <div class="title_text upload_bt"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <span class="button"><input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="btn btn-primary btn-upload"></span>
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text datetime_box" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="title_text"><b><?php echo $option['name']; ?>:</b>
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?></div>
          <input type="text" class="text datetime_box" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
	  
    <div class="cart">  
      <?php if ($review_status) { ?>
      <div class="review">
        <div><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /></div>        
      </div>
	  <?php } ?>
		<div class="price_info">
	   <?php if ($price) { ?>      
        <?php if (!$special) { ?>
        <span class="price"><?php echo $price; ?></span>
        <?php } else { ?>
        <span class="price-new"><?php echo $special; ?></span><span class="price-old"><?php echo $price; ?></span> 
        <?php } ?>
        <?php } ?>
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span>
        <?php } ?>
        <?php if ($discounts) { ?>
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
	   <div class="quantily_info">
			<div class="title_text"><b><?php echo $text_qty; ?></b></div>
            <div class="select_number">                
				<input type="text" class="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
                <button onclick="changeQty(1); return false;" class="increase">+</button>
                <button onclick="changeQty(0); return false;" class="decrease">-</button>            	
            </div>
            <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />			
		<?php if ($minimum >1) { ?>
			<div class="minimum"><?php echo $text_minimum; ?></div>			
		<?php } ?>
        </div>      
		<div class="action">
			<input type="button" value="<?php echo $button_cart; ?>" id="buttonqs-cart" class="btn btn-primary" title="<?php echo $button_cart; ?>" />
			<br/>
			<div class="wishlist"><a class="wishlist" onclick="boss_addToWishList('<?php echo $product_id; ?>');" title="<?php echo $button_wishlist; ?>"><b>&nbsp;</b><?php echo $button_wishlist; ?></a></div>
			<div class="compare"><a class="compare" onclick="boss_addToCompare('<?php echo $product_id; ?>');" title="<?php echo $button_compare; ?>"><b>&nbsp;</b><?php echo $button_compare; ?></a></div>
		</div>
      </div>
    </div>
  </div>
  </div>
</div>
</div>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.carouFredSel-6.2.0-packed.js"></script>
<script type="text/javascript"><!--
	

$.fn.CloudZoom.defaults = {
	position: 'inside',
	tint: '#ffffff',
	tintOpacity: 0.5,
	lensOpacity: 0.5,
	softFocus: false,
	smoothMove: 3,
	showTitle: false,
	titleOpacity: 0.5,
	adjustX: 0,
	adjustY: 0
};
$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
function changeQty(increase) {
    var qty = parseInt($('.select_number').find("input").val());
    if ( !isNaN(qty) ) {
        qty = increase ? qty+1 : (qty > <?php echo $minimum; ?> ? qty-1 : <?php echo $minimum; ?>);
        $('.select_number').find("input").val(qty);
    }
}
$('#buttonqs-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=bossthemes/cart/add',
		type: 'post',
		data: $('#product-quick input[type=\'text\'], #product-quick input[type=\'hidden\'], #product-quick input[type=\'radio\']:checked, #product-quick input[type=\'checkbox\']:checked, #product-quick select, #product-quick textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
				addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				$('#cart-total').html(json['total']);  
				$('#cart_content').load('index.php?route=module/cart #cart_content > *');
				$('#myModal').modal('hide');
				$('#myModal').on('hidden.bs.modal', function () {
					$('#myModal > .modal-dialog >.modal-content').remove();
				});
			}	
		}
	});
});
$(window).load(function(){
    $('#boss-image-additionalqs').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
        prev: '#prev_image_additionalqs',
        next: '#next_image_additionalqs',
        swipe: {
        onTouch : true
        },
        items: {
            width: 96,
            height: 100,
            visible: {
            min: 1,
            max: 3
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
    });
});
//--></script>