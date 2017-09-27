# Subject Matter Dev Environment

This is the base development environment for all WordPress projects at Subject Matter. It is based on Docker (and [docker-compose](https://docs.docker.com/compose/)) and specifically targeted at working with [Pantheon](https://pantheon.io/).

## Setup

*Before you start:*
Make sure you have [docker-compose](https:docs.docker.com/compose/) installed and set up.

*Creating a new project:*
The easiest way to start a net-new project using this dev environment is with the [TSM CLI](https://www.npmjs.com/package/@subjectmatter/tsm-cli). After you generate a new project, run `composer install` to install your dependencies and set up your project.

*Configuring a deployment:*
Deployments to Pantheon are best done through SFTP to a multi-dev branch. Once you create a new project on Pantheon, create a new Multidev Environment called `int-dev` (this is the branch you'll deploy to). Create a new repository in Beanstalk if you haven't already and push everything to a `develop` branch.

Under the Deployments tab on Beanstalk, create a new deployment. You want to configure your new deployment to automatically deploy the develop branch to your `int-dev` multidev environment on Pantheon. Make sure the Connection Mode in Pantheon is set to SFTP and use the SFTP connection info to configure you're deployment.

You *do not* want to deploy the entire repository to pantheon, so set the path in repository under General Settings to be `/web/wp-conten`. Under Deployment Location, you want to set the remote path to be `~/code/wp-content`. Download the environment SSH key from Beanstalk and upload it to Pantheon on the SFTP Connection Info panel. Finally, make sure you're excluding the uploads and upgrades directory in your Beanstalk deployment configuration.

## Navigating
This environment is designed for ease-of-use during local development. For that reason, WordPress is broken up to make it easier to navigate and work with.

When building out a new site, everything you'll care about is under the `web/` directory. You shouldn't have to configure the `wp-config.php` file or touch the `index.php` file. If you do make any changes to `wp-config`, make sure those changes are reflected in the `docker-compose.yml` file in the WordPress and MariaDB image environment variables.

Your WordPress install can be found under `wp/`. Composer will install the latest version of WordPress here and you should never have to change or configure anything within that directory.

All your work will be under `web/wp-content`. This is where your theme and plugins (custom and third-party) will live.

## Usage

*Starting Development:*
To start working on a project - new or old - just run `docker-compose up`. This will start your container network on localhost:8080. If you prefer to have your network running in the background, run `docker-compose up -d`.

If this is a new project, then the first time you run it, you'll need to go through the WordPress 5-minute Install, configure WP Migrate DB Pro and then pull the production or staging database locally.

*Composer:*

When adding plugins/packages to composer, in order to avoid conflicts in git, add a single comma with some whitespace and add plugins/packages below. For example:

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
