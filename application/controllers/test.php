	<?php 
class test extends CI_Controller{
	  public function __construct(){
        parent::__construct();
        $this->load->model('test_modele');
        $this->load->model('elevage_modele');
        $this->load->helper('url_helper');
    }

	public function affiche_GraphiqueBilan(){
	$data['test']= $this->test_modele->get_test();
		   
        $this->load->view('header_elevage',$data);
        $this->load->view('graphique',$data); 
      
      
		
	}


	public function affiche_HistoriqueTest(){
	$data['test']= $this->test_modele->get_test();
		   
        $this->load->view('header_elevage',$data);
        $this->load->view('historiqueTest',$data); 
      
      
		
	}
}