<?php
class ControllerModuleBossFilterProduct extends Controller {
	protected function index($setting) {
		if(!in_array($this->config->get('config_store_id'),$setting['store_id']))
			return;
		static $module = 0;
		
		$this->document->addScript('catalog/view/javascript/bossthemes/jquery.carouFredSel-6.2.0-packed.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/boss_filterproduct/boss_filterproduct.js');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/boss_filterproduct.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/boss_filterproduct.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/boss_filterproduct.css');
		}
		
		//get config
		$this->data['use_scrolling_panel'] = $setting['use_scrolling_panel'];
		$this->data['use_tab'] = $setting['use_tab'];
		$this->data['prod_item'] = $setting['scroll'];
		$this->data['width_column'] = $setting['width_column'];
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		$this->data['template'] = $this->config->get('config_template');
		
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		//load tab for module
		if(isset($setting['tabs']))
		{
			foreach ($setting['tabs'] as $tab) {
				$results = array();
				if ($tab['type_product'] == "popular") {
					$results = $this->model_catalog_product->getPopularProducts($setting['limit']);
				}
				if ($tab['type_product'] == "special") {
					$data = array(
						'sort'  => 'pd.name',
						'order' => 'ASC',
						'start' => 0,
						'limit' => $setting['limit']
					);
					$results = $this->model_catalog_product->getProductSpecials($data);
				}
				if ($tab['type_product'] == "best_seller") {
					$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
				}
				if ($tab['type_product'] == "latest") {
					$results = $this->model_catalog_product->getLatestProducts($setting['limit']);
				}
				if ($tab['type_product'] == "category") {
					$data = array(
						'filter_category_id' => $tab['filter_type_category'],
						'sort'  => 'pd.name',
						'order' => 'ASC',
						'start' => 0,
						'limit' => $setting['limit']
					);
					$results = $this->model_catalog_product->getProducts($data);
				}
				$products = array();
				foreach ($results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
					} else {
						$image = false;
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}
							
					if ((float)$result['special']) { 
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}
					
					if ($this->config->get('config_review_status')) {
						$rating = $result['rating'];
					} else {
						$rating = false;
					}
					
					$products[] = array(
						'product_id' => $result['product_id'],
						'thumb'   	 => $image,
						'name'    	 => $result['name'],
						'price'   	 => $price,
						'special' 	 => $special,
						'rating'     => $rating,
						'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
						'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					);
				}
				$this->data['tabs'][] = array(
						'title'	 		 =>	$tab['title'][$this->config->get('config_language_id')],
						'products'       => $products
					);
				
			}
		} //end load tabs for module
		
		
		
		$this->data['module'] = $module++;
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_filterproduct.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/boss_filterproduct.tpl';
		} else {
			$this->template = 'default/template/module/boss_filterproduct.tpl';
		}

		$this->render();
	}
}
?>