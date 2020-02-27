<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class c_authentification extends CI_Controller {

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
public function __construct(){
	parent::__construct();
	$this->load->library('form_validation');
	$this->load->model('m_authentification');
}

	public function index()
	{
		$this->login();
	}





    function login()  
      {  
           //http://localhost/codeigniter/c_authentification/login  
           $data['title'] = 'CodeIgniter Simple Login Form With Sessions';  
           $this->load->view("v_authentification", $data);  
      }







       function login_validation()  
      {  
           $this->load->library('form_validation');  
           $this->form_validation->set_rules('login', 'Login', 'required');  
           $this->form_validation->set_rules('password', 'Password', 'required');  
           if($this->form_validation->run())  
           {  
                //true  
           	//pour les messages d'erreurs
                $login = $this->input->post('login');  
                $password = $this->input->post('password');  
                //execute la fonction dans le modele authentification pour se connecter  
                $this->load->model('m_authentification');  
                if($this->m_authentification->can_login($login, $password))  
                {  
                     $session_data = array(  
                          'login'     =>     $login  
                     );  
                     $this->session->set_userdata($session_data);  
                     redirect(base_url() . 'c_authentification/enter');  
                }  
                else  
                {  
                     $this->session->set_flashdata('error', 'Invalid Username and Password');  
                     redirect(base_url() . 'c_authentification/login');  
                }  
           }  
           else  
           {  
                //false  
                $this->login();  
           }  
      } 





      function enter(){  
           if($this->session->userdata('login')!= '')  
           {  
                echo '<h2>Welcome - '.$this->session->userdata('login').'</h2>';  
                echo '<label><a href="'.base_url().'c_authentification/logout">Se deconnecter</a></label>';  
           }  
           else  
           {  
                redirect(base_url().'c_authentification/login');  
           }  
      }  



      function logout()  
      {  
           $this->session->unset_userdata('login');  
           redirect(base_url().'c_authentification/login');  
      }  
 }     

