<?php

require 'flight/Flight.php';

// Route definitions

Flight::route('/', function(){
    echo 'Hello world! Welcome to the Game Scores Server Web Application.';
});

// Initiate Flight Framework

Flight::start();

?>