# insecure
This is a fork of [Insecure web app](https://www.owasp.org/index.php/Category:OWASP_Insecure_Web_App_Project) from OWASP.

In order to make usage simpler, I switched it to use Gradle for its build tool and am using the Gretty plugin.  This enables us to start the web application by simply typing

    gradlew appRun
    
After running that command, go to http://localhost:8080/asc

Instructions to investigate the (in)security are at a link on that page.
