@extends('layout.master')

@section('judul')
Halaman Detail Kategori   
@endsection

@section('content')

<h1>{{$kategori->nama}}</h1>
<p>{!! $kategori->deskripsi !!}</p>

<div class="row">
@forelse ($kategori->post as $item)
    <div class="col-4">
        <div class="card">
            <img src="{{asset('image/'.$item->thumbnail)}}" style="width:300px; height:200px; object-fit:contain;" class="card-img-top" alt="Card image cap">
            <div class="card-body">
            <h3>{{$item->judul}}</h3>
            <p class="card-text">{{ Str::limit(strip_tags($item->content), 50) }}</p>
            <a href="/post/{{$item->id}}" class="btn btn-secondary btn-block btn-sm">Read Me</a>
            </div>
        </div>
    </div>
@empty
    <h3>Kategori ini tidak ada postingan</h3>
@endforelse   
</div>


<a href="/kategori" class="btn btn-secondary btn-sm">Kembali</a>
    
@endsection