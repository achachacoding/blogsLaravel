@extends('layout.master')

@section('judul')
Halaman Tambah Post   
@endsection

@push('styles')
 <!-- Ckeditor -->
	<script type="text/javascript" src="{{asset('template/ckeditor/style.js')}}"></script>
	<script type="text/javascript" src="{{asset('template/ckeditor/ckeditor.js')}}"></script>
@endpush

@section('content')

<form action="/post" method="POST" enctype="multipart/form-data">
@csrf
    <div class="box-body">

        <div class="form-group">
            <label>Judul</label>
            <input type="text" class="form-control" name="judul" placeholder="Isikan Nama Kategori">
        </div>
        @error('judul')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

        <div class="form-group">
            <label>Content Post</label>
            <textarea class="ckeditor" name="content"></textarea>
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
                    <option value="{{$item->id}}"> {{$item->nama}} </option>
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
        <button type="reset" class="btn btn-danger">Batal</button>
        <a href="/berita" class="btn btn-default">Kembali</a>
    </div>
</form>
@endsection