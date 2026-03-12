<?php
include("config.php");

$hasil = mysqli_query($koneksi, " SELECT * 
						FROM pemasok_barang
						ORDER BY nama_pemasok_barang
					");
?>

<html>
<head>
</head>

<body>
	<div style="margin: auto; width:600px; height:auto; border:solid brown 5px; border-radius:10px; padding:5px;">
	<h1> Data Master - pemasok barang </h1>
	<a href="pemasok-barang/tambah.php">Tambah data</a>
	<br><br>
	<table border="1px" style="width:100%">
		<tr>
			<th>Nama </th>
			<th>Alamat </th>
			<th>No Kontak</th>
			<th> Ubah Hapus </th>
		</tr>
		
		<?php
		while($data = mysqli_fetch_assoc($hasil)){
		?>
		
		<tr>
			<td> <?php echo $data["nama_pemasok_barang"]?></td>
			<td> <?php echo $data["alamat_pemasok_barang"]?></td>
			<td> <?php echo $data["no_kontak_pemasok_barang"]?></td>
			<td>
				<a style="color:orange" href="pemasok-barang/ubah.php">Ubah</a> 
				<a style="color:red" href="pemasok-barang/hapus.php"> Hapus</a>
			</td>
		</tr>
		<?php 
		} 
		?>
	</table>
	</div>
</body>
</html>