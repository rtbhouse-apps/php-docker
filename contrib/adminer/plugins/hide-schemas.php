<?php

class HideSchemas {
    protected $disabled;

    function __construct(array $disabled) {
        $this->disabled = $disabled;
    }

    function schemas() {
        return array_filter(schemas(), function($schema) {
          foreach ($this->disabled as $dis) {
            if (preg_match($dis, $schema)) {
              return false;
            }
          }
          return true;
        });
    }
}
