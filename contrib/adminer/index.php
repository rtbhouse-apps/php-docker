<?php
function adminer_object() {
    include_once "./plugins/plugin.php";
    include_once "./plugins/hide-schemas.php";

    return new AdminerPlugin([
        new HideSchemas([
          // 'information_schema',
          // 'pg_catalog',
          '/^pg_temp/',
          '/^pg_toast/',
          '/^pg_toast_temp/',
        ])
    ]);
}

include "./adminer.php";
