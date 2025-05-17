@extends('layout.master')

@section('judul')
Halaman Edit Post   
@endsection

@push('styles')
 <!-- Ckeditor -->
	<script type="text/javascript" src="{{asset('template/ckeditor/style.js')}}"></script>
	<script type="text/javascript" src="{{asset('template/ckeditor/ckeditor.js')}}"></script>
@endpush

@section('content')

<form action="/post/{{$post->id}}" method="POST" enctype="multipart/form-data">
@csrf
@method('PUT')
    <div class="box-body">

        <div class="form-group">
            <label>Judul</label>
            <input type="text" class="form-control" name="judul" value="{{$post->judul}}" placeholder="Isikan Nama Kategori">
        </div>
        @error('judul')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

        <div class="form-group">
            <label>Content Post</label>
            <textarea class="ckeditor" name="content">{{$post->content}}</textarea>
        </div>
        @error('content')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

        <div class="form-group">
            <label>Thumbnail</label>
            <input type="file" class="form-control" name="thumbnail" accept="image/*">
        </div>
        @error('thumbnail')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

        <div class="form-group">
            <label>Kategori</label>
            <select name="kategori_id" class="form-control" id="">
                    <option value="">-- Pilih Kategori --</option>
                @forelse ($kategori as $item)
                @if ($item->id === $post->kategori_id)
                    <option value="{{$item->id}}" selected> {{$item->nama}} </option>
                @else
                    <option value="{{$item->id}}"> {{$item->nama}} </option>
                @endif
                @empty
                    <option value="">Tidak Ada Data Kategori</option>
                @endforelse
            </select>
        </div>
        @error('kategori_id')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

    <div class="box-footer">
        <button type="submit" class="btn btn-primary">Simpan</button>
        <a href="/post" class="btn btn-default">Batal</a>
    </div>
</form>
@endsection