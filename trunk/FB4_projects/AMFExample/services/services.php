<?php

require_once 'Zend/Amf/Server.php';

$server = new Zend_Amf_Server();
$server->addFunction('sayHello');
$server->setClass("World");
echo $server->handle();


function sayHello($name,$age){
	return 'Hello '.$name.",your age is ".$age;
}



class World{
	public function hello(){
		return 'Hello World';
	}
}

?>