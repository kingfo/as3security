ActionScript 3 Security Utilities 
=================================
ActionScript 3 Security Utilities provides some common solutions for security.


<pre>
            +--------------------------------------------+         +------------------------------------------+
            |       ^        page.com/page.html    + +   |         |    assets.cdn.com/FILE                   |
            |-------|------------------------------|-|---|         |------------------------------------------|
            |       |                              | |   |         |                                          |
            |      (1)                            (2)|   |         |                                          |
            |       |                              | |   |         |                                          |
            | +-----|------------------------------|-|-  |         |                                          |
            | |     +         swf.com/flash.swf    v +------(3)--->|     FILE:                                |
            | |----------------------------------------| |         |        * flash.swf //swf files           |
            | | * Security.allowDomain                +------(4)------->    * image.jpg //image files         |
            | | * Security.allowInsecureDomain         | |         |        * data.xml  // text files         |
            | | * localConnection.allowDomain         +-----(6)--------->   * other     // other files        |
            | | * localConnection.allowInsecureDomain || |         |                                          |
      +-------->                                      +-------+                                               |
      |     | |    ^                                   | |    |    |                                          |
      |     | +----|-----------------------------------+ |    |    |                                          |
      |     |      |                                     |    |    |                                          |
      |     |      |                                     |    |    |                                          |
      |     |     (5)     * allowscriptaccess            |    |    |                                          |
      |     |      |      * allownetworking              |    |    |                                          |
      |     |      |                                     |    |    +------------------------------------------+
      |     | +----|-----------------------------------+ |    |
      |     | |    +    swf2.com/flash2.swf            | |    |
      |     | +----------------------------------------+ |    |
      |     |                                            |    |
      |     +--------------------------------------------+    |
      |                                                       |
      |                                 +---------------------|------------------+
      |                                 |      LOCAL          +                  |
     (5)                                |----------------------------------------|
      |                                 |                                        |
      |                                 |         LOCAL                          |
      |                                 |           * file.air                   |
      +-----------------------------------+         * file.swf                   |
                                        |           * other                      |
                                        |                                        |
                                        |                                        |
                                        |                                        |
                                        +----------------------------------------+
</pre>

* FunctionWhitelist.js: (1)
* FunctionWhitelist.as: (2)
* CrossDomainWhitelist.as + whitelist.xml: (3),(6),[(4)+(5)]
* CrossDomain.xml: (3),(4),(6) see:[Cross-domain policy file specification](http://www.adobe.com/devnet/articles/crossdomain_policy_file_spec.html "Adobe Developer Connection")

About "whitelist.xml"
---------------------
same as _Cross-domain policy_ :

###  Element specification
 
_root element_ name is not required
  
#### _allow-access-from_ 
* _allow-access-from_ grants a requesting domain access to read data from the target domain

```html
<?xml version="1.0" encoding="utf-8" ?>
<domain-policy>
	<allow-access-from domain="kingfo.github.com"/>
</domain-policy>
```

* although multiple domains can be given access with one _allow-access-from_ element by using a wildcard (__*__)

```html
<?xml version="1.0" encoding="utf-8" ?>
<domain-policy>
	<allow-access-from domain="*"/>
</domain-policy>
```

```html
<?xml version="1.0" encoding="utf-8" ?>
<domain-policy>
	<allow-access-from domain="*.github.com"/>
</domain-policy>
```


* Child of _root element_



##### Attributes
###### domain

Specifies a requesting domain to be granted access. 
   
* Both named __domains__ and __IP addresses__  are acceptable values.
* __Subdomains__ are considered different domains

###### secure

 Specifies whether access is granted only to HTTPS 
documents from the specified origin (true) or to all documents from the specified origin (false).

* If secure is not specified in an HTTPS policy file, it defaults to true.
* Using false in an HTTPS policy file is not recommended because this compromises the security offered by HTTPS


#####  Matching rule
* Individual named domains or subdomains must match exactly.
* Explicit IP addresses do not match named domains, even if they refer to the same host
* Domain wildcards, such as *.example.com, match both the domain alone and any subdomains.
* An overall wildcard, (*) allows access by all requestors and is not recommended.

	
All Tests
---------
http://kingfo.github.com/as3security/test/Runner.html
	
Quick Start
-----------
* Install [Firefox](http://www.mozilla.org/firefox/  'A web browser')
* Install [Firebug](http://getfirebug.com/  'A Firefox extension')
* Install [Flashbug](https://addons.mozilla.org/en-US/firefox/addon/flashbug/ "A Firebug extension")
* Install [Flash Debugger version](http://www.adobe.com/support/flashplayer/downloads.html "Adobe Flash Player Support Center")

About github markdown?
----------------------
https://github.com/mojombo/github-flavored-markdown/issues/1