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
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <h1 class="box-heading"><?php echo $heading_title; ?></h1> 
  <div class="boss_article-item boss_article-detail">
            <div class="article-content">
                <?php echo $content;?>
            </div>
			<div class="row">
			<?php if ($tags) { ?>
			  <div class="blog_tags col-md-12 col-xs-24 col-sm-12"><h3><?php echo $text_tags; ?> </h3>
			  <ul>
				<?php for ($i = 0; $i < count($tags); $i++) { ?>
				<?php if ($i < (count($tags) - 1)) { ?>
				<li class="item"><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
				<?php } else { ?>
				<li class="item"><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
				<?php } ?>
				<?php } ?>
			  </ul>
			  </div>
			<?php } ?>
            <div class="boss_article-action col-md-12 col-xs-24 col-sm-12">                    
				<div class="article-share">
					<div class="share"><!-- AddThis Button BEGIN -->
						<div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
						<script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
				   <!-- AddThis Button END --> 
					</div>
				</div>
			</div>			
			</div>			
			<div class="article-footer">
				<div class="date-post">					
					<span class="post-by"> Post by <span><?php echo $author; ?></span></span>
					<span class="comment-count"><span><?php echo $comments; ?></span> comment(s)</span>
				</div>					
			</div>
			<?php if(!empty($articles)){ ?>
            <div class="article-related">
                <h3 class="box-title"><?php echo $article_related; ?></h3>
				<div class="box-content">
                 <ul>
                   <?php foreach ($articles as $article) { ?> 
                       <li><a href="<?php echo $article['href']; ?>"><i class="fa fa-stop"></i><?php echo $article['name']; ?></a>
							<small class="time-stamp"> (
								<?php $date = new DateTime($article['date_modified']);?>
								<?php echo $date->format('l, j M , Y');?> )
							</small>
					   </li>
                   <?php } ?> 
                 </ul>
				</div> 
            </div>
			<?php } ?>
			
			<?php if ($allow_comment!=0) {?>
               <?php if ($comment_status==1||$allow_comment==1) {?>
            <div class="comments">                
				<div id="article-comments"></div> 
                <div class="form-comment-container">
					<span id="new"></span>
                    <h3 class="box-title"><?php echo $text_comment; ?> </h3>     
                    <div id="0_comment_box" class="form-comment">
                    	  <?php if(!$login){?>
                    		  <div class="field" id="username">
                    			  <label class="required" for="name"><?php echo $text_username; ?><em>*</em></label>
                    			  <div class="input-box">
                    				  <input type="text" class="input-text required-entry" value="" title="Name" id="name" name="username">
                    			  </div>
                    		  </div>                    
                    		  <div class="field" class="email_blog">
                    			  <label class="required" for="email"><?php echo $text_email; ?><em>*</em></label>
                    			  <div class="input-box">
                    				  <input type="text" class="input-text required-entry validate-email" value="" title="Email" id="email" name="email_blog">
                    			  </div>
                    		  </div>
                    	  <?php } else{?>
                                <input type="hidden" class="input-text required-entry" value="<?php echo $username; ?>" title="Name" id="name" name="username">
                                <input type="hidden" class="input-text required-entry validate-email" value="<?php echo $email; ?>" title="Email" id="email" name="email_blog">
                          <?php } ?>
                    	  <div class="input-box">
                    		  <label class="required" for="comment"><?php echo $entry_comment; ?><em>*</em></label>
                    		  <textarea rows="2" cols="10" class="required-entry input-text" style="height:110px" title="Comment" id="comment" name="comment_content"></textarea>
                    	  </div>                    	  
                    	  <?php if($capcha){?>
                          <div class="captcha">
                    	   <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br /><br />
                           <input class="input-text" type="text" name="captcha" value="" />
                    	   <label class="required-1 " for="recaptcha"><?php echo $text_required?><em>*</em></label>
                    	  </div>
                          <?php }?>
              	          <div>
                            <div class="left"><a id="button-comment" class="btn btn-primary btn-continue"><?php echo $button_continue; ?></a></div>
                          </div>
                    </div>
            	   </div>                   
             </div>
             <?php } } ?>    
			
			<?php if (!empty($products)) { ?>
			  <div id="product-related">
				<h2 class="box-title"><?php echo $text_product_related; ?> (<?php echo count($products); ?>)</h2>
				<div class="box-content">
				  <div class="list_carousel responsive" >
					<ul id="product_related" class="box-product"><?php foreach ($products as $product) { ?><li>
					  <div class="relt_product">
					  <?php if ($product['thumb']) { ?>
						<div class="image"><a class="cs_img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /><b>&nbsp;</b></a></div>
						<?php } ?>
						 <?php if ($product['rating']) { ?>
						<div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
						<?php } ?>
						<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
						<?php if ($product['price']) { ?>
						<div class="price">
						  <?php if (!$product['special']) { ?>
						  <?php echo $product['price']; ?>
						  <?php } else { ?>
						  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
						  <?php } ?>
						</div>
						<?php } ?></div></li><?php } ?></ul>
						<div class="clearfix"></div>
						<a id="prev_related" class="prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
						<a id="next_related" class="next nav_thumb" href="javascript:void(0)" title="next">Next</a>
					</div>
					</div>
			  </div>
			  <?php } ?>              
        </div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.carouFredSel-6.2.0-packed.js"></script>  
<script type="text/javascript"><!--
$('#article-comments .pagination a').live('click', function() {
	$('#article-comments').fadeOut('slow');
		
	$('#article-comments').load(this.href);
	
	$('#article-comments').fadeIn('slow');
	
	return false;
});	

		

$('#article-comments').load('index.php?route=bossblog/article/comment&blog_article_id=<?php echo $blog_article_id; ?>');

$('#button-comment').bind('click', function() {
	$.ajax({
		url: 'index.php?route=bossblog/article/write&blog_article_id=<?php echo $blog_article_id; ?>&need_approval=<?php echo $need_approval; ?>&approval_status=<?php echo $approval_status; ?>',
		type: 'post',
		dataType: 'json',
		data: 'username=' + encodeURIComponent($('input[name=\'username\']').val()) + '&comment_content=' + encodeURIComponent($('textarea[name=\'comment_content\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email_blog\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-comment').attr('disabled', true);
			$('#new').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-comment').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#new').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#new').after('<div class="success">' + data['success'] + '</div>');
				$('#article-comments').load('index.php?route=bossblog/article/comment&blog_article_id=<?php echo $blog_article_id; ?>');				
				$('input[name=\'username\']').val('');
				$('textarea[name=\'comment_content\']').val('');
				$('input[name=\'email_blog\']').val('');
                $('input[name=\'captcha\']').val('');
			}
		}
	});
});
$(window).load(function(){
$('#product_related').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
        prev: '#prev_related',
        next: '#next_related',
        swipe: {
        onTouch : true
        },
        items: {
            width: 200,
            height: 'auto',
            visible: {
            min: 1,
            max: 4
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
	});
});    
//--></script> 
<?php echo $footer; ?>