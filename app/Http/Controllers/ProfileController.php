<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;

use function PHPUnit\Framework\isNull;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\View\View
     */
    public function edit(Request $request)
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     *
     * @param  \App\Http\Requests\ProfileUpdateRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(ProfileUpdateRequest $request)
    {
        $request->user()->fill($request->validated());

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }

        $request->user()->save();

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Delete the user's account.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current-password'],
        ]);

        $user = $request->user();
        Auth::logout();

        foreach ($user->announces as $announce) {
            DB::table('announce_categorie')->where('announce_id', $announce->id)->delete();
        }
        $user->announces()->delete();
        $user->anonymize($user);
        $user->save();

        $request->session()->invalidate();
        $request->session()->regenerateToken();
        Session::flash('success', "Votre compte a été supprimé");
        Redirect::to('/');
    }

    public function destroyUser(Request $request)
    {
        $userToDelete = User::where('id', $request->user_id)->firstOrFail();
        $userToDelete->anonymize($userToDelete);

        foreach ($userToDelete->announces as $announce) {
            DB::table('announce_categorie')->where('announce_id', $announce->id)->delete();
        }
        $userToDelete->announces()->delete();
        $userToDelete->anonymize($userToDelete);
        $userToDelete->save();

        Session::flash('success', "Vous avez supprimé l'utilisateur {$userToDelete->id}");
        return Redirect::to('admin_dashboard');
    }

    public function announces()
    {
        return $this->has_many('Announce');
    }
}
