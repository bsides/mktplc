<?php
namespace Direct\Model;

class Category
{
    public function get()
    {
        return [
            [
                'id'   => 1,
                'name' => 'Esporte'
            ],
            [
                'id'   => 2,
                'name' => 'Carro'
            ],
            [
                'id'   => 3,
                'name' => 'Futebol'
            ],
        ];
    }
}