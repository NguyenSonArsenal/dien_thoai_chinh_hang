<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminTableSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::table('admin')->truncate();
        $admin = [
            'username' => 'Admin',
            'email' => 'admin@gmail.com',
            'password' => bcrypt('123456'),
        ];
        DB::table('admin')->insert($admin);
    }
}
