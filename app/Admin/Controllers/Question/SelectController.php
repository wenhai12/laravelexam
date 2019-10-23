<?php

namespace App\Admin\Controllers\Question;

use App\Question\Select;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Project;
class SelectController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '选择题';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Select);
        $grid->filter(function($filter) {

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            // 在这里添加字段过滤器
            $filter->like('title', '问题');
        });



        $grid->column('id', __('编号'));
        $grid->column('title', __('问题'));
        $grid->column('optionA', __('选项A'));
        $grid->column('optionB', __('选项B'));
        $grid->column('optionC', __('选项C'));
        $grid->column('optionD', __('选项D'));
        $grid->column('answer', __('答案'));
        $grid->column('project.name',__('所属科目'));
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
        $show = new Show(Select::findOrFail($id));
        $show->project('科目',function ($project){
            $project->resource('/App/Project');
            $project->id();
            $project->name();
            $project->filter(function ($filter) {
                $filter->like('name');
            });
        });
        $show->field('id', __('编号'));
        $show->field('title', __('问题'));
        $show->field('optionA', __('选项A'));
        $show->field('optionB', __('选项B'));
        $show->field('optionC', __('选项C'));
        $show->field('optionD', __('选项D'));
        $show->field('answer', __('答案'));
        $show->field('project_id', __('所属科目'));
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
        $form = new Form(new Select);

        $form->text('title', __('问题'));
        $form->text('optionA', __('选项A'));
        $form->text('optionB', __('选项B'));
        $form->text('optionC', __('选项C'));
        $form->text('optionD', __('选项D'));
        $form->text('answer', __('答案'));
        $form->number('project_id', __('所属科目'));

        return $form;
    }
}
