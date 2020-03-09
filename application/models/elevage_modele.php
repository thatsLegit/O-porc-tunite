 <?php  
 class  elevage_modele extends CI_Model  
 {  
  public function __construct(){
      $this->load->database();
  }
      
  public function get_elevage(){
    $sql ='select * from elevage';
    $query=$this->db->query($sql);
    return $query->result_array();
    
    //$sql ='select * from employes';
    //$query=$this->db->query($sql);
    //return $query->result();
  }
 }  