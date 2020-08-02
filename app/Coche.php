<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coche extends Model
{
    public $timestamps = false;
    protected $table = "coche";
    protected $primaryKey = "idCoche";
    protected $fillable = [
        "matricula",
        "grupo",
        "marca",
        "modelo",
        "puertas",
        "plazas",
        "maletero",
        "edadMinima",
        "idOficina"
    ];

    public function oficina()
    {
        return $this->belongsTo('App\Oficina', 'idOficina', 'idOficina');
    }
}
