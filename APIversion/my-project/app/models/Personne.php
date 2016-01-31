<?php

class Personne extends \App\Mvc\Model
{
    public $id;
    public $nom;
    public $prenom;
    public $password;
    public $mail;
    public $updatedAt;
    public $createdAt;

    public function getSource()
    {
        return 'personne';
    }

    public function columnMap()
    {
        return [
            'id'         => 'id',
            'nom'        => 'nom',
            'prenom'     => 'prenom',
            'mail'       => 'mail',
            'password'   => 'password',
            'updated_at' => 'updatedAt',
            'created_at' => 'createdAt',
        ];
    }


    public function getId(){
        return $this->$id;
    }

    public function getNom(){
        return $this->$nom;
    }

    public function setNom($name)
    {
        // The name is too short?
//        if (!is_string($name)) {
//            throw new \InvalidArgumentException('The name is not a string');
//        }
        $this->$nom = $name;
    }

    public function getPrenom(){
        return $this->$prenom;
    }

    public function setPrenom($firstname)
    {
        // The name is too short?
//        if (!is_string($firstname)) {
//            throw new \InvalidArgumentException('The firstname is not a string');
//        }
        $this->$prenom = $firstname;
    }

    public function getMail(){
        return $this->$mail;
    }

    public function setMail($email)
    {
        // The name is too short?
//        if (!is_string($email)) {
//            throw new \InvalidArgumentException('The mail is not a string');
//        }
        $this->$mail = $email;
    }

    public function getUpdateTime(){
        return $this->$updatedAt;
    }

    public function getCreateTime(){
        return $this->$createdAt;
    }
}