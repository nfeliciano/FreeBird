<?php
$con = mysql_connect("localhost","instinct_noel","cuttingRoom");
if (!con)
	{
	die('Could not connect: ' . mysql_erro());
	}
	
mysql_select_db("instinct_freebird", $con);

if(@$_GET['numberOfMoves']) {
	//echo "You said \"{$_GET['numberOfMoves']}\"";
	$numberOfMoves = $_GET['numberOfMoves'];
	$userID = $_GET['user'];
	
	$sql="INSERT INTO numberOfMoves (movesMade)
	VALUES
	('$numberOfMoves')";
	
	if(!mysql_query($sql,$con)) {
		die('Error: ' . mysql_error());
	}
}

mysql_close($con);
?>