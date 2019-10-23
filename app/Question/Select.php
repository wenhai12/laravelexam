<?php

namespace App\Question;

use Illuminate\Database\Eloquent\Model;
use App\Project;
class Select extends Model
{
    protected $fillable = [
        'title','optionA','optionB','optionC','optionD','answer','project_id'
    ];

    public function project(){
        return $this->belongsTo(Project::class);
    }
}
