<?php 
	function isMobile($user_agent) {
		$mobile = false;
		if(stripos($user_agent,"iPod") || stripos($user_agent,"iPhone") || stripos($user_agent,"webOS") || stripos($user_agent,"BlackBerry") || stripos($user_agent,"windows phone") || stripos($user_agent,"symbian") || stripos($user_agent,"vodafone") || stripos($user_agent,"opera mini") || stripos($user_agent,"windows ce") || stripos($user_agent,"smartphone") || stripos($user_agent,"palm") || stripos($user_agent,"midp")) {
			$mobile = true;
		}
		if(stripos($user_agent,"Android") && stripos($user_agent,"mobile")){
		    $mobile = true;
		}else if(stripos($user_agent,"Android")){
	    	$mobile = false;
	   	}
		
		return $mobile;
	}
	
	function isTablet($user_agent) {
		$tablet = false;
		if(stripos($user_agent,"Android") && stripos($user_agent,"mobile")){
		    $tablet = false;
		}else if(stripos($user_agent,"Android")){
	    	$tablet = true;
	   	}
		if(stripos($user_agent,"iPad") || stripos($user_agent,"RIM Tablet") || stripos($user_agent,"hp-tablet") || stripos($user_agent,"Kindle Fire")) {
			$tablet = true;
		}
		
		return $tablet;
	}
	$user_agent = isset($this->request->server['HTTP_USER_AGENT'])?$this->request->server['HTTP_USER_AGENT']:'';
?>
<div id="boss_cart">
  <div class="heading">
    <h4></h4>
    <a <?php if(!isMobile($user_agent) && !isTablet($user_agent)){ ?> href="<?php echo $cart; ?>" <?php } ?> class="show_hide_cart"><span id="cart-total"><?php echo $text_items; ?></span></a></div>
  <div class="content" id="cart_content">
  <b>&nbsp;</b>
    <?php if ($products || $vouchers) { ?>
    <div class="mini-cart-info">
      <table>
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image"><?php if ($product['thumb']) { ?>
           <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="name"><div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <div class="small_info">
              <?php foreach ($product['option'] as $option) { ?>
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
              <?php } ?>
              <?php if ($product['recurring']): ?>
              - <small><?php echo $text_payment_profile ?> <?php echo $product['profile']; ?></small><br />
              <?php endif; ?>
            </div>			
			<div class="quantity price"><?php echo $product['quantity']; ?>&nbsp;x</div>
			<div class="total price"><?php echo $product['total']; ?></div>          
			<div class="remove"><a onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&amp;remove=<?php echo $product['key']; ?>' : $('#boss_cart').load('index.php?route=module/cart&amp;remove=<?php echo $product['key']; ?>' + ' #boss_cart > *');"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></div>
	      </td>
		</tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="image voucher"></td>
          <td class="name"><span><?php echo $voucher['description']; ?></span>
          <div class="quantity"><div class="price">1&nbsp;x</div></div>
		   <div class="total price"><?php echo $voucher['amount']; ?></div>
			<div class="remove">
			<a onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&amp;remove=<?php echo $voucher['key']; ?>' : $('#boss_cart').load('index.php?route=module/cart&amp;remove=<?php echo $voucher['key']; ?>' + ' #boss_cart > *');"><img class="btooltip" data-toggle="tooltip" data-placement="bottom" data-original-title="<?php echo $button_remove; ?>" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>
			
			</div>
        </td>
		</tr>
        <?php } ?>
      </table>
    </div>
     <div class="mini-cart-total">
      <table>
        <?php foreach ($totals as $total) { ?>
        <tr>
          <td class="left<?php echo ($total==end($totals) ? ' last' : ''); ?>"><?php echo $total['title']; ?>:</td>
          <td class="right price<?php echo ($total==end($totals) ? ' last' : ''); ?>"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </table>
    </div>
    <div class="checkout">
		<a class="btn btn-primary btn-upload" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> 
		<a class="btn btn-primary btn-continue" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
    <?php } else { ?>
    <div class="empty"><?php echo $text_empty; ?></div>
    <?php } ?>
  </div>
</div>