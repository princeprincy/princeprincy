<div id="boss-login">
<?php if (!$logged) { ?>
	<ul>
	<li class="login-li">
		<span><?php echo $text_login; ?></span>
		<div id="content-login" class="content" style="display:none"> <b>&nbsp;</b>
			<form action="<?php echo $action_login; ?>" method="post" enctype="multipart/form-data" id="logintop" >
				<div class="login-bor">
				<div class="login-frame">
					<span><?php echo $text_username; ?><span class="required"> *</span></span>
					<input type="text" name="email" autocomplete="off"  onblur="if(this.value=='') this.value=this.defaultValue" onfocus="if(this.value==this.defaultValue) this.value=''" value="<?php echo $text_username; ?>" />
					<span><?php echo $entry_password; ?><span class="required"> *</span></span>
					<input type="password" name="password" onblur="if(this.value=='') this.value=this.defaultValue" onfocus="if(this.value==this.defaultValue) this.value=''" value="<?php echo $entry_password; ?>" />
					<span class="required-field"> * <?php echo $text_required; ?></span><a class="forgotpass" href="<?php echo $forgotten; ?>"><?php  echo $text_forgotten; ?></a><br />
					<div class="action">
					<a onclick="$('#logintop').submit();" class="btn btn-primary btn-continue"><span><?php echo $button_login; ?></span></a>
					<span class="signup_text"><?php  echo $text_welcome_2; ?></span>					
					</div>
				</div>
				</div>
			</form>
		</div>
	</li>
	<li><span><?php echo $text_welcome_2; ?></span></li>
	</ul>
	
<?php } else { ?>
	<?php echo $text_logged; ?>

<?php } ?>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
	if(isMobile||isPhone){
	$('.show_hide_login').click(function(){
		$("#content-login").slideToggle();
	});
	}else{
		$('.login-li').hover(function() {
			$('#content-login', this).slideDown();
			$('#boss-login li.login-li a', this).addClass('active');
			$('#boss-login').mouseleave(function() {
				$('#content-login', this).hide();
			});
		},function(){
			$('#boss-login').mouseleave(function() {
				$('#content-login').hide();
				$('#boss-login li.login-li a', this).removeClass('active');
			});
		});
	}
});
//--></script>