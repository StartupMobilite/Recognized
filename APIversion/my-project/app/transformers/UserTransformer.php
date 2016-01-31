<?php

use League\Fractal;

class UserTransformer extends Fractal\TransformerAbstract
{
    public function transform(\User $user)
    {
        return [
            'id' => (int)$user->$id,
            'nom' => $user->$nom,
            'prenom' => $user->$prenom,
            'password' => $user->$password
        ];
    }
}
