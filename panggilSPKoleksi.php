<?php

class panggilSPKoleksi extends CI_Model {

  public function informasi(){
    $data = $this->db->query("CALL informasi_koleksi()");
    return $data;
  }
}
