<?php

use App\Constants\Services as AppServices;

// Setup up environment variable
$application_env = getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'development';

/** @var \PhalconRest\Http\Response $response */
$response = null;

try {

    // Read the configuration based on env
    $config = require __DIR__ . "/../app/bootstrap/config.php";

    // Include loader
    require __DIR__ . "/../app/bootstrap/loader.php";

    // Setup all required services (DI)
    $di = require __DIR__ . "/../app/bootstrap/services.php";


    // Instantiate main application
    $app = new \Phalcon\Mvc\Micro($di);

    // Attach the EventsManager to the main application in order to attach Middleware
    $eventsManager = $app->di->get(AppServices::EVENTS_MANAGER);
    $app->setEventsManager($eventsManager);


    // Attach Middleware to EventsManager
    require __DIR__ . "/../app/bootstrap/middleware.php";


    // Mount Collections
    require __DIR__ . "/../app/bootstrap/collections.php";


    // Other routes
    $app->get('/', function() use ($app) {

        /** @var Phalcon\Mvc\View\Simple $view */
        $view = $app->di->get(AppServices::VIEW);

        return $view->render('general/index');
    });

    $app->get('/proxy.html', function() use ($app, $config) {

        /** @var Phalcon\Mvc\View\Simple $view */
        $view = $app->di->get(AppServices::VIEW);

        $view->setVar('client', $config->clientHostName);
        return $view->render('general/proxy');
    });

    //Retrieves all robots
    $app->get('/api/users', function() use ($app) {

        $phql = "SELECT * FROM Personne";
        $users = $app->modelsManager->executeQuery($phql);


       $data = array();

        foreach ($users as $user) {
            $data[] = $user;
        }

        echo json_encode($data);
    });

//Searches for robots with $name in their name
    $app->get('/api/users/search/{name}', function($name) use ($app) {

        $phql = "SELECT * FROM Personne WHERE nom LIKE :nom:";
        $users = $app->modelsManager->executeQuery($phql, array(
            'nom' => '%' . $name . '%'
        ));

        $data = array();
        foreach ($users as $user) {
            $data[] = $user;
        }

        echo json_encode($data);
    });

//Retrieves robots based on primary key
    $app->get('/api/users/{id:[0-9]+}', function($id) use ($app){

        $phql = "SELECT * FROM Personne WHERE id = :id:";
        $users = $app->modelsManager->executeQuery($phql, array(
            'id' =>  $id
        ));

        $data = array();
        foreach ($users as $user) {
            $data[] = $user;
        }

        echo json_encode($data);

    });

//Adds a new robot
    $app->post('/api/users', function() use ($app){

        $personne = $app->request->getJsonRawBody();

        $phql = "INSERT INTO Personne (nom, prenom, mail) VALUES (:nom:, :prenom:, :mail:)";

        $status = $app->modelsManager->executeQuery($phql, array(
            'nom' => $personne->$nom,
            'prenom' => $personne->$prenom,
            'mail' => $personne->$mail
        ));

        //Create a response
        $response = new Phalcon\Http\Response();

        //Check if the insertion was successful
        if ($status->success() == true) {

            //Change the HTTP status
            $response->setStatusCode(201, "Created");

            $personne->id = $status->getModel()->id;

            $response->setJsonContent(array('status' => 'OK', 'data' => $personne));

        } else {

            //Change the HTTP status
            $response->setStatusCode(409, "Conflict");

            //Send errors to the client
            $errors = array();
            foreach ($status->getMessages() as $message) {
                $errors[] = $message->getMessage();
            }

            $response->setJsonContent(array('status' => 'ERROR', 'messages' => $errors));
        }

        return $response;

    });

//Updates robots based on primary key
    $app->put('/api/users/{id:[0-9]+}', function() {

    });

//Deletes robots based on primary key
    $app->delete('/api/users/{id:[0-9]+}', function() {

    });


    // Start application
    $app->handle();

    // Set content
    $returnedValue = $app->getReturnedValue();

    if($returnedValue !== null){

        if(is_string($returnedValue)){

            $app->response->setContent($returnedValue);
        }
        else {

            $app->response->setJsonContent($returnedValue);
        }
    }

    $response = $app->response;

} catch (Exception $e) {

    $response = $di->get(AppServices::RESPONSE);
    $response->setErrorContent($e, $application_env == 'development');
}

// Send response
if($response){

    $response->sendHeaders();
    $response->send();
}
