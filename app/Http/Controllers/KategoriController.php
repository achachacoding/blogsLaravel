<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Kategori;

class KategoriController extends Controller
{
    public function create()
    {
        return view('kategori.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required',
            'deskripsi' => 'required'
        ]);

        try {

        DB::table('kategori')->insert([
            'nama' => $request->nama,
            'deskripsi' => $request->deskripsi
        ]);

        // Jika berhasil
        return redirect('/kategori')->with('success', 'Data berhasil disimpan!');
        } catch (\Exception $e) {
        // Jika gagal
        return redirect('/kategori')->with('error', 'Gagal menyimpan data: ' . $e->getMessage());
    }

    }

    public function index() 
    {
       $kategori = DB::table('kategori')->get();
       //dd($kategori);

       return view('kategori.index', ['kategori' => $kategori]);
    }

    public function show($id)
    {
        $kategori = Kategori::find($id);

        return view('kategori.detail', ['kategori' => $kategori]);
    }

    public function edit($id)
    {
        $kategori = DB::table('kategori')->where('id', $id)->first();

        return view('kategori.edit', ['kategori' => $kategori]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nama' => 'required',
            'deskripsi' => 'required'
        ]); 

        try {

        DB::table('kategori')
            ->where('id', $id)
            ->update([
                'nama' => $request->nama,
                'deskripsi' => $request->deskripsi   
            ]);

        // Jika berhasil
        return redirect('/kategori')->with('success', 'Data berhasil diedit!');
        } catch (\Exception $e) {
        // Jika gagal
        return redirect('/kategori')->with('error', 'Gagal mengedit data: ' . $e->getMessage());
        }
    }

    public function destroy($id)
    {
        try {

        DB::table('kategori')->where('id', $id)->delete();

        // Jika berhasil
        return redirect('/kategori')->with('success', 'Data berhasil dihapus!');
        } catch (\Exception $e) {
        // Jika gagal
        return redirect('/kategori')->with('error', 'Gagal menghapus data: ' . $e->getMessage());
        }
    }
}