<?php
	header("Pragma: no-cache");
	$fp=fopen($_GET["name"], "r+");
	fscanf($fp, "%d", $count);
	$count++;
	rewind($fp);
	fputs($fp, $count);
	fclose($fp);
	$str = "Visitée";
	$str=iconv("ISO-8859-1","UTF-8",$str);
	print "<font size=2pt><center>$count<br>visites<br>depuis<br>10/08/2013</center></font>";
?>
