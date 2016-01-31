<?php
return array(
    'apiRecognized\\V1\\Rest\\Personne\\Controller' => array(
        'collection' => array(
            'GET' => array(
                'response' => '{
   "_links": {
       "self": {
           "href": "/personne"
       },
       "first": {
           "href": "/personne?page={page}"
       },
       "prev": {
           "href": "/personne?page={page}"
       },
       "next": {
           "href": "/personne?page={page}"
       },
       "last": {
           "href": "/personne?page={page}"
       }
   }
   "_embedded": {
       "personne": [
           {
               "_links": {
                   "self": {
                       "href": "/personne[/:personne_id]"
                   }
               }
              "personne_id": "",
              "personne_nom": "",
              "personne_password": ""
           }
       ]
   }
}',
            ),
            'POST' => array(
                'request' => '{
   "personne_id": "",
   "personne_nom": "",
   "personne_password": ""
}',
                'response' => '{
   "_links": {
       "self": {
           "href": "/personne[/:personne_id]"
       }
   }
   "personne_id": "",
   "personne_nom": "",
   "personne_password": ""
}',
            ),
        ),
        'entity' => array(
            'GET' => array(
                'response' => '{
   "_links": {
       "self": {
           "href": "/personne[/:personne_id]"
       }
   }
   "personne_id": "",
   "personne_nom": "",
   "personne_password": ""
}',
            ),
            'PUT' => array(
                'request' => '{
   "personne_id": "",
   "personne_nom": "",
   "personne_password": ""
}',
                'response' => '{
   "_links": {
       "self": {
           "href": "/personne[/:personne_id]"
       }
   }
   "personne_id": "",
   "personne_nom": "",
   "personne_password": ""
}',
            ),
            'DELETE' => array(
                'request' => '{
   "personne_id": "",
   "personne_nom": "",
   "personne_password": ""
}',
                'response' => '{
   "_links": {
       "self": {
           "href": "/personne[/:personne_id]"
       }
   }
   "personne_id": "",
   "personne_nom": "",
   "personne_password": ""
}',
            ),
        ),
    ),
);
