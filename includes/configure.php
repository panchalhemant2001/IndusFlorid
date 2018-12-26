<?php
/* Setting the error reporting. */
	error_reporting(1);
	
/* Setting up the time out limit to 15 minutes (900 seconds) */
	set_time_limit(900);
	
/* Defining variable HTTPSERVER holding the project path */
	define(HTTPSERVER, 'http://www.indusflorid.com:8082/');

/* Defining varaible SITENAME holding the site name. */
	define(SITENAME, 'www.indusflorid.com:8082');
	
/* variable DIRDOCUMENTFSROOT holding the file system path. */
	define('DIRDOCUMENTFSROOT', $_SERVER['DOCUMENT_ROOT'] . '/');


/* variable DIRSERVERNAME holding the server name. */
	define('DIRSERVERNAME', 'http://' . $_SERVER['SERVER_NAME'] . '/');

/* Defining variables holding the paths to images, css and javascripts. */
	define('DIRIMAGES', '../images/');
	define('DIRCSS', DIRSERVERNAME . 'includes/css/');
	define('DIRJS', DIRSERVERNAME . 'includes/js/');


/* Defining the paramters for the database connection. */
/* DBSERVER holding the database username. */
	define('DBSERVER', 'localhost:3306');
/* DBSERVERUSERNAME holding the database server username. */
	define('DBSERVERUSERNAME', 'root');
/* DBSERVERPASSWORD holding the database server password. */
	define('DBSERVERPASSWORD', 'root');
/* DBDATABASE holding the database name. */
	define('DBDATABASE', 'indusflorid');

/* USEPCONNECT holding the flag for connection type, TRUE indicates connection type is persistent. */
	define('USEPCONNECT', 'false'); 

/* Holding the username and password for SMTP mail dispatch. */
	define('MAILFROM', 'Admin Indusflorid');	
	define('MAILUSERNAME', 'admin@indusflorid.com');	
	define('MAILPASSWORD', 'IndusFlorid#123');	


/* Function attempting to establish a connection to a MYSQL database engine. */
	function dbConnect($strServer = DBSERVER, $strUsername = DBSERVERUSERNAME, $strPassword = DBSERVERPASSWORD, $strDatabase = DBDATABASE, $gstrLink = 'dbLink') {
		global $$gstrLink;
	/* Checking whether the persistant connecton is true or false. */
		if (USEPCONNECT == 'true') {
			$$gstrLink = mysqli_pconnect($strServer, $strUsername, $strPassword);
		}
		else {
			$$gstrLink = mysqli_connect($strServer, $strUsername, $strPassword);
		}

		if ($$gstrLink) {
			mysqli_select_db($$gstrLink, $strDatabase);
			return $$gstrLink;
		}
	}

/* Invoking the session start. */
	session_start();

/* Invoking the database connection. */
	dbConnect();
?>