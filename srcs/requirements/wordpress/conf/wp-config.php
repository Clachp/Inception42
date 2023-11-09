<?php
/**
* The base configurations of the WordPress.
*
* This file has the following configurations: MySQL settings, Table Prefix,
* Secret Keys, WordPress Language, and ABSPATH. You can find more information
* by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
* wp-config.php} Codex page. You can get the MySQL settings from your web host.
*
* This file is used by the wp-config.php creation script during the
* installation. You don’t have to use the web site, you can just copy this file
* to “wp-config.php” and fill in the values.
*
* @package WordPress
*/

// ** MySQL settings – You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', getenv('MYSQL_DATABASE'));

/** MySQL database username */
define('DB_USER', getenv('MYSQL_USER'));

/** MySQL database password */
define('DB_PASSWORD', getenv('MYSQL_PASSWORD'));

/** MySQL hostname */
define('DB_HOST', getenv('MYSQL_HOST'));

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don’t change this if in doubt. */
define('DB_COLLATE', ”);

/**#@+
* Authentication Unique Keys and Salts.
*
* Change these to different unique phrases!
* You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
* You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
*
* @since 2.6.0
*/
define('AUTH_KEY',         'W5w|/dTNqFo@(w6+Mw4|I/+Z>+->H}v;|sd=$#~J`wcT6++6]yL&O&O|//TnLI=n');
define('SECURE_AUTH_KEY',  'wadFtUD/cs(I{|+1@$:R4{o~>Y_Bu_>|fo-=d`MUv|GJ2NCp:vRs^9>-jU.$fr-5');
define('LOGGED_IN_KEY',    'fGM$R>W!{&B!fe>qLqWl_!915?^s3j E~q*gPmL|2MO$2d,)8;2?HMjsnGR)a/BT');
define('NONCE_KEY',        'R#3:iAeOg_`DXebz.6S})*xbru*;coVEKU03I0SbcI<PU| ZD#|}||LXX>EA`Z D');
define('AUTH_SALT',        'EJwZO=6J9loZ%Sy3isItxH>?*A/5cNG4P 6-;`eq&=R.|vv7tL6<JQ;aSn$3-$CG');
define('SECURE_AUTH_SALT', 'T{q+$EGUJ|vkUSS8ih:~EGzW(hU6o7fK|V!?Yg`Ai|u;-#99=@gxQ(1-%=8S+Lgv');
define('LOGGED_IN_SALT',   ';{30m/-ew$|>u nA5i0X(Q}; -2W||:?<,gXz(R /IU@ SBl^fQgD9,@WW{<-lTD');
define('NONCE_SALT',       'aAz-qfI038l=.I;eM$_hMs7-B#MN#uhg{U6#B+W?l^8?N%|yExSRb|Q%%aa21`-z');

/**#@-*/

/**
* WordPress Database Table prefix.
*
* You can have multiple installations in one database if you give each a unique
* prefix. Only numbers, letters, and underscores please!
*/
$table_prefix  = 'wp_';

/**
* WordPress Localized Language, defaults to English.
*
* Change this to localize WordPress. A corresponding MO file for the chosen
* language must be installed to wp-content/languages. For example, install
* de_DE.mo to wp-content/languages and set WPLANG to ‘de_DE’ to enable German
* language support.
*/
define('WPLANG', ”);

/**
* For developers: WordPress debugging mode.
*
* Change this to true to enable the display of notices during development.
* It is strongly recommended that plugin and theme developers use WP_DEBUG
* in their development environments.
*/
define('WP_DEBUG', false);

/* That’s all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
