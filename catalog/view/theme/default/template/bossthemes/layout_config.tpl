<?php
$column_left  = trim($column_left);
$column_right  = trim($column_right);
 
if( !empty($column_left) && !empty($column_right) ){
		$layout = 'full';
	} elseif( empty($column_left) && !empty($column_right) ){
		$layout = 'center-right';
	}elseif( !empty($column_left) && empty($column_right) ){
		$layout = 'center-left';
	}else {
		$layout = 'center';
	}
	
	$spans = array( 'full' 			=> array(6,12,6),
					'center-right'  => array(0,18,6), 
					'center-left'   => array(6,18,0),
					'center'		=> array(0,24,0)
	);
	$span = $spans[$layout];
?>