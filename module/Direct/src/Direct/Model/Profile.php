<?php
namespace Direct\Model;

class Profile
{
    public function get()
    {
        return [
            [
                'id'   => 1,
                'name' => 'Homem'
            ],
            [
                'id'   => 2,
                'name' => 'Classe E'
            ],
            [
                'id'   => 3,
                'name' => 'Dono de Ferro Velho'
            ],
        ];
    }
}