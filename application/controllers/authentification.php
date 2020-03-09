<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Authentification extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */


	public function index()
	{
        $this->load->helper('form');
		$this->Chargement();
	}


    public function Chargement()  
      {  
           //http://localhost/codeigniter/c_authentification/login  
           $data['title'] = 'Oporctunité web';  
           $this->load->view("v_authentification", $data);  
      }

      	public function affiche_conditions(){
	
		   
        $this->load->view('conditions'); 
      
      
		
	}


      	public function inscription_home(){
	
		   
        $this->load->view('inscription'); 
      
      
		
	}


}


