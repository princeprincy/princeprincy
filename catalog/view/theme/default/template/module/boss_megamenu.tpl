<?php 
if($data_template){
	echo $data_template;
} else { ?>
<?php 
	function showSubmenu($category) {
		if (count($category['children']) > 0) {
			echo '<div class="sub_menu"><ul>';
			foreach ($category['children'] as $cat) {
				echo '<li><a href="'.$cat['href'].'">'.$cat['name'].'</a>';
				showSubmenu($cat);
				echo '</li>';
			}
			echo '</ul></div>';
		}
	}
	function showmenuChild($category) {
		if (count($category['children']) > 0) {
			echo '<ul>';
			foreach ($category['children'] as $cat) {
				(($cat['children'])? $parent = ' class="parent"' : $parent='');
				echo '<li'.$parent.'><a href="'.$cat['href'].'">'.$cat['name'].'</a>';
				showmenuChild($cat);
				echo '</li>';
			}
			echo '</ul>';
		}
	}
?>

<div class="grid-container">
	<div class="grid-100">
		<!-- Mega menu -->
		<div class="cs_mega_menu" id="boss_menu" class="hide-on-mobile" >
			<ul class="ul_mega_menu">
			<?php foreach ($menus as $menu) { ?>
			<li class="menu_item level-1 parent">
				<a class="title_menu_parent" href="<?php echo $menu['href']; ?>"><?php echo $menu['title'] ?></a>
				
				<?php if (count($menu['menuchilds']) > 0) { ?>
				<div class="options_list" style="width: <?php echo $menu['dropdown_width']; ?>px;">
				
					<?php foreach ($menu['menuchilds'] as $menuchild) { ?>
					<div class="option" style="width: <?php echo $menuchild['child_width']; ?>px; float: left">
						<!--<a href="<?php echo $menuchild['href']; ?>"><?php echo $menuchild['title'] ?></a>-->
						<!-- html-->
						<?php if ($menuchild['type'] == 'html') { ?>
							<div class="staticblock"><?php echo $menuchild['content']; ?></div>
						<?php } ?>
						<!-- url-->
						<?php if ($menuchild['type'] == 'url') { ?>
							<div class="url"><a title="<?php echo $menuchild['content']; ?>" href="<?php echo $menuchild['href']; ?>"><?php echo $menuchild['content']; ?></a></div>
						<?php } ?>
						<!-- information -->
						<?php if ($menuchild['type'] == 'information') { ?>
							<ul class="column information">
								<?php foreach($menuchild['content'] as $information) { ?>
								<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
								<?php } ?>
							</ul>
						<?php } ?>
						
						<!-- manufacturer -->
						<?php if ($menuchild['type'] == 'manufacturer') { ?>
							<ul class="column manufacturer">
								<?php foreach($menuchild['content'] as $manufacturer) { ?>
									<li><a href="<?php echo $manufacturer['href']; ?>">
										<?php if ($manufacturer['show_image']) { ?><img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name']; ?>"/><?php } ?>
										<?php if ($manufacturer['show_name']) { ?><?php echo $manufacturer['name']; ?><?php } ?>
									</a></li>
								<?php } ?>
							</ul>
						<?php } ?>
						
						<!-- category -->
						<?php if ($menuchild['type'] == 'category') { ?>
						
							<?php if ($menuchild['parent']) { ?>
							<?php if($menuchild['parent']['show_parent']){?>
								<a href="<?php echo $menuchild['parent']['href']; ?>" class="parent">
									<?php if (($menuchild['parent']['show_image'])&&$menuchild['parent']['image']) { ?>
									<img src="<?php echo $menuchild['parent']['image']; ?>" alt="<?php echo $menuchild['parent']['name']; ?>" /><?php } ?>
									<?php echo $menuchild['parent']['name']; ?>
								</a>
							<?php } ?>
							<?php } ?>
							
							<ul class="column category">
								<?php foreach($menuchild['content'] as $category) { ?>
									<li>
										<a href="<?php echo $category['href']; ?>">
										<?php if (($category['show_image']) && $category['image']) { ?><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"/><?php } ?>
										<?php echo $category['name']; ?>
										</a>
										<?php if ($category['show_sub']) { showSubmenu($category); } ?>
									</li>
								<?php } ?>
							</ul>
						<?php } ?>
						
						<!-- product -->
						<?php if ($menuchild['type'] == 'product') { ?>
							<ul class="column product">
								<?php foreach($menuchild['content'] as $product) { ?>
									<li>
										<?php if ($product['thumb']) { ?><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a><br/><?php } ?>
											<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><br />
											<?php if (!$product['special']) { ?>
												<?php echo $product['price']; ?>
											<?php } else { ?>
												<span class="price-old"><?php echo $product['price']; ?></span>
												<span class="price-new"><?php echo $product['special']; ?></span>
											<?php } ?>
									</li>
								<?php } ?>
							</ul>
						<?php } ?>
						
					</div>
					<span class="spanOption" style="width: <?php echo $menuchild['child_width']; ?>px;" ></span>
					<?php } ?>
					
				</div>
				<span class="spanOptionList" style="width: <?php echo $menu['dropdown_width']; ?>px;" ></span>
				<?php } ?>
				
			</li>
			<?php } ?>
			</ul>
		</div>
		<!-- Menu Responsive-->
	</div>
</div>

<?php } ?>