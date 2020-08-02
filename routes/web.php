<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/oficinas', 'OficinaController@getOficinas')->name('get-oficinas');
Route::get('/coches', 'CocheController@getCoches')->name('get-coches');
Route::post('/coches', 'CocheController@saveCoches')->name('post-coches');
Route::patch('/coches/{coche}', 'CocheController@updateCoches')->name('patch-coches');
Route::delete('/coches/{coche}', 'CocheController@deleteCoches')->name('delete-coches');
