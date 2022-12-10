<?php

use App\Http\Controllers\AnnounceController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\SubscriptionController;
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

    Route::get('/index', [AnnounceController::class, 'index'])->name('index'); //liste tout les articles
    Route::get('/formAnnounce', [AnnounceController::class, 'formAnnounce'])->name('formAnnounce'); // vue d'article
    Route::post('/saveAnnounce', [AnnounceController::class, 'saveAnnounce'])->name('saveAnnounce'); // insére/met à jour puis redirige
    Route::get('/updateAnnounce/{announce_id}', [AnnounceController::class, 'updateAnnounce'])->name('updateAnnounce'); // renvoie le formulaire pour maj
    Route::get('/deleteAnnounce/{announce_id}', [AnnounceController::class, 'deleteAnnounce'])->name('deleteAnnounce'); // supprime puis redirige
    Route::get('/myAnnounce', [AnnounceController::class, 'myAnnounce'])->name('myAnnounce'); // vue annonce utilisateur

    // CATEGORIE

    Route::get('/categories', [CategoriesController::class, 'categories'])->name('categories')->middleware('role:admin');
    Route::get('/updateCategorie/{categorie_id}', [CategoriesController::class, 'updateCategorie'])->name('updateCategorie')->middleware('role:admin');
    Route::get('/deleteCategorie/{categorie_id}', [CategoriesController::class, 'deleteCategorie'])->name('deleteCategorie')->middleware('role:admin');
    Route::post('/postCategorie', [CategoriesController::class, 'postCategorie'])->name('postCategorie')->middleware('role:admin');
    Route::get('/formCategorie', [CategoriesController::class, 'formCategorie'])->name('formCategorie')->middleware('role:admin');


    Route::get('/sells', [SubscriptionController::class, 'sells'])->name('sells');
    Route::get('/purchases', [SubscriptionController::class, 'purchases'])->name('purchases');

    //STRIPE
    Route::get('/plan/{announce_id}', [AnnounceController::class, 'show'])->name('plan');

    Route::post('/subscription', [SubscriptionController::class, 'create'])->name('subscription');

    Route::post('store/plan', [SubscriptionController::class, 'storePlan'])->name('storePlan');

});


require __DIR__.'/auth.php';
