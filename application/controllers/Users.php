<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('users_model');
    }

	public function index()
	{
		$this->login();
    }
    
    public function login()  
    {  
        $this->load->library('session');
        $this->load->helper('form');
        $this->load->helper('url');
        $data['title'] = 'CodeIgniter Simple Login Form With Sessions';  
        $this->load->view("connexion", $data);  
    }

    public function connexion()  
    {  

        
        //Récupérer les données saisies envoyées en POST
        $login = $this->input->post('login');
        $password = $this->input->post('password');

        $select = $this->input->post('select');

        $this->form_validation->set_rules('login', '"Identifiant"', 'trim|required|xss_clean');
        $this->form_validation->set_rules('password', '"Mot de passe"', 'trim|required|xss_clean');

        if($select == "elevage"){

            $result = $this->users_model->userLoginElevage($login,$password);

            if($result == null){
                $this->login();
            }
            else{
                $this->load->helper('url');
                $data['title'] = 'connexion elevage';
                $data['user'] = $result;
                $this->load->view("elevage/header_elevage", $data);   
                $this->load->view("elevage/accueil_elevage", $data);   
            }
        }
        else if($select == "veterinaire"){

            $result = $this->users_model->userLoginVeterinaire($login,$password);

            if($result == null){
                $this->login();
            }
            else{
                $this->load->helper('url');
                $data['title'] = 'connexion veterinaire';
                $data['user'] = $result;
                $this->load->view("veterinaire/header_veterinaire", $data);   
                $this->load->view("veterinaire/accueil_veterinaire", $data);   
            }
        }
        else{
            $this->login();
        }
  
    }

    // creer un user  
    public function creer(){
        /*$data['universites'] = $this->Universites_model->get_universite();
        $this->load->helper('form');
        $this->load->library('form_validation');

        $this->form_validation->set_rules('nomDiplome', 'nomDiplome', 'required');
        $this->form_validation->set_rules('niveaudiplome', 'niveaudiplome', 'required');
        $this->form_validation->set_rules('codeU', 'codeU', 'required');

        if ($this->form_validation->run() === FALSE) {
            $data['titre'] ="Ajout d'un diplome";
            $this->load->view('header',$data);
            $this->load->view('diplomes/creer',$data);
            $this->load->view('footer',$data);
        }
        else {
            $nomDiplome = $this->input->post('nomDiplome');
            $niveaudiplome = $this->input->post('niveaudiplome');
            $codeU = $this->input->post('codeU');

            $this->Diplomes_model->set_diplome($nomDiplome,$niveaudiplome,$codeU);
            //Affichage du resultat
            $data['titre'] ='Diplome ajouté !<br></br>';
            $data['diplomes'] = $this->Diplomes_model->get_diplome();
            $this->load->view('header',$data);
            $this->load->view('diplomes/tous',$data);
            $this->load->view('footer',$data);
        }*/
    }

}
