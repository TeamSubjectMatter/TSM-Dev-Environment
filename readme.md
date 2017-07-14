# WP Docker

This is a working prototype of using Docker with Wordpress.

Everything WordPress related lives in side `web/`. In there, you'll find WordPress core in the `wp/` directory, the `wp-config.php`, `index.php` and `wp-content/` directory.

The `docker-compose.yml` file composes MariaDB, PHP-FPM, and nginx containers for the local WordPress dev environment.
