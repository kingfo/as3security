ActionScript 3 Security Utilities 
=================================
ActionScript 3 Security Utilities provides some common solutions for security.


``
            +--------------------------------------------+         +------------------------------------------+
            |       ^        page.com/page.html    + +   |         |    assets.cdn.com/<FILE>                 |
            |-------|------------------------------|-|---|         |------------------------------------------|
            |       |                              | |   |         |                                          |
            |      (1)                            (2)|   |         |                                          |
            |       |                              | |   |         |                                          |
            | +-----|------------------------------|-|-  |         |                                          |
            | |     +         swf.com/flash.swf    v +------(3)--->|     <FILE>:                              |
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
      |                                 |     <LOCAL>         +                  |
     (5)                                |----------------------------------------|
      |                                 |                                        |
      |                                 |        <LOCAL>                         |
      |                                 |           * file.air                   |
      +-----------------------------------+         * file.swf                   |
                                        |           * other                      |
                                        |                                        |
                                        |                                        |
                                        |                                        |
                                        +----------------------------------------+
``


ALL TESTS
---------
http://kingfo.github.com/as3security/test/Runner.html
	
Quick Start
-----------
* Install [Firefox](http://www.mozilla.org/firefox/  'A web browser')
* Install [Firebug](http://getfirebug.com/  'A Firefox extension')
* Install [Flashbug](https://addons.mozilla.org/en-US/firefox/addon/flashbug/ "A Firebug extension")