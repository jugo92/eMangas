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
                            <p>New Categorie</p>
                        </div>
                    </div>
                    <form method='POST' action="{{ route('postCategorie') }}" class="grid">
                        @csrf

                        <input type='hidden' name='categorie_id' value='@if(isset($categorie)){{$categorie->id}}@endif'>

                        <label for="categorie_name">Title</label>
                        <input type='text' name='categorie_name' value='@if(isset($categorie)){{$categorie->name}}@endif'><br>

                        <input type='submit' value='@if(isset($categorie)) Update categorie @else Create categorie @endif'>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>

