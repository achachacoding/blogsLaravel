@extends('layout.master')

@section('judul')
Halaman Detail Post
@endsection

@section('content')

    <img src="{{asset('image/'.$post->thumbnail)}}" style="width:300px; height:200px; object-fit:contain;" class="card-img-top" alt="Card image cap">

    <h3>{{$post->judul}}</h3>
    <p class="card-text">{!!$post->content!!}</p>

    <hr>
        <h4>List Komentar</h4>
        @forelse ($post->komentar as $item)
            <div class="media my-3 border p-3">
                <img src="https://dummyimage.com/300/09f.png/fff" class="mr-3" style="border-radius: 50%" width="200px">
                <div class="media-body">
                    <h3 class="mt-0 text-primary">{{$item->user->name}}</h3>
                    <p>{{$item->content}}</p>
                </div>
            </div>
        @empty
            <h4>Belum ada komentar</h4>
        @endforelse
    <hr>

    <form action="/komentar/{{$post->id}}" method="post">
        @csrf
        <textarea name="content" cols="30" class="form-control my-3" placeholder="isi komentar" rows="10"></textarea>
        @error('content')
            <div class="alert alert-danger">
                {{$message}}
            </div>
        @enderror
        <input type="submit" value="komentar">
    </form>

    <hr>
    <a href="/post" class="btn btn-secondary btn-block btn-sm">Kembali</a>

  
@endsection