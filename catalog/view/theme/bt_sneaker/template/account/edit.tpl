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
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
</div>

<?php echo $column_left; ?>	<?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_your_details; ?></h2>
    <div class="content">
      <table class="form">
        <tr>
          <td> <?php echo $entry_firstname; ?><span class="required">*</span></td></tr>
          <tr><td><input type="text" name="firstname" value="<?php echo $firstname; ?>" />
            <?php if ($error_firstname) { ?>
            <span class="error"><?php echo $error_firstname; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_lastname; ?><span class="required">*</span> </td></tr>
          <tr><td><input type="text" name="lastname" value="<?php echo $lastname; ?>" />
            <?php if ($error_lastname) { ?>
            <span class="error"><?php echo $error_lastname; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_email; ?><span class="required">*</span> </td></tr>
          <tr><td><input type="text" name="email" value="<?php echo $email; ?>" />
            <?php if ($error_email) { ?>
            <span class="error"><?php echo $error_email; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_telephone; ?><span class="required">*</span> </td></tr>
          <tr><td><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
            <?php if ($error_telephone) { ?>
            <span class="error"><?php echo $error_telephone; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fax; ?></td></tr>
          <tr><td><input type="text" name="fax" value="<?php echo $fax; ?>" /></td>
        </tr>
      </table>
    </div>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="btn btn-primary btn-upload"><?php echo $button_back; ?></a></div>
      <div class="right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary btn-continue" />
      </div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>