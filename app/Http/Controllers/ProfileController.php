<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Profile;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function index() 
    {
        $iduser = Auth::id();

        $detailProfile = Profile::where('user_id', $iduser)->first();

        return view ('profile.index', ['detailProfile' => $detailProfile]);
    }

    public function update(Request $request, $id)

    {
        $request->validate([
            'umur' => 'required',
            'address' => 'required',
            'bio' => 'required',
        ]);

        $profile = Profile::find($id);
        
        $profile->umur = $request->umur;
        $profile->address = $request->address;
        $profile->bio = $request->bio;

        $profile->save();

        return redirect('/profile');
    }
}
