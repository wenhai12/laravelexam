<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use Rap2hpoutre\FastExcel\FastExcel;
use App\User;
use Illuminate\Support\Facades\DB;

class ImportPost extends Action
{
    public $name = '导入数据';

    protected $selector = '.import-post';

    public function handle(Request $request)
    {

        DB::beginTransaction();
        try{
            $file = $request->file('file');
            $user =fastexcel()->import($file, function($line) {
                User::query()->create([
                    'name' => $line['name'],
                    'email' => $line['email'],
                    'password' => bcrypt($line['password']),
                ]);
            });

            DB::commit();
            return $this->response()->success('导入完成！')->refresh();

        }catch (\Exception $e ){
            DB::rollBack();
            return $this->response()->error('导入失败！')->refresh();
//            return $e->getmessage();

        }




    }

    public function form()
    {
        $this->file('file', '请选择文件');

    }

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-default import-post"><i class="fa fa-upload"></i>导入数据</a>
HTML;
    }
}
