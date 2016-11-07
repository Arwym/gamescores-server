<?php

// Dependencies and configuration

require 'flight/Flight.php';
require 'config.php';

// Register Database
try {
	Flight::register('db', 'PDO', array('mysql:host='. $db_host .';dbname='. $db_name, $db_user, $db_pass), function($db) {
  		$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	});
	$db = Flight::db();
} catch(PDOException $e) {
	die('Unable to connect to database.');
}

// Route definitions

Flight::route('/', function(){
    echo 'Hello world! Welcome to the Game Scores Server Web Application.';
});

Flight::route('POST /scores', function() use($db) {
	$data = Flight::request()->data;

	if (isset($data->game_id) && isset($data->value) && is_numeric($data->game_id) && is_numeric($data->value)) {
		// Prepare data values to insert
		$game_id = $data->game_id;
		$value = $data->value;
		if (isset($data->player_name) && !empty($data->player_name)) {
			$player_name = $data->player_name;
		} else {
			$player_name = 'ANON';
		}

		// Establish statement
		$statement = $db->prepare('INSERT INTO scores (game_id, player_name, value) VALUES(?, ?, ?)');

		try {
			// Execute statement
			$statement->execute(array(
			    $game_id,
			    $player_name,
			    $value
			));
			// Render result
			Flight::json(array('message' => 'Score posted successfully.'));
		} catch(Exception $e) {
			// Error
			Flight::error($e);
		}
	} else {
		Flight::json(array('message' => 'Bad request. Missing data.'), $code = 400);
	}
});

Flight::route('GET /scores/@game_id:[0-9]+(/@limit:[0-9]+)', function($game_id, $limit) use($db) {
	
	// Establish statement
	$query = 'SELECT * FROM scores WHERE game_id='. $game_id;
	if ($limit > 0) {
		$query .= 'LIMIT '. $limit;
	}

	$statement = $db->prepare($query);

	try {
		// Execute statement
		$statement->execute();
		// Render result
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);
		Flight::json($result);
	} catch(Exception $e) {
		// Error
		Flight::error($e);
	}

});

Flight::route('GET /challenges/@game_id:[0-9](/@level:[0-9]+)', function($game_id, $level) use($db) {
	// Establish statement
	$query = 'SELECT * FROM challenges WHERE game_id='. $game_id;
	if ($level) {
		$query .= ' AND level='. $level;
	}
	$query .= ' ORDER BY level ASC';

	$statement = $db->prepare($query);

	try {
		// Execute statement
		$statement->execute();
		// Render result
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);
		Flight::json($result);
	} catch(Exception $e) {
		// Error
		Flight::error($e);
	}
});

// Initiate Flight Framework
Flight::start();

?>