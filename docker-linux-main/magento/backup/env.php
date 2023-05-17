<?php
return [
    'backend' => [
        'frontName' => 'admin'
    ],
    'crypt' => [
        'key' => '115a06f5a4693b73f2892e2a01fee813'
    ],
    'db' => [
        'table_prefix' => '',
        'connection' => [
            'default' => [
                'host' => 'db_mee',
                'dbname' => 'mee',
                'username' => 'root',
                'password' => 'admin123',
                'active' => '1'
            ]
        ]
    ],
    'resource' => [
        'default_setup' => [
            'connection' => 'default'
        ]
    ],
    'x-frame-options' => 'SAMEORIGIN',
    'MAGE_MODE' => 'production',
    'session' => [
        'save' => 'files'
    ],
    'cache' => [
        'frontend' => [
            'default' => [
                'id_prefix' => 'ea4_'
            ],
            'page_cache' => [
                'id_prefix' => 'ea4_'
            ]
        ]
    ],
    'cache_types' => [
        'config' => 1,
        'layout' => 1,
        'block_html' => 1,
        'collections' => 1,
        'reflection' => 1,
        'db_ddl' => 1,
        'compiled_config' => 1,
        'eav' => 1,
        'customer_notification' => 1,
        'config_integration' => 1,
        'config_integration_api' => 1,
        'full_page' => 1,
        'config_webservice' => 1,
        'translate' => 1,
        'amasty_shopby' => 1,
        'vertex' => 1,
        'wp_gtm_categories' => 1
    ],
    'install' => [
        'date' => 'Fri, 27 Mar 2020 04:48:59 +0000'
    ],
    'downloadable_domains' => [
        'dev.local'
    ]
];
