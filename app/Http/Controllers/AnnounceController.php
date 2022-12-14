<?php

namespace App\Http\Controllers;

use App\Models\Announce;
use App\Models\Categorie;
use App\Models\Like;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class AnnounceController extends Controller
{
    public function index(Request $request)
    {
        $likes = Like::all();
        $announces = Announce::paginate(8); //récupère les messages
        $var = $request->url();
        $url = explode("/", $var);
        $slug = end($url);
        return view('announce/index', ['announces' => $announces, 'slug' => $slug, 'likes' => $likes]); //retourne la vue dashboard
    }

    public function myAnnounce(Request $request)
    {
        $likes = Like::all();
        $var = $request->url();
        $url = explode("/", $var);
        $slug = end($url);
        $announces = Announce::where("idUser", Auth::id())->paginate(8);
        return view('announce/index', ['announces' => $announces, 'slug' => $slug, 'likes' => $likes]);
    }

    public function formAnnounce(Request $request)
    {
        $announce = new Announce();
        $categories = new Categorie();
        if ($request->announce_id == null) {
            $announce->user_id = Auth::id();
            return view("announce/formAnnounce", ['categories' => $categories->all()]);
        } else {
            return view('announce/formAnnounce');
        }
    }

    public function saveAnnounce(Request $request)
    {
        $request->validate([
            'announce_desc' => ['required'],
            'announce_title' => ['required'],
            'announce_price' => ['required', "integer"],
            'announce_inventory' => ['required'],
        ]);


        $announce = new Announce();
        $categories = new Categorie();
        $arrCategorieId = [];
        if ($request->input('announce_id') == null) {
            foreach ($categories->all() as $categorie) {
                if ($request->input($categorie->id)) {
                    $arrCategorieId[] = $categorie->id;
                }
            }
            $listIdsCategorie = implode(',', $arrCategorieId);
            $announce->idUser = Auth::id();
            $announce->idCategorie = $listIdsCategorie;
            $announce->description = $request->input('announce_desc');
            $announce->price = $request->input('announce_price');
            $announce->title = $request->input('announce_title');
            $announce->inventory = $request->input('announce_inventory');
            $announce->nbSales = 0;
            $announce->slug = strtolower($request->input('announce_title'));
            $announce->save();
            foreach ($arrCategorieId as $id) {
                $announce->categorie_announces()->attach($id);
            }
        } else {
            foreach ($categories->all() as $categorie) {
                if ($request->input($categorie->id)) {
                    $arrCategorieId[] = $categorie->id;
                }
            }
            $listIdsCategorie = implode(',', $arrCategorieId);
            $announce = Announce::findOrFail($request->input('announce_id'));
            $announce->idUser = Auth::id();
            $announce->idCategorie = $listIdsCategorie;
            $announce->description = $request->input('announce_desc');
            $announce->price = $request->input('announce_price');
            $announce->title = $request->input('announce_title');
            $announce->inventory = $request->input('announce_inventory');
            $announce->nbSales = $announce->nbSales;
            $announce->save();
            foreach ($arrCategorieId as $id) {
                $announce->categorie_announces()->attach($id);
            }
        }
        Session::flash('success', 'Annonce enregistrer avec succés');
        return redirect()->route('myAnnounce');
    }

    public function updateAnnounce(Request $request)
    {
        $categories = new Categorie();
        $announce = Announce::findOrFail($request->announce_id);
        if (!$request->user()->role === 'admin' || !Announce::isAnnounceMine($announce->idUser)) {
            abort(403);
        }
        return view('announce/formAnnounce', ['announce' => $announce, 'categories' => $categories->all(), 'categoriesChecked' => explode(',', $announce->idCategorie)]);
    }

    public function deleteAnnounce(Request $request)
    {
        $announce = Announce::findOrFail($request->announce_id);
        if (!$request->user()->role === 'admin' || !$request->user()->role === 'admin' && !$announce->isAnnounceMine($announce->idUser) || !$announce->isAnnounceMine($announce->idUser)) {
            abort(403);
        }
        Announce::destroy($request->announce_id);
        Session::flash('success', 'Annonce supprimé avec succés');
        return redirect()->route('myAnnounce'); //redirige vers la page dashboard
    }

    public function checkout(Request $request)
    {
        \Stripe\Stripe::setApiKey(config(key: 'stripe.sk'));
        $announce = Announce::where('slug', $request->announce_id)->firstorfail();

        $session = \Stripe\Checkout\Session::create([
            'line_items' => [
                [
                    'price_data' => [
                        'currency' => 'eur',
                        'product_data' => [
                            'name' => $announce->title,
                        ],
                        'unit_amount' => $announce->price * 100,
                    ],
                    'quantity' => 1,
                ],
            ],
            "mode" => 'payment',
            'success_url' => route('subscription', $announce->id),
            'cancel_url' => route('index'),
        ]);
        return redirect()->away($session->url);
    }
}
