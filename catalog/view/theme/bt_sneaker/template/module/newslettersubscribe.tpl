<div class="newletter col-xs-24 col-sm-12 col-md-12 pull-left not-animated" data-animate="fadeInUp" data-delay="600">
	<h3><?php echo $heading_title; ?></h3>
	<div class="newletter-content">
		<div id="frm_subscribe">
			<form name="subscribe" id="subscribe"   >
				<table>
				   <tr>
					 <td><input size="50" class="input-new" type="text" autocomplete="off"  onblur="if(this.value=='') this.value=this.defaultValue" onfocus="if(this.value==this.defaultValue) this.value=''" value="<?php echo $text_email; ?>" name="subscribe_email" id="subscribe_email"> <a class="btn btn-primary btn-continue" onclick="email_subscribe()"><?php echo $entry_button; ?></a></td>
					</tr>
					<tr style="display:none;">
					 <td><input size="50" class="input-new" type="text" value="<?php echo $text_email; ?>" name="subscribe_name" id="subscribe_name"></td>
					</tr>
					<tr>		
					 <td id="subscribe_result"></td>
				   </tr>
				   <?php for($ns=1;$ns<=$option_fields;$ns++) {
					$ns_var= "option_fields".$ns; ?>
					<tr>
						<td><?php if($$ns_var!=""){
						 echo($$ns_var."&nbsp;<br/>");
						 echo('<input type="text" value="" name="option'.$ns.'" id="option'.$ns.'">');
						} ?></td>
				   </tr>
					<?php } ?>
					<?php if($option_unsubscribe) { ?>
					<tr>
						<td>
							<a class="btn btn-primary btn-continue" onclick="email_unsubscribe()"><span><?php echo $entry_unbutton; ?></span></a>
						</td>
					</tr>
					<?php } ?>  
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript"><!--
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}
	}); 
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}
	}); 
}
//--></script>
</div>
