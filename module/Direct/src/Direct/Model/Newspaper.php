<?php
namespace Direct\Model;

class Newspaper
{
    public function get()
    {
        return [
            [
                'id'   => 1,
                'name' => 'Jornal X'
            ],
            [
                'id'   => 2,
                'name' => 'Jornal Y'
            ],
            [
                'id'   => 3,
                'name' => 'Jornal W'
            ],
        ];
    }
}