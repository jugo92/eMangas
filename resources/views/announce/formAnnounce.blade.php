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
                    <div class="row">
                        <div class="col">
                            <p>New Announce</p>
                        </div>
                    </div>
                    <form method='POST' action="{{ route('saveAnnounce') }}" class="grid">
                        @csrf
                        <input type='hidden' name='announce_id' value='@if(isset($announce)){{$announce->id}}@endif'>

                        <label for="announce_title">Title</label>
                        <input type='text' name='announce_title' value='@if(isset($announce)){{$announce->title}}@endif'><br>

                        <label for="announce_desc">Description</label>
                        <input type='text' name='announce_desc' value='@if(isset($announce)){{$announce->description}}@endif'><br>

                        {{--@foreach ($categories as $categorie)
                        <div class="col">
                            <input type="checkbox" id="categorie_{{$categorie->id}}" name="{{$categorie->id}}">
                        <label for="categorie_{{$categorie->id}}">{{ $categorie->name }}</label>
                </div>
                @endforeach--}}

                @foreach ($categories as $categorie)
                <div class="col">
                    @if(isset($announce))
                        @if(in_array($categorie->id, $categoriesChecked))
                        <input type="checkbox" id="categorie_{{$categorie->id}}" name="{{$categorie->id}}" checked>
                        @else
                        <input type="checkbox" id="categorie_{{$categorie->id}}" name="{{$categorie->id}}">
                        @endif
                    @else
                    <input type="checkbox" id="categorie_{{$categorie->id}}" name="{{$categorie->id}}">
                    @endif
                    <label for="categorie_{{$categorie->id}}">{{$categorie->name}}</label>
                </div>
                @endforeach

                <label for="announce_price">Unit Price</label>
                <input type='text' name='announce_price' value='@if(isset($announce)){{$announce->price}}@endif'><br>

                <label for="announce_inventory">Inventory Quantity</label>
                <input type='text' name='announce_inventory' value='@if(isset($announce)){{$announce->inventory}}@endif'><br>

                <input type='submit' value='@if(isset($announce)) Update announce @else Create announce @endif'>
                </form>
            </div>
        </div>
    </div>
    </div>
</x-app-layout>
