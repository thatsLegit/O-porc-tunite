 <?php  
 class  fiches_modele extends CI_Model  
 {  
  public function __construct(){
      $this->load->database();
  }
      
  public function get_fiches(){
    $sql ='select * from fiche';
    $query=$this->db->query($sql);
    return $query->result_array();
    
    //$sql ='select * from employes';
    //$query=$this->db->query($sql);
    //return $query->result();
  }
 }  