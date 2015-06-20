<div class="box box_alphabet">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="boss-alphabet">
      <ul>
        <?php foreach ($alphabet as $char) { ?>
        <li><a href="<?php echo $char['href']; ?>"><span><?php echo $char['char']; ?></span><b>&nbsp;</b></a></li>
        <?php } ?>
      </ul>
	</div>
  </div>
</div>
