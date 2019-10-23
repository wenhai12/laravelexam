<?php

namespace App\Admin\Controllers\Question;

use App\Question\Blank;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class BlankController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '填空题';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Blank);
        $grid->filter(function($filter) {

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            // 在这里添加字段过滤器
            $filter->like('title', '问题');
        });
        $grid->column('id', __('编号'));
        $grid->column('title', __('问题'));
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
        $show = new Show(Blank::findOrFail($id));

        $show->field('id', __('编号'));
        $show->field('title', __('问题'));
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
        $form = new Form(new Blank);

        $form->text('title', __('题目'));
        $form->text('answer', __('答案'));
        $form->number('project_id', __('所属科目'));

        return $form;
    }
}
