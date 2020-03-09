<?php 
class fiches extends CI_Controller{
	  public function __construct(){
        parent::__construct();
        $this->load->model('fiches_modele');
        $this->load->model('elevage_modele');
        $this->load->helper('url_helper');
    }

    
	public function afficher_pagefiche(){
	$data['fiche']= $this->fiches_modele->get_fiches();
		   
        $this->load->view('header_elevage',$data);
        $this->load->view('fiches_conseils',$data); 
      
      
		
	}
}