<?php echo $header; ?>
<div class="col-xs-24 col-sm-24 col-md-24">
	<div id="breadcrumb">	
		<ol class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<?php if($breadcrumb == end($breadcrumbs)){ ?>
					<li><a class="last" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php }else{ ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><span><?php echo $breadcrumb['text']; ?></span></a></li>
				<?php } ?>
			<?php } ?>
		</ol>
	</div>
</div>
<div class="col-xs-24 col-sm-24 col-md-24">
  <h1><?php echo $heading_title; ?></h1>
</div>
		<?php echo $column_left; ?>
		<?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="row">
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
  <div class="content myaccount col-md-12 col-xs-24">
  <h2><?php echo $text_my_account; ?></h2>
    <ul>
      <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
    </ul>
  </div>
  <div class="content myaccount col-md-12 col-xs-24">
  <h2><?php echo $text_my_orders; ?></h2>
    <ul>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
      <?php if ($reward) { ?>
      <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
    </ul>
  </div>
  <div class="content myaccount col-md-12 col-xs-24">
  <h2><?php echo $text_my_newsletter; ?></h2>
    <ul>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?> 