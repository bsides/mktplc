<?php
namespace Direct\Model;

/**
 * Class Profile
 *
 * @package Direct\Model
 */
class Profile
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

        return 0 === $id ? $array : array_filter($array, function($item) use ($id) { return $item['id'] == $id; });
    }
}