<?php
namespace Direct\Model;

/**
 * Class WeekDay
 *
 * @package Direct\Model
 */
class WeekDay
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
                'name' => 'Segunda'
            ],
            [
                'id'   => 2,
                'name' => 'Terça'
            ],
            [
                'id'   => 3,
                'name' => 'Quarta'
            ],
        ];

        return 0 === $id ? $array : array_filter($array, function($item) use ($id) { return $item['id'] == $id; });
    }
}