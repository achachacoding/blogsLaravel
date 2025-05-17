@extends('layout.master')

@section('judul')
Halaman List Post
@endsection

@section('content')

@auth
<a href="/post/create" class="btn btn-primary btn-sm mb-4">Tambah</a> 
@endauth

<div class="row">

    @forelse ($post as $item)
        <div class="col-4">
            <div class="card">
            <img src="{{asset('image/'.$item->thumbnail)}}" style="width:300px; height:200px; object-fit:contain;" class="card-img-top" alt="Card image cap">
            <div class="card-body">
            <h3>{{$item->judul}}</h3>
            <span class="badge badge-info">{{$item->kategori->nama}}</span>
            <p class="card-text">{{ Str::limit(strip_tags($item->content), 50) }}</p>
            <a href="/post/{{$item->id}}" class="btn btn-secondary btn-block btn-sm">Read Me</a>

            @auth
            <div class="row my-2">
                <div class="col">
                    <a href="/post/{{$item->id}}/edit" class="btn btn-warning btn-block btn-sm">Edit</a>
                </div>
                <div class="col">
                    <form action="/post/{{$item->id}}" method="POST">
                    @csrf
                    @method('delete')
                    <input type="submit" value="Delete" class="btn btn-danger btn-block btn-sm">
                    </form>
                </div>
            </div>
            @endauth
            
            </div>
        </div>
        
</div>    
    @empty
        <h2>Tidak ada postingan</h2>
    @endforelse

</div>

@endsection 