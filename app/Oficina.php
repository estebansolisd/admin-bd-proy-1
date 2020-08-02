<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Oficina extends Model
{
    protected $fillable = ["ciudad", "telefono", "calleNumero", "codigoPostal"];
    protected $table = "oficina";

    public function coches()
    {
        return $this->hasMany('App\Coche', 'idOficina', 'idOficina');
    }
}
