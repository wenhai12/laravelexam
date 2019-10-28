<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use Rap2hpoutre\FastExcel\FastExcel;
use App\User;
use Encore\Admin\Grid;
use Illuminate\Support\Facades\DB;
class ImportPost extends Action
{
    public $name = '导入数据';

    protected $selector = '.import-post';

    public function handle(Request $request)
    {

        // 下面的代码获取到上传的文件，然后使用`maatwebsite/excel`等包来处理上传你的文件，保存到数据库
        DB::beginTransaction();
            try{
        $file = $request->file('file');
        $users = new FastExcel();
        $user =$users->configureCsv(';', '#', '\n', 'gbk')->import($file, function($line) {
                User::query()->create([
                    'name' => $line['name'],
                    'email' => $line['email'],
                    'password' => $line['password'],
                ]);
            DB::commit();
            return $this->response()->success('导入完成！')->refresh();

        });
        }catch (\Exception $e){
            DB::rollBack();
                return $e->getmessage();

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
