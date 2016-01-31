<?php
namespace apiRecognized\V1\Rest\Personne;

class PersonneResourceFactory
{
    public function __invoke($services)
    {
        return new PersonneResource();
    }
}
