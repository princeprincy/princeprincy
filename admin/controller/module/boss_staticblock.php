<?php
class ControllerModuleBossStaticblock extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/boss_staticblock');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('boss_staticblock', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('module/boss_staticblock', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');
        $this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_header'] = $this->language->get('text_header');
		$this->data['text_footer'] = $this->language->get('text_footer');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_all'] = $this->language->get('text_all');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_add_new_block'] = $this->language->get('button_add_new_block');
		
		$this->data['entry_content'] = $this->language->get('entry_content');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		//tab
		$this->data['tab_content'] = $this->language->get('tab_content');
		$this->data['tab_header'] = $this->language->get('tab_header');
		$this->data['tab_footer'] = $this->language->get('tab_footer');
		$this->data['tab_header_top'] = $this->language->get('tab_header_top');
		$this->data['tab_header_bottom'] = $this->language->get('tab_header_bottom');
		$this->data['tab_footer_1'] = $this->language->get('tab_footer_1');
		$this->data['tab_footer_2'] = $this->language->get('tab_footer_2');
		$this->data['tab_footer_3'] = $this->language->get('tab_footer_3');
		
		$this->data['tab_block'] = $this->language->get('tab_block');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/boss_staticblock', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/boss_staticblock', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->data['b_Block_Header_Top'] = array();
		
		if (isset($this->request->post['b_Block_Header_Top'])) {
            $b_Block_Header_Top = $this->request->post['b_Block_Header_Top'];
		} elseif ($this->config->get('b_Block_Header_Top')) { 
            $b_Block_Header_Top = $this->config->get('b_Block_Header_Top');
		} else{
			$b_Block_Header_Top = '';
		}
		
		$this->data['b_Block_Header_Top'] = $b_Block_Header_Top;
		
		$this->data['b_Block_Header_Bottom'] = array();
		
		if (isset($this->request->post['b_Block_Header_Bottom'])) {
            $b_Block_Header_Bottom = $this->request->post['b_Block_Header_Bottom'];
		} elseif ($this->config->get('b_Block_Header_Bottom')) { 
            $b_Block_Header_Bottom = $this->config->get('b_Block_Header_Bottom');
		}else{
			$b_Block_Header_Bottom = '';
		}
		
		$this->data['b_Block_Header_Bottom'] = $b_Block_Header_Bottom;
		
		$this->data['b_Block_Footer_1'] = array();
		
		if (isset($this->request->post['b_Block_Footer_1'])) {
            $b_Block_Footer_1 = $this->request->post['b_Block_Footer_1'];
		} elseif ($this->config->get('b_Block_Footer_1')) { 
            $b_Block_Footer_1 = $this->config->get('b_Block_Footer_1');
		} else{
			$b_Block_Footer_1 = '';
		}
		
		$this->data['b_Block_Footer_1'] = $b_Block_Footer_1;
		
		$this->data['b_Block_Footer_2'] = array();
		
		if (isset($this->request->post['b_Block_Footer_2'])) {
            $b_Block_Footer_2 = $this->request->post['b_Block_Footer_2'];
		} elseif ($this->config->get('b_Block_Footer_2')) { 
            $b_Block_Footer_2 = $this->config->get('b_Block_Footer_2');
		}else{
			$b_Block_Footer_2 = '';
		}
		
		$this->data['b_Block_Footer_2'] = $b_Block_Footer_2;
		
		$this->data['b_Block_Footer_3'] = array();
		
		if (isset($this->request->post['b_Block_Footer_3'])) {
            $b_Block_Footer_3 = $this->request->post['b_Block_Footer_3'];
		} elseif ($this->config->get('b_Block_Footer_3')) { 
            $b_Block_Footer_3 = $this->config->get('b_Block_Footer_3');
		}else{
			$b_Block_Footer_3 = '';
		}
		
		$this->data['b_Block_Footer_3'] = $b_Block_Footer_3;
		
		$this->data['b_Footer_Face'] = array();
		
		if (isset($this->request->post['b_Footer_Face'])) {
            $b_Footer_Face = $this->request->post['b_Footer_Face'];
		} elseif ($this->config->get('b_Footer_Face')) { 
            $b_Footer_Face = $this->config->get('b_Footer_Face');
		}else{
			$b_Footer_Face = '';
		}
		
		$this->data['b_Footer_Face'] = $b_Footer_Face;

		$this->data['modules'] = array();
		
		if (isset($this->request->post['boss_staticblock_module'])) {
			$this->data['modules'] = $this->request->post['boss_staticblock_module'];
		} elseif ($this->config->get('boss_staticblock_module')) { 
			$this->data['modules'] = $this->config->get('boss_staticblock_module');
		}	
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
						
		$this->template = 'module/boss_staticblock.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_staticblock')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	private function getIdLayout($layout_name) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "layout WHERE LOWER(name) = LOWER('".$layout_name."')");
		return (int)$query->row['layout_id'];
	}

	public function install() 
	{
		$this->load->model('setting/setting');
		
		$this->load->model('localisation/language');
			
		$languages = $this->model_localisation_language->getLanguages();
		
		$array_description1 = array();
		$array_description2 = array();
		$array_description3 = array();
		$b_Block_Footer_1 = array();
		$b_Block_Footer_2 = array();
		$b_Block_Footer_3 = array();
						
		foreach($languages as $language){
			$array_description1{$language['language_id']} = '&lt;div class=&quot;block-header&quot;&gt;
&lt;p&gt;&lt;span class=&quot;big-red&quot;&gt;&quot;IT\'S CRAZY SHOPPING TIME&quot;&lt;/span&gt; &lt;span class=&quot;small&quot;&gt;with over&lt;/span&gt; 1000 GIFTS &lt;span class=&quot;small&quot;&gt;and&lt;/span&gt; FREE SHIPPING&lt;/p&gt;
&lt;/div&gt;';
			$array_description2{$language['language_id']} = '&lt;div class=&quot;block-homepage&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;block-1&quot;&gt;
&lt;div class=&quot;img-logo&quot;&gt;&lt;img alt=&quot;image-block&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/title_block_03.png&quot; /&gt;&lt;/div&gt;

&lt;div class=&quot;image&quot;&gt;&lt;img alt=&quot;image-block&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/product_block_03.jpg&quot; /&gt;&lt;/div&gt;

&lt;div class=&quot;bt-more&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;path=20&quot; title=&quot;View Collection&quot;&gt;View Collection&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;block-1&quot;&gt;
&lt;div class=&quot;img-logo&quot;&gt;&lt;img alt=&quot;image-block&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/title_block_05.png&quot; /&gt;&lt;/div&gt;

&lt;div class=&quot;image&quot;&gt;&lt;img alt=&quot;image-block&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/product_block_05.jpg&quot; /&gt;&lt;/div&gt;

&lt;div class=&quot;bt-more&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;path=18&quot; title=&quot;View Collection&quot;&gt;View Collection&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;block-1&quot;&gt;
&lt;div class=&quot;img-logo&quot;&gt;&lt;img alt=&quot;image-block&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/title_block_07.png&quot; /&gt;&lt;/div&gt;

&lt;div class=&quot;image&quot;&gt;&lt;img alt=&quot;image-block&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/product_block_07.jpg&quot; /&gt;&lt;/div&gt;

&lt;div class=&quot;bt-more&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;path=25&quot; title=&quot;View Collection&quot;&gt;View Collection&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
';
			$array_description3{$language['language_id']} = '&lt;div class=&quot;static-banner-category fadeInUp animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;200&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;banner&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/banner_category.jpg&quot; title=&quot;banner&quot; /&gt;&lt;/a&gt;&lt;/div&gt;';
			$b_Block_Footer_1{$language['language_id']} = '&lt;div class=&quot;payment&quot;&gt;&lt;a class=&quot;btooltip&quot; data-original-title=&quot;PayPal&quot; data-placement=&quot;bottom&quot; data-toggle=&quot;tooltip&quot; href=&quot;#&quot;&gt;&lt;img alt=&quot;Payment&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/payment1.png&quot; /&gt;&lt;/a&gt; &lt;a class=&quot;btooltip&quot; data-original-title=&quot;Visa&quot; data-placement=&quot;bottom&quot; data-toggle=&quot;tooltip&quot; href=&quot;#&quot;&gt;&lt;img alt=&quot;Payment&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/payment2.png&quot; /&gt;&lt;/a&gt; &lt;a class=&quot;btooltip&quot; data-original-title=&quot;Master Card&quot; data-placement=&quot;bottom&quot; data-toggle=&quot;tooltip&quot; href=&quot;#&quot;&gt;&lt;img alt=&quot;Payment&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/payment3.png&quot; /&gt;&lt;/a&gt; &lt;a class=&quot;btooltip&quot; data-original-title=&quot;Verified by Visa&quot; data-placement=&quot;bottom&quot; data-toggle=&quot;tooltip&quot; href=&quot;#&quot;&gt;&lt;img alt=&quot;Payment&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/payment4.png&quot; /&gt;&lt;/a&gt; &lt;a class=&quot;btooltip&quot; data-original-title=&quot;VeriSign&quot; data-placement=&quot;bottom&quot; data-toggle=&quot;tooltip&quot; href=&quot;#&quot;&gt;&lt;img alt=&quot;Payment&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/payment5.png&quot; /&gt;&lt;/a&gt;&lt;/div&gt;';
			$b_Block_Footer_2{$language['language_id']} = '&lt;div&gt;
&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Penatibus / Cum Sociis&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Natoque Penatibus&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Magnis&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Vulputate Nulla&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Parturient Montes&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Natoque Penatibus&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;';
			$b_Block_Footer_3{$language['language_id']} = '&lt;div class=&quot;col-xs-24 col-sm-12 col-md-6 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;1200&quot; id=&quot;footer-block-friends&quot;&gt;
&lt;h3&gt;Connect with us&lt;/h3&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;Facebook&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/social_1.png&quot; title=&quot;Facebook&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;Tiwter&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/social_2.png&quot; title=&quot;Tiwter&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;Pinterest&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/social_3.png&quot; title=&quot;Pinterest&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;Blogger&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/social_4.png&quot; title=&quot;Blogger&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;RSS&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/social_5.png&quot; title=&quot;RSS&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;Messages&quot; src=&quot;http://demo.bossthemes.com/sneaker/image/data/bt_sneaker/social_6.png&quot; title=&quot;Messages&quot; /&gt;&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;div class=&quot;live-link&quot;&gt;&lt;a class=&quot;live-tv&quot; href=&quot;#&quot; title=&quot;Live tv&quot;&gt;Live tv&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;mobile-link&quot;&gt;&lt;a class=&quot;mobile-tv&quot; href=&quot;#&quot; title=&quot;Mobile tv&quot;&gt;Mobile tv&lt;/a&gt; | &lt;a class=&quot;mobile-app&quot; href=&quot;#&quot; title=&quot;Mobile App&quot;&gt;Mobile App&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;';
        }
		
		$data = array(
			'boss_staticblock_module' 	=> array(
			1 => array('description' => $array_description1, 'layout_id' => $this->getIdLayout("home"), 'store_id' => array(0=>0), 'position' => 'header', 'status' => 1, 'sort_order' => 1),
			2 => array('description' => $array_description2, 'layout_id' => $this->getIdLayout("home"), 'store_id' => array(0=>0), 'position' => 'content_top', 'status' => 1, 'sort_order' => 2),
			3 => array('description' => $array_description3, 'layout_id' => $this->getIdLayout("category"), 'store_id' => array(0=>0), 'position' => 'content_top', 'status' => 1, 'sort_order' => 1)
			),
			'b_Block_Footer_1'			=> array('content' => $b_Block_Footer_1, 'status' => 1, 'store_id' => array(0=>0)),
			'b_Block_Footer_2'			=> array('content' => $b_Block_Footer_2, 'status' => 1, 'store_id' => array(0=>0)),
			'b_Block_Footer_3'			=> array('content' => $b_Block_Footer_3, 'status' => 1, 'store_id' => array(0=>0))
		);

		$this->model_setting_setting->editSetting('boss_staticblock', $data);		
	}
}
?>