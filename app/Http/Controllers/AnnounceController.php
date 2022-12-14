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

    protected $stripe;

    public function __construct()
    {
        $this->stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
    }
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
        $var = $request->url();
        $url = explode("/", $var);
        $slug = end($url);
        $announces = Announce::where("idUser", Auth::id())->paginate(8);
        return view('announce/index', ['announces' => $announces, 'slug' => $slug]);
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
            $announce->avis_positif = 0;
            $announce->avis_negatif = 0;
            $announce->nbSales = 0;
            $announce->slug = strtolower($request->input('announce_title'));
            // $announce->stripe_announce = 'striped';

            //create stripe product
            $stripeProduct = $this->stripe->products->create([
                'name' => $request->input('announce_title')
            ]);

            //Stripe Plan Creation
            $stripePlanCreation = $this->stripe->plans->create([
                'amount' => $request->input('announce_price'),
                'currency' => 'inr',
                'interval' => 'month', //  it can be day,week,month or year
                'product' => $stripeProduct->id,
            ]);

            $announce->stripe_announce = $stripePlanCreation->id;
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
            $announce->avis_positif = $announce->avis_positif;
            $announce->avis_negatif = $announce->avis_negatif;
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
        if (!$request->user()->role === 'admin' || !Announce::isAnnounceMine($announce->idUser)) {
            abort(403);
        }
        Announce::destroy($request->announce_id);
        Session::flash('success', 'Annonce supprimé avec succés');
        return redirect()->route('myAnnounce'); //redirige vers la page dashboard
    }

    /**
     * Show the Plan.
     *
     * @return mixed
     */
    public function show(Request $request)
    {
        $paymentMethods = $request->user()->paymentMethods();

        $intent = $request->user()->createSetupIntent();
        $announce = Announce::where('slug', $request->announce_id)->firstorfail();
        return view('plans.show', compact('announce', 'intent'));
    }
}
