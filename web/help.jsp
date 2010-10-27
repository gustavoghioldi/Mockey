<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Help" scope="request" />
<c:set var="currentTab" value="help" scope="request" />

<jsp:include page="/WEB-INF/common/header.jsp" />

<div id="main">
    <div class="tableofcontents" style="">
        
	    <h3>Table of Contents</h3>
	    <ul>
	        <li><a href="#bigpicture">Big Picture</a></li>
	        <li><a href="#mockservice" name="mockservice">Mock Service</a></li>
	        <li><a href="#plan">Service Plan</a></li>
	        <li><a href="#scenario">Mock Service Scenario</a></li>
	        <li><a href="#twisting">Twisting</a></li>
	        <li><a href="#record">Get Started - Record Stuff</a></li>
	        <li><a href="#flush">Flush</a></li>
	        <li><a href="#export_upload">Export/Upload</a></li>
	        <li><a href="#url_injection">URL Injection</a></li>
	        <li><a href="#merge_services">Merge Services</a></li>
	        
	        <li><a href="#good_things_to_test">Good Things to Test</a></li>
	    </ul>
    </div>
	
	<a href="#bigpicture" name="bigpicture"></a> 
	
	<h2>The Big Picture</h2>
	
	   <strong>Mockey</strong> is a tool for testing application interactions over http.</p>
	   <p><img src="<c:url value="/images/bigpicture.png" />" /></p>
	
	
	<div class="help_section_zebra">
		<a href="#mockservice" name="mockservice"></a>
		<h2>Mock Service</h2>
		<p>
		 A mock service can be a proxy to a real service, enabling you to inspect request and response messages
		 being exchanged. You can set up Mockey to go through a corporate proxy server (see <a href="<c:url value="/proxy/settings" />">Proxy Settings</a>). 
		 There's support for HTTP and HTTPS interactions (if your proxy server or endpoint service is https). Be sure to check out your service's History
		 to inspect and save a past conversation as a Service Scenario.                       
	    </p>
    </div>
    <div class="help_section">
	    <a href="#plan" name="plan"></a> 
	    <h2>Service Plan</h2>
	    <p>
	    A service plan is a snap shot of your service and scenario settings. For example, you toggle your service
	    and scenario settings to represent a Gold Member. Then you toggle your service and scenario settings to 
	    represent a Silver Member. Instead of spending your time toggling back an forth, you would save your settings
	    for the Gold Member as a "Gold Member" plan and Silver Member settings as "Silver Member" plan. 
	    <div class="info_message sidebarme"><strong>Note:</strong> Service Plans are not the most reliable things. If you 
	    frequently add and remove scenarios or create and delete services, the service plans get stale and start to
	    smell bad. </div>
	    </p>
	</div>
    <div class="help_section_zebra">
	    <a href="#scenario" name="scenario"></a>
		<h2>Mock Service Scenario</h2>
		<p>
	    A mock service can have 0 or more <i>mock service scenario</i> definitions associated with it. 
	    This is handy if you don't want to proxy to a real service and want to explicitly define 
		your mock service's response.      
	    </p>
    
	    <p>
	    <i style="color:red;font-weight:bold;">Match Argument</i>? <i style="color:green;font-weight:bold;">Static</i> or <i style="color:orange;font-weight:bold;">Dynamic</i>? Setting your mock service to 
		 <i>static</i> means your mock service will always return the same mock service scenario, no matter what the request is. Dynamic means, Mockey
		  inspects the incoming request message for a specific <b>match argument</b>. If the incoming request message contains this string argument, then this service 
		  scenario's response message will be the response. If more than one scenario is defined with this matching argument, then the first matched 
		  scenario's response message will be returned. If no scenario is found with a matching argument, a plain text error message will display.
		  You only need to define a match argument per service scenario for dynamic scenarios.
	    </p>
	    <p><img src="<c:url value="/images/dynamic_response.png" />" /></p>
    </div>
    <div class="help_section">
	    <a href="#twisting" name="twisting"></a>
	    <h2>Twisting</h2>
	    <p>
	    Twisting refers to taking incoming requests from URL/Domain X and mapping them to URL/Domain Y. 
	    <ul>
	      <li>Twisting is <b>only</b> used for services set to <strong>Proxy</strong> requests</li>
	      <li>Twisting is <b>not</b> used for services set to <strong>Static</strong> or <strong>Dynamic</strong></li>
	    
	    </ul>
	       
	    <strong>When would I want to use Twisting?</strong> When your client application doesn't
	        easily allow you to point to different environments or when some requests should be answered by the real
	        service but other requests need to be answered by your sandbox. 
	        <div class="info_message">
	            <h4>How Twisting Works</h4>
	            <p>
	            Let's say Mockey receives an incoming request: 
	            <div class="code">http://127.0.0.1:8080/service/http://<b>uat1</b>.mystartup.com/catalog/list</div>
	            </p>
	            <p>
	            And let's say Twisting is on with the following twist configuration:
	            <div class="code"><strong>"Make sure everything hits the QA Environment, not UAT"</strong>
		            <ul style="list-style: none;">
			            <li>Here are the find and replace patterns:</li>
			            <li>  
							<table class="api">
				            <tr><th>Find...</th><th>Replace with...</th></tr>
				            <tr><td>uat1.mystartup.com</td><td>qa1.mystartup.com</td></tr>
				            <tr><td>uat2.mystartup.com</td><td>qa1.mystartup.com</td></tr>
				            <tr><td>qa3.mystartup.com</td><td>qa1.mystartup.com</td></tr>
				            </table>
				       </li>
		            </ul>
	            </div>
	            <p>
	            Based on the Twisting configuration above, Mockey will take the incoming request and <i>twist</i> the 
	            request to the following <b>new</b> URL:
	            <div class="code">http://127.0.0.1:8080/service/http://<b>qa1</b>.mystartup.com/catalog/list</div>
	            ..and then proxy that request. 
	            </p>
	            
	        </div>
	    </p>
	</div>
	<div class="help_section_zebra">
	    <a href="#record" name="record"></a> 
	    <h2>Get Started - Record Stuff</h2>
	    <p>
	    Mockey can proxy to a desired URL/service, record it, and create a new
		service definition for you. Be sure to check the service defintion's
		history link to inspect the request and response messages.
		
			<div class="info_message">
			    <h4>How to Record</h4>
				<p>
				First, place Mockey's URL in front of the service URL you want to
				record, something like this:
				<div class="code">[mockey_ip]:[port]<b>[/Context Root]/service/</b>[whatever_service_you_want_to_record]</div>
				</p>
				<p>
				Second, go back to Mockey's menu and click 'All Services'. You should
				see some auto generated service definitions. 
				</p>
				<p>Third, click on the auto generated 'history' link; you should see your IP address. Click on 
				it to see the request and response transaction(s) you just made.
				
				<h4>Examples</h4>
				<div >
				<ul id="simple">
					<li>1) <a href="<c:out value="${hintRecordUrl1}"/>"><c:out
						value="${hintRecordUrl1}" /></a></li>
					<li>2) <a href="<c:out value="${hintRecordUrl2}"/>"><c:out
						value="${hintRecordUrl2}" /></a></li>
				</ul>
				</div>
				<p>
				After clicking on one of these example links above, click <a href="<c:url value="home"/>">here</a> to see what just happened.  
				</p>
			</div>
		</p>
	</div>
	<div class="help_section">
		<a href="#flush" name="flush"></a>
	    <h2>Flush</h2>
	    <p>
	    Clicking on the <strong>flush</strong> link will clear out everything, allowing you to start with a clean slate. 
	    </p>
	</div>
	<div class="help_section_zebra">
	    <a href="#export_upload" name="export_upload"></a>
	    <h2>Export/Upload - huh?</h2>
	    <p>
	    There isn't a database for this web tool, everything is kept in memory and written to a local file. 
	    After you get everything set up, <strong>export</strong> your configuration
	    to a <strong>mockservice.xml</strong> file; you can share this file with others if you like.  
	     </p>
	</div>
	<div class="help_section">
        <a href="#url_injection" name="url_injection"></a>
        <h2>URL Injection</h2>
        <p>
        <strong>When would URL injection be important?</strong> Mockey tries to be smart about things. With an incoming HTTP URL request, 
        Mockey will try to see if any Services are defined (or associated) to the incoming HTTP URL request, whether its the <strong>Mock URL</strong>
        or one of the <strong>Real URL(s)</strong>. If no Service definition is associated with the incoming HTTP URL, then Mockey will do its best
        to proxy the requests.
        <br /><br />
        <strong style="color:red;">TODO: Need logic flow diagram here.</strong>
        <br /><br />
        If you defined many Services and Scenarios to work with a specific environment (e.g. <i>https://<b>qa-3</b>.environment.domains.com/cataglog/product</i>), 
        then you're kind of hosed if all requests start coming from another URL (e.g. <i>https://<b>sandbox</b>.environment.domains.com/cataglog/product</i>).
        
        <br /><br />
        URL Injection allows you to quickly tell Mockey how to associate Service definitions associated with one environment
        (e.g. qa3) to another environment (e.g. sandbox).  
        <br />
        <div class="info_message">
       <h3>Example</h3>
       Before injection:
       <p><strong>Service XYZ</strong> has the following real URLs:
      
                <ul>
                  <li>http://qa1.domain.com/authentication</li>
                  <li>http://qa2.domain.com/authentication</li>
                </ul>
                </p>
                After injecting with match pattern <i>qa1.domain.com</i> and 
                replace pattern <i>qa8.domain.com</i>, we get:
                <p>
                <strong>Service XYZ</strong> has the following real URLs:
      
                <ul>
                  <li>http://qa1.domain.com/authentication</li>
                  <li>http://qa2.domain.com/authentication</li>
                  <li>http://qa8.domain.com/authentication</li>
                </ul>
                </p>
        </div>
      
         
        </p>
    </div>
    <div class="help_section_zebra">
        <a href="#merge_services" name="merge_services"></a>
        <h2>Merge Services</h2>
        <p>
         <strong>When would I want to Merge Services?</strong> Whenever you see duplication of Service and/or Scenario definitions. 
         This can happen if you have Scenarios tied to duplicate Service definition (e.g. Service X: <i>http://mystartup.com/authentication</i> and 
         Service Y: <i>http://mystartup.com/login</i> - both referring to the same thing). 
         <br /><br />
         Merge them! 
         <br /><br />Merging will create a new Service definition
         associated to multiple real URLs (e.g. Service X: <i>http://mystartup.com/authentication</i> and 
         <i>http://mystartup.com/login</i> ) and combine all unique Scenario definitions into the new Service.
         
         </p>
    </div>
    <!--  
    <h2>Service Error Response</h2>
    <p>
    <b>You define this.</b> It is a service scenario flagged as a 'Service Error Response', it will be returned by Mockey if an error occurs 
    when calling the service. An error can be caused by a timeout, from calling a real service, or inability 
    to parse data. 
    </p>
    
    <h2>Universal Error Response</h2>
    <p>
    <b>You define this.</b> A service scenario flagged as a 'Universal Error Response' will be returned by Mockey if an error occurs 
    when calling a service <i>and</i> a scenario is not defined as a Service Error Response. The purpose of this 
    feature is to provide one place to define a universal error message, without the need to create an error
    scenario for each service. 
    </p>
    -->
    <div class="help_section">
	    <a href="#good_things_to_test" name="good_things_to_test"></a>
	    <h2>Good Things to Test</h2>
	    <p>
		    Here's a short list of things Mockey is good for. 
		    <ul>
		    <li><i>Connection smarts:</i> Try setting the hang time for 2 minutes, then see if your application's timeout connection setting works. Remember, 
		    sometimes the service your application interacts with is slow and may receive a connection but not let go.</li>
		    <li><i>Garbage handling:</i> Be sure to create bad responses (e.g. Mockey responds with the word 'GARBAGE') and see if your application handles this gracefully. </li>
		    </ul>      
	    </p>
    </div>
    
    <div class="help_section_zebra">
	    <h2>URL Mapping Config Recommendations</h2>
		<p>
		    If your application points to 1 or more services like this:
		    <ul>     
		      <li>http://someservice.com/catalog/product</li>
		      <li>http://someotherservice.com/authentication</li>
		      <li>http://anotherservice.com/?wsdl</li>      
		    </ul>
		    ...you probably have this in a configuration file (not in code, right?). You may want to define a <i>base</i> url parameter, 
		    like this:
		    <div class="code code_text">
			    <ul>
			      <li>DEV_BASE_URL=http://localhost:8090/Mockey/service/</li>      
			      <li>SERVICE_URL_1=http://someservice.com/catalog/product</li>
			      <li>SERVICE_URL_2=http://someotherservice.com/authentication</li>
			      <li>SERVICE_URL_3=http://anotherservice.com/?wsdl</li>      
			    </ul>    
		    </div>
		    You then can create URLs by pre-pending the DEV_BASE_URL to your SERVICE_URL definitions. When it comes time to go to production, 
		    just define DEV_BASE_URL as an empty string. 
	    </p>
	</div>
	<div class="help_section">
	    <h2>Related Read</h2>
	    <p>
	    <a href="http://martinfowler.com/bliki/TestDouble.html">http://martinfowler.com/bliki/TestDouble.html</a>
	    </p>
	</div>
</div>	
<jsp:include page="/WEB-INF/common/footer.jsp" />