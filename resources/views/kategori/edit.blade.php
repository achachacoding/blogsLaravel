@extends('layout.master')

@section('judul')
Halaman Edit Kategori    
@endsection

@push('styles')
 <!-- Ckeditor -->
	<script type="text/javascript" src="{{asset('template/ckeditor/style.js')}}"></script>
	<script type="text/javascript" src="{{asset('template/ckeditor/ckeditor.js')}}"></script>
@endpush

@push('scripts')
<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1')
    //bootstrap WYSIHTML5 - text editor
    $('.textarea').wysihtml5()
  })
</script>  
@endpush

@section('content')

<form action="/kategori/{{$kategori->id}}" method="POST">
@csrf
@method('PUT')
    <div class="box-body">

        <div class="form-group">
            <label>Nama Kategori</label>
            <input type="text" class="form-control" name="nama" value="{{$kategori->nama}}" placeholder="Isikan Nama Kategori">
        </div>
        @error('nama')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

        <div class="form-group">
            <label>Deskripsi</label>
            <textarea class="ckeditor" name="deskripsi">{{$kategori->deskripsi}}</textarea>
        </div>
        @error('deskripsi')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

    <div class="box-footer">
        <button type="submit" class="btn btn-primary">Simpan</button>
        <a href="/kategori" class="btn btn-default">Batal</a>
    </div>
</form>
@endsection