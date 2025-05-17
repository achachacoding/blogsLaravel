<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\KomentarController;


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


Route::get('/', [HomeController::class, 'utama']);

Route::get('/biodata', [HomeController::class, 'bio']);

Route::post('/kirim', [HomeController::class, 'kirim']);

Route::get('/data-table', function(){
    return view('halaman.table');
});

Route::middleware(['auth'])->group(function () {
    //CRUD Kategori

    //Create
    //Form Tambah Kategori
    Route::get('/kategori/create', [KategoriController::class, 'create']);
    //untuk tambah data ke database
    Route::post('/kategori', [KategoriController::class, 'store']);

    //Read
    //Tampil Data
    Route::get('/kategori', [KategoriController::class, 'index']);
    //detail berdasarkan id
    Route::get('/kategori/{kategori_id}', [KategoriController::class, 'show']);

    //Update
    //Form Update Kategori
    Route::get('/kategori/{kategori_id}/edit', [KategoriController::class, 'edit']);
    //update data ke databaese berdarkan id
    Route::put('/kategori/{kategori_id}', [KategoriController::class, 'update']);

    //Delete
    //delete berdarkan id
    Route::delete('/kategori/{kategori_id}', [KategoriController::class, 'destroy']);

    //Profile
    Route::resource('profile', ProfileController::class)->only(['index', 'update']);

    Route::post('/komentar/{post_id}', [KomentarController::class, 'tambah']);

});



//CRUD post
Route::resource('post', PostController::class);

Auth::routes();


