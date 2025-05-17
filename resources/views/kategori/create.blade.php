@extends('layout.master')

@section('judul')
Halaman Tambah Kategori    
@endsection

@push('styles')
 <!-- Ckeditor -->
	<script type="text/javascript" src="{{asset('template/ckeditor/style.js')}}"></script>
	<script type="text/javascript" src="{{asset('template/ckeditor/ckeditor.js')}}"></script>
@endpush

@section('content')

<form action="/kategori" method="POST">
@csrf
    <div class="box-body">

        <div class="form-group">
            <label>Nama Kategori</label>
            <input type="text" class="form-control" name="nama" placeholder="Isikan Nama Kategori">
        </div>
        @error('nama')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

        <div class="form-group">
            <label>Deskripsi</label>
            <textarea class="ckeditor" name="deskripsi"></textarea>
        </div>
        @error('deskripsi')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

    <div class="box-footer">
        <button type="submit" class="btn btn-primary">Simpan</button>
        <button type="reset" class="btn btn-danger">Batal</button>
        <a href="/kategori" class="btn btn-default">Kembali</a>
    </div>
</form>
@endsection