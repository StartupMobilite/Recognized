<?php
return array(
    'service_manager' => array(
        'factories' => array(
            'apiRecognized\\V1\\Rest\\Personne\\PersonneResource' => 'apiRecognized\\V1\\Rest\\Personne\\PersonneResourceFactory',
        ),
    ),
    'router' => array(
        'routes' => array(
            'api-recognized.rest.personne' => array(
                'type' => 'Segment',
                'options' => array(
                    'route' => '/personne[/:personne_id]',
                    'defaults' => array(
                        'controller' => 'apiRecognized\\V1\\Rest\\Personne\\Controller',
                    ),
                ),
            ),
        ),
    ),
    'zf-versioning' => array(
        'uri' => array(
            0 => 'api-recognized.rest.personne',
        ),
    ),
    'zf-rest' => array(
        'apiRecognized\\V1\\Rest\\Personne\\Controller' => array(
            'listener' => 'apiRecognized\\V1\\Rest\\Personne\\PersonneResource',
            'route_name' => 'api-recognized.rest.personne',
            'route_identifier_name' => 'personne_id',
            'collection_name' => 'personne',
            'entity_http_methods' => array(
                0 => 'GET',
                1 => 'PUT',
                2 => 'DELETE',
            ),
            'collection_http_methods' => array(
                0 => 'GET',
                1 => 'POST',
            ),
            'collection_query_whitelist' => array(),
            'page_size' => 25,
            'page_size_param' => null,
            'entity_class' => 'apiRecognized\\V1\\Rest\\Personne\\PersonneEntity',
            'collection_class' => 'apiRecognized\\V1\\Rest\\Personne\\PersonneCollection',
            'service_name' => 'personne',
        ),
    ),
    'zf-content-negotiation' => array(
        'controllers' => array(
            'apiRecognized\\V1\\Rest\\Personne\\Controller' => 'HalJson',
        ),
        'accept_whitelist' => array(
            'apiRecognized\\V1\\Rest\\Personne\\Controller' => array(
                0 => 'application/vnd.api-recognized.v1+json',
                1 => 'application/hal+json',
                2 => 'application/json',
            ),
        ),
        'content_type_whitelist' => array(
            'apiRecognized\\V1\\Rest\\Personne\\Controller' => array(
                0 => 'application/vnd.api-recognized.v1+json',
                1 => 'application/json',
            ),
        ),
    ),
    'zf-hal' => array(
        'metadata_map' => array(
            'apiRecognized\\V1\\Rest\\Personne\\PersonneEntity' => array(
                'entity_identifier_name' => 'id',
                'route_name' => 'api-recognized.rest.personne',
                'route_identifier_name' => 'personne_id',
                'hydrator' => 'Zend\\Stdlib\\Hydrator\\ArraySerializable',
            ),
            'apiRecognized\\V1\\Rest\\Personne\\PersonneCollection' => array(
                'entity_identifier_name' => 'id',
                'route_name' => 'api-recognized.rest.personne',
                'route_identifier_name' => 'personne_id',
                'is_collection' => true,
            ),
        ),
    ),
    'zf-content-validation' => array(
        'apiRecognized\\V1\\Rest\\Personne\\Controller' => array(
            'input_filter' => 'apiRecognized\\V1\\Rest\\Personne\\Validator',
        ),
    ),
    'input_filter_specs' => array(
        'apiRecognized\\V1\\Rest\\Personne\\Validator' => array(
            0 => array(
                'required' => true,
                'validators' => array(),
                'filters' => array(),
                'name' => 'id',
            ),
            1 => array(
                'required' => true,
                'validators' => array(),
                'filters' => array(),
                'name' => 'nom',
            ),
            2 => array(
                'required' => true,
                'validators' => array(),
                'filters' => array(),
                'name' => 'prenom',
            ),
            3 => array(
                'required' => true,
                'validators' => array(),
                'filters' => array(),
                'name' => 'password',
            ),
        ),
    ),
);
