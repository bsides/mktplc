<?php
namespace Direct\Model;

/**
 * Class Newspaper
 *
 * @package Direct\Model
 */
class Newspaper
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

        return 0 === $id ? $array : array_filter($array, function($item) use ($id) { return $item['id'] == $id; });
    }
}