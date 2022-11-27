<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Branch;
use App\Models\Category;
use Auth;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    public function index()
    {
        $list = Category::orderBy('id', 'desc');

        if (request('id')) {
            $list->where('id', request('id'));
        }

        if (request('name')) {
            $list->where('name', 'like', '%' . request('name') . '%');
        }

        $list = $list->paginate(getConst('BE_PER_PAGE'));

        return view('backend.category.index', compact('list'));
    }

    public function create()
    {
        return view('backend.category.create');
    }

    public function store()
    {
        $data = new Category();
        $params = request()->all();

        if (request()->hasFile('avatar')) {
            $fileName = time() . "_" . request()->file('avatar')->getClientOriginalName();
            $pathTmp = 'backend/upload/category';
            $uploadPath = public_path($pathTmp); // Folder upload path

            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }

            request()->file('avatar')->move($uploadPath, $fileName);
            $thumbnail = $pathTmp . '/' . $fileName;
            $params['avatar'] = $thumbnail;
        }

        $params['slug'] = Str::slug(request('name'));
        $data->fill($params);
        $data->save();
        return redirect()->route('be.category.index')->with('notification_success', 'Thành công');
    }

    public function edit($id)
    {
        $data = Category::findOrFail($id);
        return view('backend.category.edit', compact(['data']));
    }

    public function update($id)
    {
        $data = Category::findOrFail($id);
        $data->name = request('name');

        if (request()->hasFile('avatar')) {
            $fileName = time() . "_" . request()->file('avatar')->getClientOriginalName();
            $pathTmp = 'backend/upload/category';
            $uploadPath = public_path($pathTmp); // Folder upload path

            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }

            request()->file('avatar')->move($uploadPath, $fileName);
            $thumbnail = $pathTmp . '/' . $fileName;
        }

        $data->slug = Str::slug(request('name'));
        $data->avatar = !empty($thumbnail) ? $thumbnail : $data->avatar;
        $data->save();
        return redirect()->route('be.category.index')->with('notification_success', 'Thành công');
    }

    public function destroy($id)
    {
        $model = Category::findOrFail($id);
        $model->delete();
        return redirect()->back()->with('notification_success', 'Thành công');
    }
}
