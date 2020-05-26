<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class dashboard extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		$this->load->helper('url');

		$this->load->library('grocery_CRUD');

	}

	public function _example_output($output = null)
	{
		$this->load->view('view.php',(array)$output);
	}

	public function index()
	{
		$this->_example_output((object)array('output' => '' , 'js_files' => array() , 'css_files' => array()));
	}


	//-----------------------------------  Tempat mulai coding controller  -----------------------------------------------
	public function data_mahasiswa(){
		$crud = new grocery_CRUD();
		$crud->set_theme('flexigrid');
		$crud->set_table('mahasiswa');

		$output = $crud->render();
		$this->_example_output($output);
	}

	public function manajemen_buku(){
		$crud = new grocery_CRUD();
		$crud->set_theme('flexigrid');
		$crud->set_table('buku');

		$output = $crud->render();
		$this->_example_output($output);
	}

	public function peminjaman_buku(){
		$crud = new grocery_CRUD();
		$crud->set_theme('flexigrid');
		$crud->set_table('transaksi_peminjaman');
		$crud->set_relation('KODE_BUKU','buku', 'JUDUL_BUKU');
		$crud->set_relation('NIM','mahasiswa', 'NAMA');
		$output = $crud->render();
		$this->_example_output($output);
	}

	public function pengembalian_buku(){
		$crud = new grocery_CRUD();
		$crud->set_theme('flexigrid');
		$crud->set_table('transaksi_pengembalian');

		$output = $crud->render();
		$this->_example_output($output);
	}

	public function informasi_koleksi(){
		$this->load->model('panggilSPKoleksi');
		$data = $this->panggilSPKoleksi->informasi();
		$result['posts'] = $data->result();
		$this->load->view('view_buku', $result);
	}
  }

	//-------------------------------------------------------------------------------------------------------
