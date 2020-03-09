<?php 
class elevage extends CI_Controller{
	  public function __construct(){
        parent::__construct();
        $this->load->model('m_authentification');
        $this->load->model('elevage_modele');
        $this->load->helper('url_helper');
    }

    
	public function affiche_home_elevage(){
	$data['elevage']= $this->elevage_modele->get_elevage();
		   
        $this->load->view('header_elevage',$data);
        $this->load->view('accueil_elevage',$data); 
      
      
		
	}

    public function affiche_suivi_elevage(){
    $data['elevage']= $this->elevage_modele->get_elevage();
           
        $this->load->view('header_elevage',$data);
        $this->load->view('suivi_elevage',$data); 
      
      
        
    }

  public function affiche_inscrip_elevage(){
    $data['veterinaire']= $this->elevage_modele->set_veterinaire();
           
      
        $this->load->view('Inscription_Elevage',$data); 
      
         
    }




}