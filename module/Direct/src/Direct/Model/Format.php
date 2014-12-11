<?php
namespace Direct\Model;

/**
 * Class Format
 *
 * @package Direct\Model
 */
class Format
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
                'name' => 'Página Dupla'
            ],
            [
                'id'   => 2,
                'name' => 'Meia Página'
            ],
            [
                'id'   => 3,
                'name' => 'Sete Quartos de Página'
            ],
        ];

        return 0 === $id ? $array : array_filter($array, function($item) use ($id) { return $item['id'] == $id; });

    }
}