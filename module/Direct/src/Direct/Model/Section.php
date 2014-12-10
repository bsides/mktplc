<?php
namespace Direct\Model;

class Section
{
    public function get()
    {
        return [
            [
                'id'   => 1,
                'name' => 'Caderno de Esportes'
            ],
            [
                'id'   => 2,
                'name' => 'Caderno de Carro'
            ],
            [
                'id'   => 3,
                'name' => 'Caderno de Desenhar'
            ],
        ];
    }
}