<?php
include("../config.php");

if(isset($_GET ["Tambah"])){
							$nama_pemasok_barang = $_GET["nama_pemasok_barang"];
							$alamat_pemasok_barang = $_GET["alamat_pemasok_barang"];
							$no_kontak_pemasok_barang = $_GET["no_kontak_pemasok_barang"];
							
							$hasil = mysqli_query(
							$koneksi,
							"INSERT INTO pemasok_barang
							(nama_pemasok_barang, alamat_pemasok_barang, no_kontak_pemasok_barang)
							
							VALUE
							('$nama_pemasok_barang', '$alamat_pemasok_barang', '$no_kontak_pemasok_barang')"
							);
							
							if($hasil){
							?> 
								<script>
								window.location.href = "../pemasok-barang.php"
								</script>
							<?php
							}else{
								echo " ada yang salah " . $koneksi->error;
							}
						}
?>

<html>
<head>
</head>

<body>
	<div style="margin: auto; width:600px; height:auto; border:solid brown 5px; border-radius:10px; padding:5px;">
		<h1> Data Master - pemasok barang </h1>
		<form method="get" action="">
		Nama
		<br>
		<input type="text" name="nama_pemasok_barang" required>
		<br><br>
		Alamat
		<br>
		<input type="text" name="alamat_pemasok_barang" required>
		<br><br>
		No Kontak
		<br>
		<input type="text" name="no_kontak_pemasok_barang" required>
		<br><br>
		
		<input type="submit" value="Tambah" name="Tambah">
		</form>
	</div>
</body>
</html>