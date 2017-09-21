# WP Docker

This is a working prototype of using Docker with Wordpress.

Everything WordPress related lives in side `web/`. In there, you'll find WordPress core in the `wp/` directory, the `wp-config.php`, `index.php` and `wp-content/` directory.

The `docker-compose.yml` file composes MariaDB, PHP-FPM, and nginx containers for the local WordPress dev environment.

## Setup

This environment is specifically target to work with Pantheon. To create a new site using this environment as a template, please use the [TSM CLI](https://github.com/TeamSubjectMatter/tsm-cli).
After running the CLI, you'll need to run the setup and install scripts. You'll also need to create a site on Pantheon following the below instructions:

1. Create a Migration
Rather than create a new site from scratch, we're going to create a migration. Go to the dashboard and click the yellow "Migrate Existing Site" button. This will take you to a 3 part form. For
the first part, input any site URL and then select WordPress as the CMS.

For the second part, input the name of the site from the `project.json` file created by the TSM-CLI.

For the third step, click the link at the bottom of the page to manually migrate your site. A modal will pop up asking if you're sure you want to migrate the site manually, click 'Yes'.

This will take you to the dashboard page for the site you just created. Change the connection mode from SFTP to GIT. Then copy the git connection url (the url without 'git clone' at the
beginning).

The last step is to add the git connection url to the `package.json` file as the `git` key. Verify that the `dev_url` in your `package.json` is correct. Then run the setup script:

```
  sh bin/scripts/setup.sh
```

# Composer

When adding plugins/packages to composer, in order to avoid conflicts, add a single comma with some whitespace and add plugins/packages below. For example:

```
"require": {
    "composer/installers": "*",
    "pantheon-systems/wordpress": "4.8.2",

    "wpackagist-plugin/pantheon-advanced-page-cache": "*",
    "wpackagist-plugin/pantheon-hud": "*",
    "wpackagist-plugin/wp-native-php-sessions": "*",

    "wpackagist-plugin/limit-login-attempts": "*",
    "wpackagist-plugin/sucuri-scanner": "*",
    "wpackagist-plugin/wp-cfm": "*",
    "wpackagist-plugin/wp-migrate-db": "*",
    "wpackagist-plugin/wp-redis": "*"

  },
```

...becomes...

```
"require": {
    "composer/installers": "*",
    "pantheon-systems/wordpress": "4.8.2",

    "wpackagist-plugin/pantheon-advanced-page-cache": "*",
    "wpackagist-plugin/pantheon-hud": "*",
    "wpackagist-plugin/wp-native-php-sessions": "*",

    "wpackagist-plugin/limit-login-attempts": "*",
    "wpackagist-plugin/sucuri-scanner": "*",
    "wpackagist-plugin/wp-cfm": "*",
    "wpackagist-plugin/wp-migrate-db": "*",
    "wpackagist-plugin/wp-redis": "*"
    ,

    "wpackagist-plugin/black-studio-tinymce-widget": "*",
    "wpackagist-plugin/contact-form-7": "*",
    "wpackagist-plugin/flamingo": "*",
    "wpackagist-plugin/ninja-forms": "*",
    "wpackagist-plugin/regenerate-thumbnails": "*",
    "wpackagist-plugin/shortcode-redirect": "*",
    "wpackagist-plugin/simple-page-ordering": "*",
    "wpackagist-plugin/wordpress-seo": "*"
  },
```