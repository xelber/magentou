#!/bin/bash
mysqlDatabase=magento1
mysqlUser=root
mysqlPassword=123123q
localHost=magento1.loc

mysql -u$mysqlUser -p$mysqlPassword -e "drop database if exists $mysqlDatabase; crea te database $mysqlDatabase;"

rm -rf app/etc/local.xml var/cache var/full_page_cache

php -f install.php -- \
    --license_agreement_accepted "yes" \
    --locale "en_US" \
    --timezone "America/Phoenix" \
    --default_currency "USD" \
    --db_host "127.0.0.1" \
    --db_name "$mysqlDatabase" \
    --db_user "$mysqlUser" \
    --db_pass "$mysqlPassword" \
    --url "$localHost" \
    --use_rewrites "yes" \
    --use_secure "no" \
    --secure_base_url "" \
    --skip_url_validation "yes" \
    --use_secure_admin "no" \
    --admin_firstname "test" \
    --admin_lastname "test" \
    --admin_email "test@test.com" \
    --admin_username "admin" \
    --admin_password "123123q"
