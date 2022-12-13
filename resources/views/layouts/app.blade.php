<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.bunny.net/css2?family=Nunito:wght@400;600;700&display=swap">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="font-sans antialiased">
    <div class="min-h-screen bg-gray-100">
        @include('layouts.navigation')

        <!-- Page Heading -->
        @if (isset($header))
        <header class="bg-white shadow">
            <div id="row-nav-main" class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                @if(Session::has('success'))
                <div id='flash-msg' class='row flash flash-success'>
                    <div class="col">
                        {{ Session::get('success') }}
                    </div>
                </div>
                @endif
                {{ $header }}
            </div>
        </header>
        @endif

        <!-- Page Content -->
        <main>
            {{ $slot }}
        </main>
    </div>
    @yield('extra-js');
</body>

</html>
<script>
    $().ready(function (){
        setTimeout(function() {
            var flash = document.getElementById('flash-msg');
            var container = document.getElementById('row-nav-main');
            container.removeChild(flash);
        }, 3000);
    })
</script>

