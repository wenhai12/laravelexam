<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');

    $router->resource('users', UserController::class);

    $router->resource('project', ProjectController::class);

    $router->resource('selects', Question\SelectController::class);

    $router->resource('blanks', Question\BlankController::class);

    $router->resource('answers', Question\AnwerController::class);

});
