<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Announce;
use App\Models\User;
use App\Models\Subscription;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use IlluminateSupportCarbon;
use Spatie\Flash\Flash;

class SubscriptionController extends Controller
{
    public function create(Request $request)
    {
        $announce = Announce::findOrFail($request->announce_id);

        $subscription = new Subscription();
        $subscription->id_acheteur= Auth::id();
        $subscription->id_vendeur = $announce->idUser;
        $subscription->stripe_announce = $announce->stripe_announce;
        $subscription->price = $announce->price;
        $subscription->created_at= now()->tz('Europe/Paris');;
        $subscription->quantity = 1;

        $announce->update(['inventory' => $announce->inventory - 1, 'nbSales' => $announce->nbSales + 1]);
        $subscription->save();
        Session::flash('success', 'Paiement effectué avec succés');
        return redirect()->route('purchases');
    }

    public function sells(Request $request)
    {
        $subscription = Subscription::all()->where('id_vendeur', Auth::id());
        return view('plans.sell',['sells' => $subscription]);
    }

    public function purchases(Request $request)
    {
        $subscription = Subscription::all()->where('id_acheteur', Auth::id());
        return view('plans.purchase',['purchases' => $subscription]);
    }


}
