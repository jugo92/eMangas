<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\RedirectResponse;
use App\Models\Like;

class LikeController extends Controller
{
    //
    public function like(Request $request, int $announce_id)
    {
        $like = Like::where('idAnnounce', '=', $announce_id)
                    ->where('idUser', '=', Auth::id())->first();
        if (!empty($like) && $like->status != 'like') {
            $like->status = 'like';
            $like->idUser = $like->idUser;
            $like->idAnnounce = $like->idAnnounce;
            $like->save();
            Session::flash('success', "Vous avez liké l'annonce {$announce_id}");
        }
        else if(!empty($like)){
            Like::destroy($like->id);
            Session::flash('success', "Vous avez retirer votre like de l'annonce {$announce_id}");
        }
        else {
            $like = new Like();
            $like->idUser = Auth::id();
            $like->idAnnounce = $announce_id;
            $like->status = 'like';
            $like->save();
            Session::flash('success', "Vous avez liké l'annonce {$announce_id}");
        }
        return redirect('/index');
    }

    public function countLike()
    {
        $like = Like::where('status', 'like');
        $like = count($like);
        return $like;
    }

    public function dislike(Request $request, int $announce_id)
    {
        $like = Like::where('idAnnounce', '=', $announce_id)
                    ->where('idUser', '=', Auth::id())->first();
        if (!empty($like) && $like->status != 'dislike') {
            $like->status = 'dislike';
            $like->idUser = $like->idUser;
            $like->idAnnounce = $like->idAnnounce;
            $like->save();
            Session::flash('success', "Vous avez disliké l'annonce {$announce_id}");
        }
        else if(!empty($like)){
            Like::destroy($like->id);
            Session::flash('success', "Vous avez retirer votre dislike de l'annonce {$announce_id}");
        }
        else {
            $like = new Like();
            $like->idUser = Auth::id();
            $like->idAnnounce = $announce_id;
            $like->status = 'dislike';
            $like->save();
            Session::flash('success', "Vous avez disliké l'annonce {$announce_id}");
        }
        return redirect('/index');
    }

    public function countDislike()
    {
        $like = Like::where('status', 'dislike');
        $like = count($like);
        return $like;
    }
}
