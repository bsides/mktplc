<?php
namespace Direct\Model;

/**
 * Class Color
 *
 * @package Direct\Model
 */
class Color
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
                'name' => 'Cromia'
            ],
            [
                'id'   => 2,
                'name' => 'Preto e Branco'
            ],
            [
                'id'   => 3,
                'name' => 'Rosa Choque'
            ],
        ];

        return 0 === $id ? $array : array_filter($array, function($item) use ($id) { return $item['id'] == $id; });
    }
}