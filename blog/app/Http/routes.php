<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$app->get('/', function () use ($app) {
    return $app->version();
});


$app->group(['prefix' => 'api/v1/'], function () use ($app) {

    $app->group(['prefix' => 'user/', 'namespace' => 'App\Http\Controllers\User'], function () use ($app) {
        $app->get('foo', function () {
            return 'Hello foo';
        });
        $app->get('bar', function () {
            return 'Hello bar';
        });
    });

    $app->group(['prefix' => 'job/', 'namespace' => 'App\Http\Controllers\Job'], function () use ($app) {
        $app->get('foo', function () {
            return 'Hello fooJob';
        });
        $app->get('bar', function () {
            return 'Hello barJob';
        });
    });
    

});
