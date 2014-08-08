simpli
======
SIMple Provision LIb - a very simple, shell based [server provisioning](http://en.wikipedia.org/wiki/Provisioning#Server_provisioning) tool aimed at (but not reserved to) Vagrant.

A really simple alternative to puppet, chef, etc.


User story
==========
I learnt puppet. I really learn it and was able to setup a fairly complex configuration (see it https://github.com/Offirmo/offirmo-puppet) which I used to provision my development VMs, my pet projects Amazon instance and some charities websites. It was hard but it worked.

Lately at work, some VM provisioning was needed. I started a puppet config, then I broke. It was too hard. My coworkers would never be able to debug my code unless they spend two weeks learning puppet like I did. Puppet alternatives didn't look a lot simpler to me. And just running a bunch of `sudo apt-get install` and `wget xyz; tar -x …` shouldn't be so hard.

There had to be another way to do it. Time to try it my way !





How simple ?
============

* written in bash, nothing to install (ruby, binary, etc.)
* thanks to bash, you write your install steps naturally, no need to constrict them in another language
* modular design : import and use custom or pre-written modules
* clear separation between root stuff and user stuff
* makes strong assumptions to ease overall complexity (more about this below)

Should I use it ?
=================


