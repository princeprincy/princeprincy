</div>
</div>
</section>
<footer id="footer">
<?php 
require_once( DIR_TEMPLATE.$this->config->get('config_template')."/template/bossthemes/boss_library.php" );
$helper = ThemeControlHelper::getInstance( $this->registry,$this->config->get('config_template'));
?>
	
	<div class="container">
		<div class="row">
			<?php if ($informations) { ?>
			<div class="column col-xs-24 col-sm-12 col-md-6 not-animated" data-animate="fadeInUp" data-delay="600">
				<h3><?php echo $text_information; ?></h3>
				<ul>
				<?php foreach ($informations as $information) { ?>
					<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
				<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				</ul>
			</div>
			<?php } ?>
			<div class="column col-xs-24 col-sm-12 col-md-6 not-animated" data-animate="fadeInUp" data-delay="800">
				<h3><?php echo $text_service; ?></h3>
				<ul>
				  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				  <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				</ul>
			</div>
			<div class="column col-xs-24 col-sm-12 col-md-6 not-animated" data-animate="fadeInUp" data-delay="1000">
				<h3><?php echo $text_account; ?></h3>
				<ul>
				  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				</ul>
			</div>
			
			<!-- block social -->
			<?php echo $helper->getBlockByPosition('b_Block_Footer_3'); ?>
			
		</div>
		
		<div class="footer-middle">
			<div class="row">
				<?php $modules =$helper->getModulesByPosition('footer'); 
					if( $modules ){ ?>
						<?php foreach ($modules as $module) { 
							echo $module;
						} ?>
				<?php } ?>
				<div class="col-xs-24 col-sm-12 col-md-12 pull-right not-animated" data-animate="fadeInUp" data-delay="800">
				<?php echo $helper->getBlockByPosition('b_Block_Footer_1'); ?>
				</div>
			</div>
		</div>
	</div>
</footer>
<footer id="footer_bottom">
	<div class="container">
		<div class="row boss-footer-column">
			<div class="footer-link col-xs-24 col-sm-24 col-md-24">
				<?php echo $helper->getBlockByPosition('b_Block_Footer_2'); ?>
			</div>
			<div id="powered" class="col-xs-24 col-sm-24 col-md-24">
				<?php echo $powered; ?>
			</div>
		</div>
	</div>
</footer>
</section>
</body></html>