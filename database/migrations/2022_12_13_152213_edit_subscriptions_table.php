<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('subscriptions', function (Blueprint $table) {
            //
            $table->integer('id_vendeur');
            $table->integer('id_acheteur');
            $table->string('stripe_announce');
            $table->renameColumn('stripe_price', 'price');
            $table->dropColumn('user_id');
            $table->dropColumn('stripe_id');
            $table->dropColumn('name');
            $table->dropColumn('stripe_status');
            $table->dropColumn('trial_ends_at');
            $table->dropColumn('ends_at');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('subscriptions', function (Blueprint $table) {
            //
        });
    }
};
