<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/bossthemes/layout_config.tpl" ); ?>
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
<div id="content"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
  <?php if ($products) { ?> 
 <div class="table-responsive wishlist-info">
    <table class="table table-bordered">
      <thead>
        <tr>
          <td class="image" colspan="2"><?php echo $column_name; ?></td>
          <td class="model"><?php echo $column_model; ?></td>		  
		  <td class="unitprice"><?php echo $column_price; ?></td>
          <td class="stock"><?php echo $column_stock; ?></td>
		  <td class="remove"><?php echo $button_remove; ?></td>
          <td class="action"></td>         
        </tr>
      </thead>
      <?php foreach ($products as $count => $product) { ?>
      <tbody <?php if($count==0){echo 'class="first"';} ?>id="wishlist-row<?php echo $product['product_id']; ?>">
        <tr>
          <td class="image<?php echo ($product==end($products) ? ' last' : ''); ?>"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><span><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></span></a>
            <?php } ?></td>
          <td class="name<?php echo ($product==end($products) ? ' last' : ''); ?>"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
          <td class="model<?php echo ($product==end($products) ? ' last' : ''); ?>"><?php echo $product['model']; ?></td>
		  <td class="unitprice<?php echo ($product==end($products) ? ' last' : ''); ?>"><?php if ($product['price']) { ?>
            <div class="price<?php echo ($product==end($products) ? ' last' : ''); ?>">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
              <?php } ?>
            </div>
            <?php } ?></td>
		  <td class="stock<?php echo ($product==end($products) ? ' last' : ''); ?>"><?php echo $product['stock']; ?></td>		  
		  <td class="remove<?php echo ($product==end($products) ? ' last' : ''); ?>"><a class="btooltip" data-toggle="tooltip" data-placement="bottom" data-original-title="<?php echo $button_remove; ?>" href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>          
          <td class="action<?php echo ($product==end($products) ? ' last' : ''); ?>"><input type="button" class="btn btn-primary" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" value="<?php echo $button_cart; ?>"></td>          
        </tr>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="btn btn-primary btn-continue"><span class="button_fr"><?php echo $button_continue; ?></span></a></div>
  </div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="left"><a href="<?php echo $continue; ?>" class="btn btn-primary btn-continue"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>