<?php

require_once __DIR__ . '/vendor/autoload.php';

use GuzzleHttp\Client;

echo "Hello World!";

$client = new Client([
    'base_uri' => 'https://jsonplaceholder.typicode.com',
    'timeout'  => 2.0,
]);

$response = $client->request('GET', '/posts/1');

echo $response->getBody();

echo "Finished!";