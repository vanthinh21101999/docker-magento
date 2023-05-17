<?php
return [
    'price' => [
        'redis' => [
            'host' => 'redis_mmem',
            'port' => '6379'
        ]
    ],
    'backend' => [
        'frontName' => 'admin'
    ],
    'db' => [
        'connection' => [
            'indexer' => [
                'host' => 'db_mmem',
                'dbname' => 'mmem',
                'username' => 'root',
                'password' => 'admin123',
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;',
                'active' => '1',
                'persistent' => null
            ],
            'default' => [
                'host' => 'db_mmem',
                'dbname' => 'mmem',
                'username' => 'root',
                'password' => 'admin123',
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;',
                'active' => '1'
            ],
            'ads' => [
                'host' => 'db_mmem',
                'dbname' => 'ads',
                'username' => 'root',
                'password' => 'admin123',
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;',
                'active' => '1',
                'persistent' => null
            ]
        ],
        'table_prefix' => ''
    ],
    'system' => [
        'default' => [
            'smile_elasticsuite_core_base_settings' => [
                'es_client' => [
                    'servers' => 'es_mmem:9200',
                    'enable_https_mode' => 0,
                    'http_auth_user' => '',
                    'http_auth_pwd' => '',
                    'enable_http_auth' => false
                ]
            ]
        ]
    ],
    'crypt' => [
        'key' => '58b53ba2ed8e2f5086eaa02e0d788da4'
    ],
    'resource' => [
        'default_setup' => [
            'connection' => 'default'
        ],
        'ads_setup' => [
            'connection' => 'ads'
        ]
    ],
    'x-frame-options' => '*',
    'MAGE_MODE' => 'developer',
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
        'target_rule' => 1,
        'google_product' => 1,
        'full_page' => 1,
        'config_webservice' => 1,
        'translate' => 1
    ],
    'downloadable_domains' => [
        'dev.local'
    ],
    'install' => [
        'date' => 'Tue, 23 Jun 2020 05:23:09 +0000'
    ]
];
