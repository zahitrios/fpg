<?php

	// Get cURL resource
	$curl = curl_init();
	// Set some options - we are passing in a useragent too here
	curl_setopt_array($curl, array(
	    CURLOPT_RETURNTRANSFER => 1,
	    //CURLOPT_URL => 'http://digitallpost.com.mx/'
	    CURLOPT_URL => 'http://corazoncanela.com/'
	   
	));
	// Send the request & save response to $resp
	$resp = curl_exec($curl);
	//$regex='<script>[\s\S]*?<\/script>';
	$regex = '#<\s*?script\b[^>]*>(.*?)</script\b[^>]*>#s';
	$code = preg_replace($regex, '', $resp);
	


	echo $code;
	// Close request to clear up some resources
	curl_close($curl);

?>