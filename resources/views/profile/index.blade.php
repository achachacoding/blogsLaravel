@extends('layout.master')

@section('judul')
Update Profile
@endsection

@section('content')

<form action="/profile/{{$detailProfile->id}}" method="POST">
@csrf
@method('PUT')
    <div class="box-body">

        <div class="form-group">
            <label>Nama User</label>
            <input type="text" class="form-control" value="{{$detailProfile->user->name}}" disabled>
        </div>
        <div class="form-group">
            <label>Email User</label>
            <input type="text" class="form-control" value="{{$detailProfile->user->email}}" disabled>
        </div>

        <div class="form-group">
            <label>Umur</label>
            <input type="number" class="form-control" name="umur" value="{{$detailProfile->umur}}" placeholder="Isikan Umur">
        </div>
        @error('umur')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

        <div class="form-group">
            <label>Alamat</label>
            <textarea name="address" class="form-control" cols="30" rows="10" >{{$detailProfile->address}}</textarea>
        </div>
        @error('address')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

        <div class="form-group">
            <label>Bio</label>
            <textarea name="bio" class="form-control" cols="30" rows="10" >{{$detailProfile->bio}}</textarea>
        </div>
        @error('bio')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror

    <div class="box-footer">
        <button type="submit" class="btn btn-primary">Simpan</button>
        <button type="reset" class="btn btn-danger">Batal</button>
        <a href="/profile" class="btn btn-default">Kembali</a>
    </div>
</form>
    
@endsection