<?php

namespace App\Http\Controllers;

use App\Coche;
use Illuminate\Http\Request;

class CocheController extends Controller
{
    public function saveCoches(Request $request)
    {
        return response()->json(
            [
                "data" => Coche::create($request->all()),
                "status" => 200
            ]
        );
    }

    public function updateCoches(Coche $coche, Request $request)
    {
        return response()->json(
            [
                "data" => $coche->update($request->all()),
                "status" => 200
            ]
        );
    }

    public function deleteCoches(Coche $coche)
    {
        return response()->json(
            [
                "data" => $coche->delete(),
                "status" => 200
            ]
        );
    }

    public function getCoches()
    {
        return response()->json([
            "data" => Coche::with("oficina")->get(),
            "status" => 200
        ]);
    }
}
