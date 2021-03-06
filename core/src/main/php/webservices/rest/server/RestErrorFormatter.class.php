<?php
/* This class is part of the XP framework
 *
 * $Id$
 */

  
  /**
   * Error formatter interface
   *
   * @purpose Caster
   */
  interface RestErrorFormatter {
    
    /**
     * Format a throwable int oa specific object
     * 
     * @param lang.Throwable e
     * @return var
     */
    public function format(Throwable $e);
  }
?>
