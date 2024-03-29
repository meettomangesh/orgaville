<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddRelationshipFieldsToCitiesTable extends Migration
{
    public function up()
    {
        Schema::table('cities', function (Blueprint $table) {

            $table->foreign('country_id', 'country_fk_1586974')->references('id')->on('countries');

            $table->foreign('state_id', 'state_fk_158676974')->references('id')->on('states');
        });
    }
}
