<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Question\Select;
use App\Question\Blank;
use App\Question\Answer;

class Project extends Model
{
    protected $fillable=[
        'name'
    ];

    public function select(){
        return $this->hasMany(Select::class);
    }

    public function blank(){
        return $this->hasMany(Blank::class);
    }
    public function answer(){
        return $this->hasMany(Answer::class);
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function($project) {
            $project->select()->delete();
            $project->blank()->delete();
            $project->answer()->delete();

        });
    }
}
