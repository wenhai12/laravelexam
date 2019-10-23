<?php

namespace App\Admin\Controllers;

use App\Project;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

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
        $grid->column('select', '选择题数')->display(function ($select) {
            $count = count($select);
            return "<span class='label label-warning'>{$count}</span>";
        });
        $grid->column('blank', '填空题数')->display(function ($blank) {
            $count = count($blank);
            return "<span class='label label-warning'>{$count}</span>";
        });
        $grid->column('answer', '简答题数')->display(function ($answer) {
            $count = count($answer);
            return "<span class='label label-warning'>{$count}</span>";
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
