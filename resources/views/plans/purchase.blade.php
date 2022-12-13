<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Vos Achats') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    Vos Achats
                    <br><br>
                    <div class="grid">
                        <div class="row">
                            @foreach($purchases as $purchase)
                            <div class="col col-3">
                                <b>Date de l'achat {{$purchase->created_at}}</b><br>
                                <b>Prix :</b> {{$purchase->price}}<br>
                                <b>Quantité :</b> {{$purchase->quantity}}<br>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
