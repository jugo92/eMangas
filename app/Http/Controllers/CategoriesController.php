<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Categorie;

class CategoriesController extends Controller
{
    public function categories()
    {
        $categories = Categorie::paginate(8); //récupère les messages
        return view('categorie/categories', ['categories' => $categories]); //retourne la vue dashboard
    }

    public function formCategorie(Request $request)
    {
        $categorie = new Categorie();
        if ($request->categorie_id == null) {
            return view("categorie/formCategorie");
        }else{
            return view("categorie/formCategorie",['categorie' => $request->announce]);
        }
    }

    public function postCategorie(Request $request)
    {
        $categorie = new Categorie();
        if($request->input('categorie_id') == null){
            $categorie->name = $request->input('categorie_name');
            $categorie->save();
        }else{
            $categorie = Categorie::findOrFail($request->input('categorie_id'));
            $categorie->name = $request->input('categorie_name');
            $categorie->save();
        }
        return redirect()->route('categories');
    }

    public function updateCategorie(Request $request)
    {
        $categorie = Categorie::findOrFail($request->categorie_id);
        return view('categorie/formCategorie', ['categorie' => $categorie]);
    }

    public function deleteCategorie(Request $request)
    {
        Categorie::destroy($request->categorie_id);
        return redirect()->route('categories'); //redirige vers la page dashboard
    }
}
