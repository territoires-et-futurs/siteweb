https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site

On OVH Manager, deleted the following records :
* `territoiresetfuturs.fr` `51.91.236.193 ` (`A` record)
* `www.territoiresetfuturs.fr` `51.91.236.193 ` (`A` record)

and created the following `A` records for Github Pages :

* `territoiresetfuturs.fr` `185.199.108.153` (`A` record)
* `www.territoiresetfuturs.fr` `185.199.108.153` (`A` record)

* `territoiresetfuturs.fr` `185.199.109.153` (`A` record)
* `www.territoiresetfuturs.fr` `185.199.109.153` (`A` record)

* `territoiresetfuturs.fr` `185.199.110.153` (`A` record)
* `www.territoiresetfuturs.fr` `185.199.110.153` (`A` record)

* `territoiresetfuturs.fr` `185.199.111.153` (`A` record)
* `www.territoiresetfuturs.fr` `185.199.111.153` (`A` record)


now i have :

![dns and tls/ssl cert conf](./images/SSL_AND_DNS_CONF.png)

So I :

* deleted the records :
  * `www.territoiresetfuturs.fr` `185.199.108.153` (`A` record)
  * `www.territoiresetfuturs.fr` `185.199.109.153` (`A` record)
  * `www.territoiresetfuturs.fr` `185.199.110.153` (`A` record)
  * `www.territoiresetfuturs.fr` `185.199.111.153` (`A` record)
* and recreated them as one CNAME record :
  * `www.territoiresetfuturs.fr` `territoiresetfuturs.fr` (`CNAME` record)


Doing that, I got :

![incompatible record](./images/incompatible_dns_record.png)

so i deleted :

![deleted incompatible record](./images/deleted_incompatible_dns_record.png)

and i could finally created the `CNAME` record :

![created CNAME record](./images/created_cname_dns_record.png)

Then i could check the checkbox to enforce ssl termination on github pages :

![created CNAME record](./images/enforce_ssl_gh_pages.png)
