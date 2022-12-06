<?php

namespace App\Http\Controllers;

use App\Models\Announce;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AnnounceController extends Controller
{
    // public function getAnnounce(Request $request){
    //     $announce = new Announce();
    //     $announce->user_id=Auth::id();
    //     $announce->message=$request->input('message');
    //     $announce->save();
    //     return redirect()->route('dashboard');
    // }
    public function index()
    {
        $announces = Announce::paginate(8); //récupère les messages
        return view('announce/index', ['announces' => $announces]); //retourne la vue dashboard
    }

    public function formAnnounce(Request $request)
    {
        $announce = new Announce();
        if ($request->announce_id == null) {
            $announce->user_id = Auth::id();
            return view("announce/formAnnounce");
        }else{
            return view("announce/formAnnounce",['announce' => $request->announce]);
        }
    }

    public function postAnnounce(Request $request)
    {
        $announce = new Announce();
        if($request->input('announce_id') == null){
            $announce->idUser = Auth::id();
            $announce->idCategorie = 1;
            $announce->description = $request->input('announce_desc');
            $announce->price = $request->input('announce_price');
            $announce->title = $request->input('announce_title');
            $announce->inventory = $request->input('announce_inventory');
            $announce->nbSales = 0;
            $announce->save();
        }else{
            $announce = Announce::findOrFail($request->input('announce_id'));
            $announce->idUser = Auth::id();
            $announce->idCategorie = 1;
            $announce->description = $request->input('announce_desc');
            $announce->price = $request->input('announce_price');
            $announce->title = $request->input('announce_title');
            $announce->inventory = $request->input('announce_inventory');
            $announce->nbSales = 0;
            $announce->save();
        }
        return redirect()->route('index');
    }

    public function updateAnnounce(Request $request)
    {
        $announce = Announce::findOrFail($request->announce_id);
        return view('announce/formAnnounce', ['announce' => $announce]);
    }

    public function deleteAnnounce(Request $request)
    {
        Announce::destroy($request->announce_id);
        return redirect()->route('index'); //redirige vers la page dashboard
    }
}
