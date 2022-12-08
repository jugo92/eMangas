<x-guest-layout>
    <x-auth-card>
        <x-slot name="logo">
            <a href="/">
                <x-application-logo class="w-20 h-20 fill-current text-gray-500" />
            </a>
        </x-slot>

        <form method="POST" action="{{ route('register') }}">
            @csrf

            <!-- Name -->
            <div>
                <x-input-label for="name" :value="__('Name')" />
                <x-text-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')" required autofocus />
                <x-input-error :messages="$errors->get('name')" class="mt-2" />
            </div>

            <!-- Email Address -->
            <div class="mt-4">
                <x-input-label for="email" :value="__('Email')" />
                <x-text-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required />
                <x-input-error :messages="$errors->get('email')" class="mt-2" />
            </div>

            <!-- Password -->
            <div class="mt-4">
                <x-input-label for="password" :value="__('Password')" />

                <x-text-input id="password" class="block mt-1 w-full"
                                type="password"
                                name="password"
                                required autocomplete="new-password" />

                <x-input-error :messages="$errors->get('password')" class="mt-2" />
            </div>

            <!-- Confirm Password -->
            <div class="mt-4">
                <x-input-label for="password_confirmation" :value="__('Confirm Password')" />

                <x-text-input id="password_confirmation" class="block mt-1 w-full"
                                type="password"
                                name="password_confirmation" required />

                <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
            </div>

            <!-- First Name -->
            <div class="mt-4">
                <x-input-label for="first_name" :value="__('FirstName')" />

                <x-text-input id="first_name" class="block mt-1 w-full"
                                type="text"
                                name="first_name" required />

                <x-input-error :messages="$errors->get('first_name')" class="mt-2" />
            </div>

            <!-- Addresse -->
            <div class="mt-4">
                <x-input-label for="addresse" :value="__('Addresse')" />

                <x-text-input id="addresse" class="block mt-1 w-full"
                                type="text"
                                name="addresse" required />

                <x-input-error :messages="$errors->get('addresse')" class="mt-2" />
            </div>

            <!-- Pseudo -->
            <div class="mt-4">
                <x-input-label for="pseudo" :value="__('Pseudo')" />

                <x-text-input id="pseudo" class="block mt-1 w-full"
                                type="text"
                                name="pseudo" required />

                <x-input-error :messages="$errors->get('pseudo')" class="mt-2" />
            </div>

            <!-- Phone Number -->
            <div class="mt-4">
                <x-input-label for="phone_number" :value="__('Phone Number')" />

                <x-text-input id="phone_number" class="block mt-1 w-full"
                                type="text"
                                name="phone_number" required />

                <x-input-error :messages="$errors->get('phone_number')" class="mt-2" />
            </div>

            <div class="flex items-center justify-end mt-4">
                <a class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" href="{{ route('login') }}">
                    {{ __('Already registered?') }}
                </a>

                <x-primary-button class="ml-4">
                    {{ __('Register') }}
                </x-primary-button>
            </div>
        </form>
    </x-auth-card>
</x-guest-layout>
