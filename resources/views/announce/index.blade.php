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
                        <div class="row">
                            <div class="col col-3">
                                <a href="{{route('formAnnounce')}}">
                                    <x-secondary-button class="">
                                        {{ __('Créer une annonce') }}
                                    </x-secondary-button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="grid">
                        <div class="row">
                            @foreach($announces as $announce)
                            <?php
                            $nbLike = 0;
                            if (isset($likes)) {
                                foreach ($likes as $like) {
                                    if ($like->idAnnounce == $announce->id) $nbLike++;
                                }
                            }
                            ?>
                            <div class="col col-3">
                                <b>Annonce n° {{$announce->id}}</b><br>
                                <b>Catégorie :</b> {{$announce->idCategorie=1}}<br>
                                <b>Titre :</b> {{$announce->title}}<br>
                                <b>Description :</b> {{$announce->description}}<br>
                                <b>Coût Unitaire :</b> {{$announce->price}}<br>
                                <b>Quantité :</b> {{$announce->inventory}}<br>
                                <b>Nombre de ventes :</b> {{$announce->nbSales}}<br>
                                @if($announce->idUser==Auth::id() and $slug<>'index')
                                    [<a href="{{route('deleteAnnounce', $announce->id)}}">delete</a>]
                                    [<a href="{{route('updateAnnounce', $announce->id)}}">update</a>]<br>
                                    @endif
                                    [<a href="{{route('like', $announce->id)}}">Like</a>]
                                    [<a href="{{route('dislike', $announce->id)}}">Dislike</a>]
                                    <b>Nb likes : </b> <?= $nbLike ?>
                                    @if($announce->idUser!=Auth::id() and $slug<>'myAnnounce' and $announce->inventory > 0)
                                        [<a href="{{route('plan', $announce->slug)}}">Acheter</a>]
                                        @endif
                            </div>
                            @endforeach
                        </div>

                    </div>
                    <ul>
                        <br>
                        {{ $announces->links(); }}
                    </ul>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
