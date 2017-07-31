#!/usr/bin/env bash

# Variables are stored globally like
# WEX_DRUPAL_7_SETTINGS_USERNAME,
# WEX_DRUPAL_7_SETTINGS_XXX, etc.
drupal7Settings() {
  php "${WEX_DIR_CURRENT}../../php/drupal7SettingsToBash.php" ${1}
}
