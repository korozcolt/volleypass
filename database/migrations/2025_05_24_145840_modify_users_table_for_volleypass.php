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
        Schema::table('users', function (Blueprint $table) {
                        // Información personal extendida
            $table->string('document_type', 20)->default('cedula')->after('name'); // cedula, tarjeta_identidad, pasaporte
            $table->string('document_number', 20)->unique()->nullable()->after('document_type');
            $table->string('first_name', 100)->nullable()->after('document_number');
            $table->string('last_name', 100)->nullable()->after('first_name');
            $table->date('birth_date')->nullable()->after('last_name');
            $table->enum('gender', ['male', 'female'])->nullable()->after('birth_date');
            $table->string('phone', 20)->nullable()->after('gender');
            $table->string('phone_secondary', 20)->nullable()->after('phone');

            // Dirección
            $table->text('address')->nullable()->after('phone_secondary');
            $table->uuid('country_id')->nullable()->after('address');
            $table->uuid('department_id')->nullable()->after('country_id');
            $table->uuid('city_id')->nullable()->after('department_id');

            // Información del sistema
            $table->string('status', 20)->default('pending')->after('city_id'); // usando enum UserStatus
            $table->uuid('league_id')->nullable()->after('status');
            $table->uuid('club_id')->nullable()->after('league_id');
            $table->json('preferences')->nullable()->after('club_id'); // Configuraciones personales

            // Campos de auditoría
            $table->uuid('created_by')->nullable()->after('preferences');
            $table->uuid('updated_by')->nullable()->after('created_by');
            $table->uuid('deleted_by')->nullable()->after('updated_by');
            $table->timestamp('last_login_at')->nullable()->after('deleted_by');
            $table->ipAddress('last_login_ip')->nullable()->after('last_login_at');

            // Agregar soft deletes si no existe
            $table->softDeletes()->after('last_login_ip');

            // Índices para mejorar performance
            $table->index('document_number');
            $table->index('status');
            $table->index(['league_id', 'club_id']);
            $table->index('birth_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropSoftDeletes();
            $table->dropColumn([
                'document_type',
                'document_number',
                'first_name',
                'last_name',
                'birth_date',
                'gender',
                'phone',
                'phone_secondary',
                'address',
                'country_id',
                'department_id',
                'city_id',
                'status',
                'league_id',
                'club_id',
                'preferences',
                'created_by',
                'updated_by',
                'deleted_by',
                'last_login_at',
                'last_login_ip'
            ]);
        });
    }
};
