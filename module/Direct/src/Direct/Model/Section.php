<?php
namespace Direct\Model;

/**
 * Class Section
 *
 * @package Direct\Model
 */
class Section
{
    /**
     * @param $id
     *
     * @return array
     */
    public function get($id)
    {
        $id = (int) $id;

        $array = [
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

        return 0 === $id ? $array : array_filter($array, function($item) use ($id) { return $item['id'] == $id; });
    }
}