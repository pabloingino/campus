<?php


require 'paypal/autoload.php';

define('URL_SITIO', 'http://localhost/campus');

$apiContext = new \PayPal\Rest\ApiContext(
      new \PayPal\Auth\OAuthTokenCredential(
          'AfFA1UTL8cyFG4jxZw4mGRdrdECgWeFaeyYVsQ4EhMc7zWiMBMXN8WxY0TGccOOqcqczxMcd5q2o07w-',  // ClienteID
          'EJAtkh144pKtkr4OgcCL6O9LT9ohmpwazMGHXvr4Tdj_QWs5a199chcwc_Gmkji5UOL1Bc_1h8TUK2Vm'  // Secret
      )
);
