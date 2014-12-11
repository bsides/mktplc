<?php
namespace Direct\Model;

/**
 * Class Determination
 *
 * @package Direct\Model
 */
class Determination
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
                'name' => 'Capa'
            ],
            [
                'id'   => 2,
                'name' => 'Página Direita'
            ],
            [
                'id'   => 3,
                'name' => 'Anteverso da Folha de Capa Direita do Caderno de Imóveis de São José dos Campos'
            ],
        ];

        return 0 === $id ? $array : array_filter($array, function($item) use ($id) { return $item['id'] == $id; });
    }
}