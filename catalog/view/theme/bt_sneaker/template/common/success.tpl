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
<?php echo $column_left; ?>	<?php echo $column_right; ?>
<div>
<div id="content"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <?php echo $text_message; ?>
  <div class="buttons">
    <div class="left"><a href="<?php echo $continue; ?>" class="btn btn-primary btn-continue"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div></div>
<?php echo $footer; ?>