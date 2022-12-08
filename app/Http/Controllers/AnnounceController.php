<?php

namespace App\Http\Controllers;

use App\Models\Announce;
use App\Models\Categorie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AnnounceController extends Controller
{
    public function index()
    {
        $announces = Announce::paginate(8); //récupère les messages
        return view('announce/index', ['announces' => $announces]); //retourne la vue dashboard
    }

    public function myAnnounce(Request $request){
        $announces = Announce::where("idUser", Auth::id())->paginate(8);
        return view('announce/index', ['announces' => $announces]);
    }

    public function formAnnounce(Request $request)
    {
        $announce = new Announce();
        $categories = new Categorie();
        if ($request->announce_id == null) {
            $announce->user_id = Auth::id();
            return view("announce/formAnnounce", ['categories' => $categories->all()]);
        }else{
            $cat = $categories->all();
            return view('announce/formAnnounce')
            ->with(['cat' => $cat]);
        }
    }

    public function postAnnounce(Request $request)
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
            if($request->input('categories'))
            $listIdsCategorie = implode(',', $arrCategorieId);
            $announce = Announce::findOrFail($request->input('announce_id'));
            $announce->idUser = Auth::id();
            $announce->idCategorie = $listIdsCategorie;
            $announce->description = $request->input('announce_desc');
            $announce->price = $request->input('announce_price');
            $announce->title = $request->input('announce_title');
            $announce->inventory = $request->input('announce_inventory');
            $announce->nbSales = 0;
            // $announce->save();
            // $announce->categorie_announces()->attach($announce->idCategorie);
        }
        return redirect()->route('myAnnounce');
    }

    public function updateAnnounce(Request $request)
    {
        $announce = Announce::findOrFail($request->announce_id);
        if(!$request->user()->role === 'admin' || !Announce::isAnnounceMine($announce->idUser)){
            abort(403);
        }
        return view('announce/formAnnounce', ['announce' => $announce]);
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
