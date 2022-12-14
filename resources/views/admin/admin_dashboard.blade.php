<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">

                    <section class="grid">
                        <div class="row">
                            <div class="col">
                                <h1>Bienvenue sur votre tableau de bord !</h1>
                                <p>Ici vous pouvez gérer les utilisateurs, les annonces, les catégories et garder un oeil sur les transaction de votre sites.</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h2>Gestion des utilisateurs</h2>
                            </div>
                        </div>
                        <div class="row">
                            @foreach($users as $user)
                            @if(Auth::user()<>$user)
                                <div class="col col-4">
                                    <p><b>Nom : </b>{{$user->name}}</p>
                                    <p><b>Email : </b>{{$user->email}}</p>
                                    <p><b>Pseudo : </b>{{$user->pseudo}}</p>
                                    <p><b>N° de téléphone : </b>{{$user->phoneNumber}}</p>
                                    <p><b>Adresse : </b>{{$user->adresse}}</p>
                                    <p><b>Role : </b>{{$user->role}}</p>
                                    <form method="post" action="{{route('propro', $user->id)}}" onsubmit="return confirm('Etes vous sur de vouloir supprimer{{$user->name}}?');">
                                        @csrf
                                        @method('delete')
                                        <input type="submit" value="Supprimer">
                                    </form>
                                </div>
                                @endif
                                @endforeach
                        </div>
                        <ul>
                            <br>
                            {{ $users->links(); }}
                        </ul>
                    </section>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
