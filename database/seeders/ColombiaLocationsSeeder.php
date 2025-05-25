<?php

// =======================
// SEEDER PRINCIPAL
// =======================

// database/seeders/ColombiaLocationsSeeder.php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Country;
use App\Models\Department;
use App\Models\City;
use Exception;

class ColombiaLocationsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->command->info('🇨🇴 Iniciando importación de ubicaciones de Colombia...');

        // Verificar que los modelos existan
        if (!class_exists(Country::class)) {
            $this->command->error('❌ Modelo Country no encontrado. Ejecuta: php artisan make:model Country -m');
            return;
        }

        if (!class_exists(Department::class)) {
            $this->command->error('❌ Modelo Department no encontrado. Ejecuta: php artisan make:model Department -m');
            return;
        }

        if (!class_exists(City::class)) {
            $this->command->error('❌ Modelo City no encontrado. Ejecuta: php artisan make:model City -m');
            return;
        }

        DB::beginTransaction();

        try {
            // 1. Crear o encontrar el país Colombia
            $colombia = $this->createColombia();
            $this->command->info("✅ País Colombia creado/encontrado: {$colombia->name}");

            // 2. Leer y procesar el CSV
            $csvPath = database_path('data/data_colombia.csv');

            if (!file_exists($csvPath)) {
                throw new Exception("❌ No se encontró el archivo CSV en: {$csvPath}");
            }

            $csvData = $this->readCsvFile($csvPath);
            $this->command->info("📊 Registros encontrados en CSV: " . count($csvData));

            // 3. Procesar departamentos y municipios
            $this->processLocations($colombia, $csvData);

            DB::commit();

            $this->command->info('🎉 ¡Importación completada exitosamente!');
            $this->showStatistics();

        } catch (Exception $e) {
            DB::rollBack();
            $this->command->error("❌ Error durante la importación: " . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Crear o encontrar el país Colombia
     */
    private function createColombia(): Country
    {
        return Country::firstOrCreate(
            ['code' => 'CO'],
            [
                'name' => 'Colombia',
                'phone_code' => '+57',
                'currency_code' => 'COP',
                'is_active' => true,
            ]
        );
    }

    /**
     * Leer archivo CSV
     */
    private function readCsvFile(string $filePath): array
    {
        $data = [];
        $file = fopen($filePath, 'r');

        if (!$file) {
            throw new \Exception("No se pudo abrir el archivo CSV");
        }

        // Leer cabecera (primera línea)
        $header = fgetcsv($file);
        $this->command->info("📋 Cabeceras del CSV: " . implode(', ', $header));

        // Leer datos
        $lineNumber = 1;
        while (($row = fgetcsv($file)) !== FALSE) {
            $lineNumber++;

            // Validar que la fila tenga 4 columnas
            if (count($row) !== 4) {
                $this->command->warn("⚠️ Línea {$lineNumber}: Formato incorrecto, se omite");
                continue;
            }

            $data[] = [
                'cod_departamento' => trim($row[0]),
                'cod_municipio' => trim($row[1]),
                'nombre_departamento' => trim($row[2]),
                'nombre_municipio' => trim($row[3]),
                'line_number' => $lineNumber
            ];
        }

        fclose($file);
        return $data;
    }

    /**
     * Procesar ubicaciones del CSV
     */
    private function processLocations(Country $colombia, array $csvData): void
    {
        $departments = [];
        $departmentProgress = 0;
        $cityProgress = 0;
        $errors = [];

        $this->command->info('📍 Procesando departamentos y municipios...');

        // Crear barra de progreso
        $bar = $this->command->getOutput()->createProgressBar(count($csvData));
        $bar->start();

        foreach ($csvData as $row) {
            try {
                // Procesar departamento
                $departmentKey = $row['cod_departamento'];

                if (!isset($departments[$departmentKey])) {
                    $department = Department::firstOrCreate(
                        [
                            'country_id' => $colombia->id,
                            'code' => $departmentKey
                        ],
                        [
                            'name' => $row['nombre_departamento'],
                            'is_active' => true,
                        ]
                    );

                    $departments[$departmentKey] = $department;

                    if ($department->wasRecentlyCreated) {
                        $departmentProgress++;
                    }
                }

                // Procesar municipio/ciudad
                $city = City::firstOrCreate(
                    [
                        'department_id' => $departments[$departmentKey]->id,
                        'code' => $row['cod_municipio']
                    ],
                    [
                        'name' => $row['nombre_municipio'],
                        'is_active' => true,
                    ]
                );

                if ($city->wasRecentlyCreated) {
                    $cityProgress++;
                }

            } catch (\Exception $e) {
                $errors[] = [
                    'line' => $row['line_number'],
                    'data' => $row,
                    'error' => $e->getMessage()
                ];
            }

            $bar->advance();
        }

        $bar->finish();
        $this->command->newLine();

        // Mostrar resumen
        $this->command->info("✅ Departamentos creados: {$departmentProgress}");
        $this->command->info("✅ Municipios creados: {$cityProgress}");

        if (!empty($errors)) {
            $this->command->warn("⚠️ Errores encontrados: " . count($errors));
            foreach (array_slice($errors, 0, 5) as $error) {
                $this->command->error("Línea {$error['line']}: {$error['error']}");
            }
        }
    }

    /**
     * Mostrar estadísticas finales
     */
    private function showStatistics(): void
    {
        $this->command->newLine();
        $this->command->info('📊 ESTADÍSTICAS FINALES:');
        $this->command->table(
            ['Modelo', 'Total de Registros'],
            [
                ['Países', Country::count()],
                ['Departamentos', Department::count()],
                ['Ciudades', City::count()],
            ]
        );

        // Mostrar algunos ejemplos
        $this->command->info('🔍 EJEMPLOS DE DATOS CREADOS:');

        $departments = Department::with('country')->limit(3)->get();
        foreach ($departments as $dept) {
            $citiesCount = $dept->cities()->count();
            $this->command->line("  📍 {$dept->name} ({$dept->code}) - {$citiesCount} municipios");
        }
    }
}
