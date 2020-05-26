<!DOCTYPE html>
<html lang=”en”>
  <head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title>Manajemen Buku</title>
    <style type="text/css">
    body {
        color: black;
        background: peachpuff;
        font-family: 'Varela Round', sans-serif;
        font-size: 13px;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		    padding: 12px 15px;
		    vertical-align: middle;
    }
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: lavender;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}

    </style>
  </head>
  <body>
  <div class="container">
    <form action="<?php echo site_url('dashboard/manajemen_buku')?>">
      <button>Back</button>
    </form>

    <h1>MANAJEMEN BUKU</h1>
    <br>
    <table class="table table-striped">
    <thead>
		<tr>
			<th>JUDUL BUKU</th>
			<th>JENIS BUKU</th>
			<th>JUDUL BUKU</th>
			<th>NAMA PENGARANG</th>
      <th>TAHUN TERBIT</th>
      <th>KETERANGAN</th>
		</tr>
  </thead>
  <?php foreach ($posts as $post): ?>
  <tbody>
		<tr>
      <td><?php echo $post->KODE_BUKU; ?></td>
      <td><?php echo $post->JENIS_BUKU; ?></td>
      <td><?php echo $post->JUDUL_BUKU; ?></td>
      <td><?php echo $post->NAMA_PENGARANG; ?></td>
      <td><?php echo $post->TAHUN_TERBIT; ?></td>
      <td><?php echo $post->KETERANGAN; ?></td>
      </tr>
		</tbody>

    <?php endforeach; ?>
  </body>
</html>
