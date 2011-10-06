<?php
/* This class is part of the XP framework
 *
 * $Id$
 */

  /**
   * Factory for HTTP request adapters
   *
   * @test    xp://net.xp_framework.unittest.rest.transport.HttpRequestAdapterFactoryTest
   * @purpose Factory
   */
  class HttpRequestAdapterFactory extends Object {
    
    /**
     * Create adapter for request based on content type header
     * 
     * @param scriptlet.HttpScriptletRequest request The request
     * @return lang.XPClass
     */
    public static function forRequest($request) {
      static $map= array(
        'application/json' => 'webservices.rest.transport.JsonHttpRequestAdapter'
      );
      
      if (!isset($map[$request->getHeader('Content-Type')])) throw new IllegalArgumentException(
        'The content type is not supported: '.$request->getHeader('Content-Type')
      );
      
      return XPClass::forName($map[$request->getHeader('Content-Type')]);
    }
  }
?>
