<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\BlogPostRequest;
use App\Http\Requests\Backend\TeacherRequest;
use App\Models\BlogCategory;
use App\Models\BlogPost;
use App\Models\Branch;
use App\Models\Certificate;
use App\Models\Degree;
use App\Models\Teacher;
use App\Models\TeacherCertificate;
use App\Models\User;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function index()
    {
        $list = User::orderBy('id', 'desc');

        if (request('id')) {
            $list->where('id', request('id'));
        }

        if (request('email')) {
            $list->where('email', request('email'));
        }

        $list = $list->paginate(getConst('BE_PER_PAGE'));


        return view('backend.user.index', compact('list'));
    }
}
