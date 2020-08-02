<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class OficinaSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('oficina')->insert(
            [
                [
                    "ciudad" => "Liberia",
                    "telefono" => "26658989",
                    "calleNumero" => "3",
                    "codigoPostal" => 50101,
                ],
                [
                    "ciudad" => "Liberia",
                    "telefono" => "26657575",
                    "calleNumero" => "4",
                    "codigoPostal" => 50101,
                ],
                [
                    "ciudad" => "San Jose",
                    "telefono" => "29986566",
                    "calleNumero" => "5",
                    "codigoPostal" => 124212,
                ],
            ]
        );
    }
}
