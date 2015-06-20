<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href='http://fonts.googleapis.com/css?family=Advent+Pro:400,600,700,500' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/bootstrap-custom.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/cs.animate.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/jquery.jgrowl.css" />

<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/font-awesome.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/responsive.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.jgrowl.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/bootstrap.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/bossthemes.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/getwidthbrowser.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.appear.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.smoothscroll.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/cs.script.js"></script>
 <!--[if lt IE 9]>
  <script type="text/javascript" src="catalog/view/javascript/bossthemes/html5shiv.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/respond.min.js"></script>
<![endif]-->

<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/bt_sneaker/stylesheet/ie8.css" />
<![endif]-->
<!--[if IE 9]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/bt_sneaker/stylesheet/ie9.css" />
<![endif]-->

<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->

<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php /******************THEME FONTS SETTINGS*********************/ ?>
<?php $editor = $this->config->get('b_General_Show'); ?>
<?php if (isset($editor)) {  ?>
<?php include "catalog/view/theme/".$this->config->get('config_template')."/template/bossthemes/Boss_font_setting.php"; ?>
<?php include "catalog/view/theme/".$this->config->get('config_template')."/template/bossthemes/Boss_color_setting.php"; ?>
<?php } ?>
<script type="text/javascript">
$(document).ready(function() {
$('.cs-tooltip').tooltip();
});
</script>
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
$('.cs-tooltip').tooltip();
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>

<?php 
$customcode = array();
$customcode =  $this->config->get('customcode');
?>
<!-- custom css-->
<?php if($customcode['custom_css']){ ?>
	<style type="text/css">
	<?php echo $customcode['custom_css'];?>
	</style>
<?php } ?>
<!-- end custom css-->

<!-- custom javascript-->
<?php if($customcode['custom_java']){ ?>
	<script type="text/javascript"><!--
	<?php echo $customcode['custom_java']; ?>
	//--></script>
<?php } ?>
<!-- end custom javascript-->

<?php echo $google_analytics; ?>
</head>
<body>
<?php 
require_once( DIR_TEMPLATE.$this->config->get('config_template')."/template/bossthemes/boss_library.php" );
$helper = ThemeControlHelper::getInstance( $this->registry,$this->config->get('config_template'));
?>
<?php
$b_Mode_CSS = $this->config->get('b_Mode_CSS');
if(!isset($b_Mode_CSS)){
	$b_Mode_CSS ="wide";
}
?>
<section id="page-container" class="<?php echo $b_Mode_CSS; ?>">
<header id="header">
	<div class="container">
		<div class="row">
			<div class="header-center col-sm-24 col-md-6 col-xs-24">
			<?php if ($logo) { ?>
				<div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
			<?php } ?>
			</div>
			<div class="header-right col-sm-14 col-md-9 col-xs-24">
				<?php echo $currency; ?>
				<?php echo $language; ?>
				
				<div id="search">
					<a class="icon_seach"><?php echo $text_search; ?></a>
					<div class="frame_big search_big">
						<div id="search-form">
							<div id="search-form-bot">
								<div class="input_key"><input type="text" name="search" autocomplete="off" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" /></div>
								<div data-toggle="tooltip" data-placement="bottom" data-original-title="<?php echo $text_search; ?>" class="button-search button-color btooltip"><?php echo $text_search; ?></div>
							</div><!-- end #search-form-bot  -->
						</div><!-- end #serach-form -->
					</div><!-- end .frame_big search_big -->
				</div><!-- end search -->
				<?php echo $cart; ?>
				
			</div>
			<div class="header-left col-sm-10 col-md-9 col-xs-12">				
				<div id="welcome">
					<?php if(isset($boss_login)){ ?>
					<?php echo $boss_login; ?>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- megamenu position-->
<?php	
	$modules =$helper->getModulesByPosition('mainmenu'); 
	if( $modules ){
		foreach ($modules as $module) { 
			 echo $module; 
		} 
	}
?>
<!-- Slideshow Position-->
<section id="block-header-bottom">
<div class="container">
<?php
	$modules =$helper->getModulesByPosition('header'); 
	if( $modules ){
		foreach ($modules as $module) { 
			echo $module; 
		} 
	} 
?>
</div>
</section>
<!-- Slideshow Position-->
<?php
	$modules =$helper->getModulesByPosition('slideshow'); 
	if( $modules ){
		foreach ($modules as $module) { 
			echo $module; 
		} 
	} 
?>
<section id="boss-announce">
<div class="container">
<?php if ($error) { ?>   
	<div class="warning">
		<?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" />
	</div>
<?php } ?>
<div id="notification"></div>
</div>
</section>
<section id="content-container">
<div class="container">
<div class="row">
<script type="text/javascript"><!--
$(document).ready(function() {
	search_resize();
});
$(window).resize(function() {
	search_resize();
});
function search_resize(){
	var show_search = 0;
	if(getWidthBrowser() < 767){
		$('#search-form').css("display","block");
		$('#search').addClass('m-search');
	}else {
		$('#search').removeClass('m-search');
		$('#search-form').css("display","none");
		if(isMobile||isPhone){
			$('.icon_seach').click(function(){
				$("#search-form").slideToggle();
			});
		}else{
			$('#search').hover(function() {
				$('#search-form', this).slideDown();
				$('#boss_cart .content').hide();
				$('#content_login').hide();
				show_hide = 0;
				
				$('#search > a', this).addClass('active');
				$("#search-form input").focus(function() {
					show_search = 1;
				});
				$('#search').mouseleave(function() {
					if(show_search==0){
					$('#search-form', this).hide();
					}
				});
			},function(){
				$('#search').mouseleave(function() {
					if(show_search==0){
					$('#search-form').hide();
					$('#search > a', this).removeClass('active');
					}
				});
			});
		}
	}
};
//--></script>