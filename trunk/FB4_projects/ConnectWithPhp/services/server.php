<?php
if(!empty($_REQUEST["uname"])){
	if(!empty($_REQUEST["passwd"])){
		echo "Hello,your name is ".$_REQUEST["uname"].",and your passwd is ".$_REQUEST["passwd"];
	}else{
		echo "No passwd value";
	}
}else{
	echo "No uname value";
}

?>