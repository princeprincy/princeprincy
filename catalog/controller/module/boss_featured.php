<?php
class ControllerModuleBossFeatured extends Controller {
	protected function index($setting) {
		
		static $module = 0;
		
      	$this->data['heading_title'] = $setting['title'][$this->config->get('config_language_id')];
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');

		$this->data['products'] = array();

		$products = explode(',', $this->config->get('boss_featured_product'));	
		
		$total = count($products);
		
		if (empty($setting['limit'])) {
			$limit = 8;
		}else{
			$limit = $setting['limit'];
		}
		
		if($limit > $total){
			$limit = $total;
		}
		
		$this->data['limit'] = $limit;
		
		if (empty($setting['item'])) {
			$item = 8;
		}else{
			$item = $setting['item'];
		}
		
		$this->data['item'] = $item;
		
		$products = array_slice($products, 0, (int)$item);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}
		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/boss_featured.tpl';
		} else {
			$this->template = 'default/template/module/boss_featured.tpl';
		}

		$this->render();
	}
	
	public function viewMoreProducts(){
		
		$page = $this->request->get['page'];
		
		$module = $this->request->get['module'];
		
		$this->data['module'] = $module;
		
		$boss_featured_module = $this->config->get('boss_featured_module');
		
		$setting = $boss_featured_module[$module];
		
		if (empty($setting['item'])) {
			$item = 4;
		}else{
			$item = $setting['item'];
		}
		
		$oldtitem = $item*($page-1);
		
		$nowitem = $item*$page;
		
		$nextitem = $item*($page+1);
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');
		
		$this->data['products'] = array();

		$products = explode(',', $this->config->get('boss_featured_product'));	
		
		$total = count($products);
		
		if (empty($setting['limit'])) {
			$limit = 4;
		}else{
			$limit = $setting['limit'];
		}
		
		if($limit > $total){
			$limit = $total;
		}
		$this->data['limit'] = $limit;
		
		$products = array_slice($products, (int)$oldtitem, (int)$item);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}
		
		$this->data['page'] = ($page+1);
		
		$this->data['nowitem'] = $nowitem;
		
		$json = array();
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_featured_more.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/boss_featured_more.tpl';
		} else {
			$this->template = 'default/template/module/boss_featured_more.tpl';
		}
		
		$json['html'] = $this->render();
		
		$this->response->setOutput(json_encode($json));
	
	}
}
?>