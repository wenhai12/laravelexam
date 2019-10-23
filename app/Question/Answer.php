<?php

namespace App\Question;

use Illuminate\Database\Eloquent\Model;
use App\Project;
class Answer extends Model
{
    protected $fillable = [
        'title','answer','project_id'
    ];

    public function project(){
        return $this->belongsTo(Project::class);
    }

}
