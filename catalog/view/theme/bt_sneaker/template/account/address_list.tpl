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
  <h1><?php echo $heading_title; ?></h1>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
</div>
<?php echo $column_left; ?>	<?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <h2><?php echo $text_address_book; ?></h2>
  <?php foreach ($addresses as $result) { ?>
  <div class="content">
    <table style="width: 100%;">
      <tr>
        <td class="adress_text"><?php echo $result['address']; ?></td>
        <td style="text-align: right;"><a href="<?php echo $result['update']; ?>" class="btn btn-primary" style="margin-bottom:10px"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-primary" style="margin-bottom:10px"><?php echo $button_delete; ?></a></td>
      </tr>
    </table>
  </div>
  <?php } ?>
  <div class="buttons">
    <div class="left"><a href="<?php echo $back; ?>" class="btn btn-primary btn-upload"><?php echo $button_back; ?></a></div>
    <div class="right"><a href="<?php echo $insert; ?>" class="btn btn-primary btn-continue"><?php echo $button_new_address; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>