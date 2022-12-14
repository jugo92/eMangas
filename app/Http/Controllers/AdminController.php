<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\ProfileUpdateRequest;
use App\Models\Announce;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    //
    public function admin_dashboard()
    {
        $users = User::where('role', 'user')->paginate(6);
        return view('admin/admin_dashboard', ['users' => $users]);
    }
}
