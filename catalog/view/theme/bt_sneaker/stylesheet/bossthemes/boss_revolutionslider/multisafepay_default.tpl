<style type="text/css">

#forceright{
	position:relative;
	margin:0;
	padding:0;
	width:100%;
	width:auto;
	text-align:right;
	}
#forceright a{
	position:relative;
	display:block;
	float:right;
}
</style>
<form action="<?php echo $action; ?>" method="post" id="payment">  
	<input type="hidden" name="cartId" value="<?php echo $MSP_CARTID; ?>" />
	<input type='hidden' name='gateway' value='<?php echo $gateway ?>' />
</form>
<div id="forceright">
	<noscript><a onclick="$('#payment').submit();" class="button"><span><?php echo $button_confirm; ?></span></a></noscript>
	<a onclick="$('#payment').submit();" class="button"><span><?php echo $button_confirm; ?></span></a>
</div>
