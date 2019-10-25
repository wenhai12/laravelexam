<?php

namespace App\Admin\Actions\Post;

use App\Question\Select;
use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use Rap2hpoutre\FastExcel\FastExcel;
use Encore\Admin\Exception\Handler;
class ImportSelect extends Action
{
    public $name = '导入数据';

    protected $selector = '.import-post';

    public function handle(Request $request)
    {



        // 下面的代码获取到上传的文件，然后使用`maatwebsite/excel`等包来处理上传你的文件，保存到数据库
        $file = $request->file('file');
//        $users = new FastExcel();
        $user =fastexcel()->import($file, function($line) {

            if (User::where('title', '=', $line['title'])->exists()) {
                return $this->response()->error('导入失败！')->refresh();
            }else {
                Select::query()->create([
                    'title' => $line['title'],
                    'optionA' => $line['optionA'],
                    'optionB' => $line['optionB'],
                    'optionC' => $line['optionC'],
                    'optionD' => $line['optionD'],
                    'answer' => $line['answer'],
                    'project_id' => $line['project_id'],
                ]);
            }
        });



        return $this->response()->success('导入完成！')->refresh();





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
