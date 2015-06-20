<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
  <div class="btn-group">
    <button class="dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['code'] == $currency_code) { ?>
    <strong><?php echo $currency['code']; ?></strong>
    <?php } ?>
    <?php } ?>
    <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_currency; ?></span> <i class="fa fa-caret-down"></i></button>
    <ul class="dropdown-menu">
      <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['symbol_left']) { ?>
      <li><a href="<?php echo $currency['code']; ?>" title="<?php echo $currency['title']; ?>"><?php echo $currency['code']; ?></a></li>
      <?php } else { ?>
      <li><a href="<?php echo $currency['code']; ?>" title="<?php echo $currency['title']; ?>"><?php echo $currency['code']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="currency_code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
