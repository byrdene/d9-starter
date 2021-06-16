# Custom Install

This Custom Install allows us to quickly configure new Drupal projects
with our default installation settings and local development files.

## Installation Instructions

1. Move the provided files and directories into the project root:
    * `config/`
    * `scripts/`
    * `profiles/zaldomoh_profile/`
    * `modules/custom/`
    * `themes/custom/zaldomoh/`
    * `composer.json`
    * `README.md`
2. (Optional) If a web root other than `web/` is required (for example,
  Acquia uses `docroot/`), change all instances of `web` in `composer.json` to
  the web root desired.
3. Run `composer install` to install Drupal and its dependencies, and to set up
  the initial project state with our defaults.
    * During install `settings.php`, `settings.local.php`, `services.yml` and
      `local.services.yml` will be created in `sites/default` and patched to
      our default settings.
    * A `.gitignore` will be created in the project root.
4. Replace all instances of `zaldomoh` in
  `sites/default/settings.local.php` with the correct local values. These values
  need updating:
    * Trusted host patterns.
    * Database name, username, and password.
5. Rename the custom profile (the rename utility is required and can be downloaded with homebrew: `brew install rename`):
    * From the root directory run `scripts/custom-profile.sh zaldomoh NEWNAME`
6. Run the Drupal installer.
    * If installing on remote server, finish setting up remote repository:
    `git init`
    `git add .`
    `git commit -m "Initial Commit"`
    `git remote add origin https://github.com/byrdene/d9-sandbox.git`
    `git push --set-upstream origin master`
7. After install, you may need to remove or edit the database credentials the installer added to
  `sites/default/settings.php`. 
8. If necessary, add any host-specific settings to `sites/default/settings.php`.
9. Export the shared configuration (`drush cim`) and then import the local config split settings: `drush cim`  
10. Set up the project's custom theme (the rename utility is required and can be downloaded with homebrew: `brew install rename`):
    * From the root directory, run `scripts/custom-theme.sh zaldomoh NEWNAME`
    * Enable the new theme in the UI
    * cd into the the custom theme directory
    * Run `npm install` to set up gulp and generate starting dist/ files
    * Export the updated config: `drush cex`
      
## Updating Drupal Core

When updating Drupal, use the following Composer commands to update core and
scaffold files to their current versions, and core dependencies to the official
distribution versions: 
1. `composer update drupal/core "drupal/core-*" --with-all-dependencies`
2. Or if composer is low on memory, `COMPOSER_MEMORY_LIMIT=-1 composer update drupal/core "drupal/core-*" --with-all-dependencies` 


