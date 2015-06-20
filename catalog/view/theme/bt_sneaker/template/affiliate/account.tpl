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
<?php echo $column_left; ?>	<?php echo $column_right; ?>
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
      <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
    </ul>
  </div>
  <div class="content myaccount col-md-12 col-xs-24">
  <h2><?php echo $text_my_tracking; ?></h2>
    <ul>
      <li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
    </ul>
  </div>
  <div class="content myaccount col-md-12 col-xs-24">
  <h2><?php echo $text_my_transactions; ?></h2>
    <ul>
      <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
    </ul>
  </div>
  <?php echo $content_bottom; ?></div></div>
<?php echo $footer; ?>