<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    Welcome on e-Mangas !
                    <br><br>
                    <div class="grid">
                        <p>Cliquer ici pour créer une catégorie -> <a href="{{route('formCategorie')}}">ICI</a></p>
                    </div>
                    <div class="grid">

                        <div class="row">
                            @foreach($categories as $categorie)
                            <div class="col col-3">
                                <b>Catégorie n° {{$categorie->id}}</b><br>
                                <b>Nom  :</b> {{$categorie->name}}<br>
                                <a href="{{route('deleteCategorie', $categorie->id)}}">delete</a>
                                <a href="{{route('updateCategorie', $categorie->id)}}">update</a>
                            </div>
                                @endforeach
                        </div>

                    </div>
                    <ul>
                        <br>
                        {{ $categories->links(); }}
                    </ul>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
