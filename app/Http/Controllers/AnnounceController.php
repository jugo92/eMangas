<?php

namespace App\Http\Controllers;

use App\Models\Announce;
use App\Models\Categorie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AnnounceController extends Controller
{
    public function index(Request $request)
    {
        $announces = Announce::paginate(8); //récupère les messages
        $var = $request->url();
        $url = explode("/",$var);
        $slug = end($url);
        return view('announce/index', ['announces' => $announces, 'slug' => $slug]); //retourne la vue dashboard
    }

    public function myAnnounce(Request $request){
        $var = $request->url();
        $url = explode("/",$var);
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
        }else{
            return view('announce/formAnnounce');
        }
    }

    public function saveAnnounce(Request $request)
    {
        $announce = new Announce();
        $categories = new Categorie();
        $arrCategorieId = [];
        if($request->input('announce_id') == null){
            foreach($categories->all() as $categorie){
                if($request->input($categorie->id)){
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
            $announce->save();
            foreach($arrCategorieId as $id){
             $announce->categorie_announces()->attach($id);
            }
        }else{
            foreach($categories->all() as $categorie){
                if($request->input($categorie->id)){
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
            $announce->nbSales = 0;
            $announce->save();
            foreach($arrCategorieId as $id){
                $announce->categorie_announces()->attach($id);
               }        }
        return redirect()->route('myAnnounce');
    }

    public function updateAnnounce(Request $request)
    {
        $categories = new Categorie();
        $announce = Announce::findOrFail($request->announce_id);
        if(!$request->user()->role === 'admin' || !Announce::isAnnounceMine($announce->idUser)){
            abort(403);
        }
        return view('announce/formAnnounce', ['announce' => $announce, 'categories' => $categories->all(), 'categoriesChecked' => explode(',', $announce->idCategorie)]);
    }

    public function deleteAnnounce(Request $request)
    {
        $announce = Announce::findOrFail($request->announce_id);
        if(!$request->user()->role === 'admin' || !Announce::isAnnounceMine($announce->idUser)){
            abort(403);
        }
        Announce::destroy($request->announce_id);
        return redirect()->route('myAnnounce'); //redirige vers la page dashboard
    }
}
