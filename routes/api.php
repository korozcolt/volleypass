<?php

use App\Http\Controllers\Api\QrVerificationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::prefix('qr')->group(function () {
    // Verificación principal
    Route::post('/verify', [QrVerificationController::class, 'verify'])
        ->middleware(['throttle:verification'])
        ->name('api.verify-qr');

    // Información del carnet (solo datos públicos)
    Route::get('/info/{qr_code}', [QrVerificationController::class, 'getCardInfo'])
        ->middleware(['throttle:info'])
        ->name('api.qr-info');

    // Batch verification para múltiples carnets
    Route::post('/verify-batch', [QrVerificationController::class, 'verifyBatch'])
        ->middleware(['throttle:batch'])
        ->name('api.verify-batch');

    // Estadísticas para verificadores autenticados
    Route::get('/stats', [QrVerificationController::class, 'getStats'])
        ->middleware(['auth:sanctum'])
        ->name('api.qr-stats');
});
