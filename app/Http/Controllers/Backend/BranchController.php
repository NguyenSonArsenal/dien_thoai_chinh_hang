<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Branch;
use Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class BranchController extends Controller
{
    public function index()
    {
        $list = Branch::orderBy('id', 'desc');

        if (request('id')) {
            $list->where('id', request('id'));
        }

        if (request('name')) {
            $list->where('name', 'like', '%' . request('name') . '%');
        }

        $list = $list->paginate(getConst('BE_PER_PAGE'));

        return view('backend.branch.index', compact('list'));
    }

    public function create()
    {
        return view('backend.branch.create');
    }

    public function store()
    {
        $data = new Branch();

        $params = request()->all();
        if (request()->hasFile('avatar')) {
            $fileName = time() . "_" . request()->file('avatar')->getClientOriginalName();
            $pathTmp = 'backend/upload/branch';
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
        DB::commit();
        return redirect()->route('be.branch.index')->with('notification_success', 'Thành công');
    }

    public function edit($id)
    {
        $data = Branch::findOrFail($id);
        return view('backend.branch.edit', compact(['data']));
    }

    public function update($id)
    {
        $data = Branch::findOrFail($id);

        if (request()->hasFile('avatar')) {
            $fileName = time() . "_" . request()->file('avatar')->getClientOriginalName();
            $pathTmp = 'backend/upload/branch';
            $uploadPath = public_path($pathTmp); // Folder upload path

            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }

            request()->file('avatar')->move($uploadPath, $fileName);
            $thumbnail = $pathTmp . '/' . $fileName;
        }

        $data->name = request('name');
        $data->slug = Str::slug(request('name'));
        $data->avatar = !empty($thumbnail) ? $thumbnail : $data->avatar;
        $data->save();
        return redirect()->route('be.branch.index')->with('notification_success', 'Thành công');
    }

    public function destroy($id)
    {
        $model = Branch::findOrFail($id);
        $model->delete();
        return redirect()->back()->with('notification_success', 'Thành công');
    }
}
