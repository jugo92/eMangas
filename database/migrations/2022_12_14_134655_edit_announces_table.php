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
        Schema::table('announces', function (Blueprint $table) {
            //
            $table->dropColumn('avis_positif');
            $table->dropColumn('avis_negatif');
            $table->dropColumn('stripe_announce');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('announces', function (Blueprint $table) {
            //
            $table->integer('avis_positif');
            $table->integer('avis_negatif');
            $table->integer('stripe_announce');
        });
    }
};
