<?php

class Users_model extends CI_Model {
	public function __construct(){
			$this->load->database();
	}

	public function userLoginElevage($login, $password){
		$this->db->select('*');
		$this->db->from('elevage');
		$this->db->where('login', $login);
		$this->db->where('password', $password);
		$this->db->join('users', 'elevage.idUsers = users.idUsers');
		$query = $this->db->get();

		
		return $query->result_array();

		//$query=$this->db->get('users',array('login'=>$login, 'password'=>$password));
		

	}

	public function userLoginVeterinaire($login, $password){
		$this->db->select('*');
		$this->db->from('veterinaire');
		$this->db->where('login', $login);
		$this->db->where('password', $password);
		$this->db->join('users', 'veterinaire.idUsers = users.idUsers');
		$query = $this->db->get();

		
		return $query->result_array();

		//$query=$this->db->get('users',array('login'=>$login, 'password'=>$password));
		

	}

	public function set_Elevage($nomDiplome,$niveauDiplome,$codeU){
      
        $data = array( "nomDiplome" => $nomDiplome,
                    "niveauDiplome" => $niveauDiplome,
                    "codeU" => $codeU,
                   );
       
        return $this->db->insert('diplomes',$data);
	}
	
	public function set_Veterinaire($nomDiplome,$niveauDiplome,$codeU){
      
        $data = array( "nomDiplome" => $nomDiplome,
                    "niveauDiplome" => $niveauDiplome,
                    "codeU" => $codeU,
                   );
       
        return $this->db->insert('diplomes',$data);
    }
}
?>