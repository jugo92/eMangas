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

    Route::get('/index', [AnnounceController::class, 'index'])->name('index'); //liste les articles
    Route::get('/formAnnounce', [AnnounceController::class, 'formAnnounce'])->name('formAnnounce'); // formulaire de saisie d'une annonce
    Route::post('/saveAnnounce', [AnnounceController::class, 'saveAnnounce'])->name('saveAnnounce'); // enregistre l'annonce
    Route::get('/updateAnnounce/{announce_id}', [AnnounceController::class, 'updateAnnounce'])->name('updateAnnounce'); // formulaire de saisie d'une annonce
    Route::get('/deleteAnnounce/{announce_id}', [AnnounceController::class, 'deleteAnnounce'])->name('deleteAnnounce'); // supprime une annonce
    Route::get('/myAnnounce', [AnnounceController::class, 'myAnnounce'])->name('myAnnounce'); // liste mes annonces

    // CATEGORIE

    Route::get('/categories', [CategoriesController::class, 'categories'])->name('categories')->middleware('role:admin'); // liste les catégories
    Route::get('/updateCategorie/{categorie_id}', [CategoriesController::class, 'updateCategorie'])->name('updateCategorie')->middleware('role:admin'); // met à jour les catégories
    Route::get('/deleteCategorie/{categorie_id}', [CategoriesController::class, 'deleteCategorie'])->name('deleteCategorie')->middleware('role:admin'); // supprime les catégories
    Route::post('/postCategorie', [CategoriesController::class, 'postCategorie'])->name('postCategorie')->middleware('role:admin'); // enregistre la catégorie
    Route::get('/formCategorie', [CategoriesController::class, 'formCategorie'])->name('formCategorie')->middleware('role:admin'); // formulaire de saisie des catégorie

    //STRIPE

    Route::get('/plan/{announce_id}', [AnnounceController::class, 'show'])->name('plan'); // saisie des coord bancaires
    Route::get('/sells', [SubscriptionController::class, 'sells'])->name('sells'); // affiche mes ventes
    Route::get('/purchases', [SubscriptionController::class, 'purchases'])->name('purchases'); // affiche mes achats
    Route::post('/subscription', [SubscriptionController::class, 'create'])->name('subscription'); // enregistre le paiement

});


require __DIR__.'/auth.php';
