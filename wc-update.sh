#!/usr/bin/env bash
# update WooCommerce database for multisite
# Handle WooCommerce database updates on multisite if installed
if $( wp core is-installed --network ); then 
     for site_id in $( wp site list --field=blog_id ); do
          site_url=$( wp site list --field=url --blog_id=${site_id} )
          echo WooCommerce Database Update checked for site: ${site_url}
          
          wp wc update --url=${site_url}
          echo Aktualisierung fertig!

     done
fi
