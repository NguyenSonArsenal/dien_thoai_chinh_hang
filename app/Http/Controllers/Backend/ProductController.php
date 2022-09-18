<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Branch;
use App\Models\Category;
use App\Models\Product;
use Auth;

class ProductController extends Controller
{
    public function index()
    {
        $categories = Category::all();
        $branch = Branch::all();
        $list = Product::orderBy('id', 'desc');

        if (request('id')) {
            $list->where('id', request('id'));
        }

        if (request('hot')) {
            $list->where('hot', request('hot'));
        }

        if (request('category_id')) {
            $list->where('category_id', request('category_id'));
        }

        if (request('name')) {
            $list->where('name', 'like', '%' . request( 'name') . '%');
        }

        $list = $list->paginate(getConst('BE_PER_PAGE'));

        return view('backend.product.index', compact('list', 'categories', 'branch'));
    }

    public function create()
    {
        $category = Category::all();
        $branch = Branch::all();
        return view('backend.product.create', compact('category', 'branch'));
    }

    public function store()
    {
        $data = new Product();
        $params = request()->all();

        if (request()->hasFile('avatar')) {
            $fileName = time() . "_" . request()->file('avatar')->getClientOriginalName();
            $pathTmp = 'backend/upload/product';
            $uploadPath = public_path($pathTmp); // Folder upload path

            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }

            request()->file('avatar')->move($uploadPath, $fileName);
            $thumbnail = $pathTmp . '/' . $fileName;
            $params['avatar'] = $thumbnail;
        }

        $params['price_sell'] = arrayGet($params, 'price_origin') * (100 - arrayGet($params, 'sale')) / 100;

        $data->fill($params);
        $data->save();
        return redirect()->route('be.product.index')->with('notification_success', 'Thành công');
    }

    public function edit($id)
    {
        $data = Product::findOrFail($id);
        $category = Category::all();
        $branch = Branch::all();
        return view('backend.product.edit', compact('data', 'category', 'branch'));
    }

    public function update($id)
    {
        $data = Product::findOrFail($id);

        $params = request()->all();

        if (request()->hasFile('avatar')) {
            $fileName = time() . "_" . request()->file('avatar')->getClientOriginalName();
            $pathTmp = 'backend/upload/product';
            $uploadPath = public_path($pathTmp); // Folder upload path

            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }

            request()->file('avatar')->move($uploadPath, $fileName);
            $thumbnail = $pathTmp . '/' . $fileName;
            $params['avatar'] = $thumbnail;
        }

        $params['price_sell'] = arrayGet($params, 'price_origin') * (100 - arrayGet($params, 'sale')) / 100;
        $data->fill($params);
        $data->save();
        return redirect()->route('be.product.index')->with('notification_success', 'Thành công');
    }

    public function destroy($id)
    {
        $model = Product::findOrFail($id);
        $model->delete();
        return redirect()->back()->with('notification_success', 'Thành công');
    }
}
