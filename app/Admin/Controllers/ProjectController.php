<?php

namespace App\Admin\Controllers;

use App\Project;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Question\Select;

use Encore\Admin\Widgets\Table;
class ProjectController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '科目';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Project);
       
        $grid->column('id', __('编号'));
        $grid->column('name', __('名称'));
        //可以显示所有选择题
        $grid->column('select', '选择题')->display(function ($select) {
                    $count = count($select);
                    return "<span class='label label-warning'>{$count}</span>";
                })->modal('试题', function ($model) {

                    $select = $model-> select()->get()->map(function ($select) {
                        return $select->only(['id', 'title', 'answer','created_at']);
                    });
                
                    return new Table(['ID', '内容','答案', '发布时间'], $select->toArray());
                });

    //   $grid->column('select', '选择题数')->display(function ($select) {
    //         $count = count($select);
    //         return "<span class='label label-warning'>{$count}</span>";
    //     });

        $grid->column('blank', '填空题数')->display(function ($blank) {
            $count = count($blank);
            return "<span class='label label-warning'>{$count}</span>";
        })->modal('试题', function ($model) {

            $blank = $model-> blank()->get()->map(function ($blank) {
                return $blank->only(['id', 'title', 'answer','created_at']);
            });
        
            return new Table(['ID', '内容','答案', '发布时间'], $blank->toArray());
        });



        $grid->column('answer', '简答题数')->display(function ($answer) {
            $count = count($answer);
            return "<span class='label label-warning'>{$count}</span>";
        })->modal('试题', function ($model) {

            $answer = $model-> answer()->get()->map(function ($answer) {
                return $answer->only(['id', 'title', 'answer','created_at']);
            });
        
            return new Table(['ID', '内容','答案', '发布时间'], $answer->toArray());
        });

        
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Project::findOrFail($id));
        $show->field('id', __('编号'));
        $show->field('name', __('名称'));
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('更新时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Project);

        $form->text('name', __('名称'));

        return $form;
    }



}
