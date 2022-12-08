<?php

use App\Http\Controllers\AnnounceController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\ProfileController;
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

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // ANNOUNCE

    Route::get('/index', [AnnounceController::class, 'index'])->name('index');
    Route::get('/formAnnounce', [AnnounceController::class, 'formAnnounce'])->name('formAnnounce');
    Route::post('/postAnnounce', [AnnounceController::class, 'postAnnounce'])->name('postAnnounce');
    Route::get('/updateAnnounce/{announce_id}', [AnnounceController::class, 'updateAnnounce'])->name('updateAnnounce');
    Route::get('/deleteAnnounce/{announce_id}', [AnnounceController::class, 'deleteAnnounce'])->name('deleteAnnounce');
    Route::get('/myAnnounce', [AnnounceController::class, 'myAnnounce'])->name('myAnnounce');

    // CATEGORIE

    Route::get('/categories', [CategoriesController::class, 'categories'])->name('categories')->middleware('role:admin');
    Route::get('/updateCategorie/{categorie_id}', [CategoriesController::class, 'updateCategorie'])->name('updateCategorie')->middleware('role:admin');
    Route::get('/deleteCategorie/{categorie_id}', [CategoriesController::class, 'deleteCategorie'])->name('deleteCategorie')->middleware('role:admin');
    Route::post('/postCategorie', [CategoriesController::class, 'postCategorie'])->name('postCategorie')->middleware('role:admin');
    Route::get('/formCategorie', [CategoriesController::class, 'formCategorie'])->name('formCategorie')->middleware('role:admin');

});


require __DIR__.'/auth.php';
