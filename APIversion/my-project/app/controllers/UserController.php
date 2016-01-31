<?php

use Library\App\Constants\Services as AppServices;
use Library\PhalconRest\Transformers\UserTransformer;

/**
 * @resource("User")
 */
class UserController extends \App\Mvc\Controller
{
    /**
     * @title("Me")
     * @description("Get the current user")
     * @includeTypes({
     *      "accounts": "Adds accounts object to the response"
     * })
     * @requestExample("GET /users/me")
     * @response("User object or Error object")
     */
    public function me()
    {
        return $this->respondItem($this->user, new \UserTransformer, 'user');
    }


    public function create()
    {
        $data = $this->request->getJsonRawBody();

        $personne = new Personne();
        $personne->assign((array)$data);

//        var_dump($data);

        if (!$personne->save()) {
            throw new UserException(ErrorCodes::DATA_FAIL, 'Could not create personne.');
        }

//        return $this->respondItem($personne, new UserTransformer(), 'personne');
        return $data;
    }
    /**
     * @title("Authenticate")
     * @description("Authenticate user")
     * @headers({
     *      "Authorization": "'Basic sd9u19221934y='"
     * })
     * @requestExample("POST /users/authenticate")
     * @response("Data object or Error object")
     */
    public function authenticate()
    {
        $username = $this->request->getUsername();
        $password = $this->request->getPassword();

        $session = $this->authManager->loginWithUsernamePassword(\App\Auth\UsernameAccountType::NAME, $username, $password);
        $response = [
            'token' => $session->getToken(),
            'expires' => $session->getExpirationTime()
        ];

        return $this->respondArray($response, 'data');
    }
}
