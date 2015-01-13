<?php
namespace Direct\Model;

/**
 * Class WeekDay
 *
 * @package Direct\Model
 */
class Advertiser
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
                'name' => 'Advertiser 1',
            ],
            [
                'id'   => 2,
                'name' => 'Advertiser 2',
            ],
            [
                'id'   => 3,
                'name' => 'Advertiser 3',
            ],
        ];

        return 0 === $id ? $array : array_filter($array, function($item) use ($id) { return $item['id'] == $id; });
    }
}