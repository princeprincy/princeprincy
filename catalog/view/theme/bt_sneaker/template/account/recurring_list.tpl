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
</div>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <?php if ($profiles) { ?>
    <table class="list">
        <thead>
        <tr>
            <td class="left"><?php echo $column_profile_id; ?></td>
            <td class="left"><?php echo $column_created; ?></td>
            <td class="left"><?php echo $column_status; ?></td>
            <td class="left"><?php echo $column_product; ?></td>
            <td class="right"><?php echo $column_action; ?></td>
        </tr>
        </thead>
        <tbody>
        <?php if ($profiles) { ?>
        <?php foreach ($profiles as $profile) { ?>
        <tr>
            <td class="left">#<?php echo $profile['id']; ?></td>
            <td class="left"><?php echo $profile['created']; ?></td>
            <td class="left"><?php echo $status_types[$profile['status']]; ?></td>
            <td class="left"><?php echo $profile['name']; ?></td>
            <td class="right"><a href="<?php echo $profile['href']; ?>"><img src="catalog/view/theme/default/image/info.png" alt="<?php echo $button_view; ?>" title="<?php echo $button_view; ?>" /></a></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
            <td class="center" colspan="5"><?php echo $text_empty; ?></td>
        </tr>
        <?php } ?>
        </tbody>
    </table>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php } ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="btn btn-primary btn-continue"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>