<?php

namespace App\Http\Controllers;
use App\Models\Komentar;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class KomentarController extends Controller
{
    public function tambah(Request $request, $id)
    {
         $request->validate([
            'content' => 'required'
        ]);

        $iduser = Auth::id();

        $komentar = new Komentar();

        $komentar->user_id = $iduser;
        $komentar->content = $request->content;
        $komentar->post_id = $id;

        $komentar->save();

        return redirect('/post/'. $id);
    }
}
