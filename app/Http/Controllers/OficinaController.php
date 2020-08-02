<?php

namespace App\Http\Controllers;
use App\Oficina;

class OficinaController extends Controller
{
    public function getOficinas()
    {
        return response()->json(
            [
                "data" => Oficina::all(),
                "status" => 200
            ]
        );
    }
}
