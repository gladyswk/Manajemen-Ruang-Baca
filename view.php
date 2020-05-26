<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<?php
foreach($css_files as $file): ?>
	<link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
	<script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>
</head>
<body>

	<div>
		<a href='<?php echo site_url('dashboard/data_mahasiswa')?>'>Data Mahasiswa </a> |
		<a href='<?php echo site_url('dashboard/manajemen_buku')?>'>Manajemen buku </a> |
		<a href='<?php echo site_url('dashboard/peminjaman_buku')?>'>Peminjaman buku </a> |
		<a href='<?php echo site_url('dashboard/pengembalian_buku')?>'>Pengembalian buku </a> |
		<a href='<?php echo site_url('dashboard/informasi_koleksi')?>'>Informasi buku </a> |
	</div>


	<div style='height:20px;'></div>
    <div>
		<?php echo $output; ?>
    </div>


</body>
</html>
