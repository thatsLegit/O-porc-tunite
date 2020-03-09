<?php 
class veto extends CI_Controller{
	  public function __construct(){
        parent::__construct();
        $this->load->model('m_authentification');
        $this->load->model('elevage_modele');
        $this->load->helper('url_helper');
    }

 

    public function affiche_inscrip_veto(){
    $data['veterinaire']= $this->elevage_modele->set_veterinaire();
           
      
        $this->load->view('Inscription_Veto',$data); 
      
         
    }




}