<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Kategori;
use App\Models\Post;
use File;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct() 
    {
        $this->middleware('auth')->except(['index', 'show']);
    }


    public function index()
    {
        $post = Post::get();

        return view('post.index', ['post' => $post]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $kategori = Kategori::get();
        return view('post.create', ['kategori' => $kategori]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'judul' => 'required',
            'content' => 'required',
            'kategori_id' => 'required',
            'thumbnail' => 'required|image|mimes:jpg,png,jpeg'
        ]);

        $filename = time().'.'.$request->thumbnail->extension();

        $request->thumbnail->move(public_path('image'), $filename);

        $post = new Post();

        $post->judul = $request->judul;
        $post->content = $request->content;
        $post->kategori_id = $request->kategori_id;
        $post->thumbnail = $filename;

        $post->save();

        return redirect('/post');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::find($id);

        return view('post.detail', ['post' => $post]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $post = Post::find($id);
        $kategori = Kategori::get();

        return view('post.edit', ['post' => $post, 'kategori' => $kategori]);        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'judul' => 'required',
            'content' => 'required',
            'kategori_id' => 'required',
            'thumbnail' => 'image|mimes:jpg,png,jpeg'
        ]);

        $post = Post::find($id);
        
        if($request->has('thumbnail')){
            $path = 'image/';

           if (File::exists(public_path($path . $post->thumbnail))) {
              File::delete(public_path($path . $post->thumbnail));
           }

            $filename = time().'.'.$request->thumbnail->extension();

            $request->thumbnail->move(public_path('image'), $filename);

            $post->thumbnail = $filename;

            $post->save();
        }

            $post->judul = $request['judul'];
            $post->content = $request['content'];
            $post->kategori_id = $request['kategori_id'];
            
            $post->save();

            return redirect('/post');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::find($id);

        $path = 'image/';

        if (File::exists(public_path($path . $post->thumbnail))) {
            File::delete(public_path($path . $post->thumbnail));
        }

        $post->delete();

        return redirect('/post');
    }
}
