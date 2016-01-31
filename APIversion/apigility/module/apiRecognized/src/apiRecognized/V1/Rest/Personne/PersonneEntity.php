<?php
namespace apiRecognized\V1\Rest\Personne;

class PersonneEntity
{


    public $personne_id;
    public $personne_nom;
    public $personne_prenom;
    public $personne_password;

    public function getArrayCopy()
    {
        return array(
            'id'     => $this->personne_id,
            'nom' => $this->personne_nom,
            'prenom' => $this->personne_prenom,
            'password'  => $this->personne_password,
        );
    }

    public function exchangeArray(array $array)
    {
        $this->personne_id     = $array['id'];
        $this->personne_nom = $array['nom'];
        $this->personne_prenom = $array['prenom'];
        $this->personne_password  = $array['password'];
    }
}
