<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('masters', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_user')->constrained('users');
            $table->string('name');
            $table->string('surname');
            $table->integer('age');
            $table->string('city');
            $table->integer('staj');
            $table->integer('clients_count');
            $table->integer('min_cena');
            $table->text('description');
            $table->string('avatar');
            $table->string('admin_status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('masters');
    }
};
