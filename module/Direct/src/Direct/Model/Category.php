<?php
namespace Direct\Model;

/**
 * Class Category
 *
 * @package Direct\Model
 */
class Category
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

        return 0 === $id ? $array : array_filter($array, function($item) use ($id) { return $item['id'] == $id; });
    }
}