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
        Schema::table('activity_log', function (Blueprint $table) {
            // Modificar las columnas morfológicas para soportar UUIDs
            $table->string('subject_id', 36)->nullable()->change();
            $table->string('causer_id', 36)->nullable()->change();

            // Agregar campos adicionales que necesitamos para VolleyPass
            $table->ipAddress('ip_address')->nullable()->after('batch_uuid');
            $table->text('user_agent')->nullable()->after('ip_address');
            $table->string('url', 1000)->nullable()->after('user_agent');
            $table->string('method', 10)->nullable()->after('url');
            $table->json('meta')->nullable()->after('method');

            // Agregar índices para mejor performance
            $table->index('event');
            $table->index('batch_uuid');
            $table->index('created_at');
            $table->index(['subject_type', 'subject_id']);
            $table->index(['causer_type', 'causer_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('activity_log', function (Blueprint $table) {
            // Revertir cambios de columnas
            $table->unsignedBigInteger('subject_id')->nullable()->change();
            $table->unsignedBigInteger('causer_id')->nullable()->change();

            // Eliminar columnas agregadas
            $table->dropColumn([
                'event',
                'batch_uuid',
                'ip_address',
                'user_agent',
                'url',
                'method',
                'meta'
            ]);

            // Eliminar índices
            $table->dropIndex(['event']);
            $table->dropIndex(['batch_uuid']);
            $table->dropIndex(['created_at']);
            $table->dropIndex(['subject_type', 'subject_id']);
            $table->dropIndex(['causer_type', 'causer_id']);
        });
    }
};
