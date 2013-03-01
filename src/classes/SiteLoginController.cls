/**
 * An apex page controller that exposes the site login functionality
 */
global with sharing class SiteLoginController {
    global String username {get; set;}
    global String password {get; set;}

    global PageReference login() {
   Logger.info('SiteLoginController');
   system.debug('SiteLoginController');
    	username = (username.contains('@'))?username:username+'@patient.nuehealth.com';
        PageReference pr = null;
        try {
       		pr = Site.login(username, password, '/patientPortal');
        } catch (Exception ex) {
   Logger.info('SiteLoginController exception '+ex.getMessage());
   system.debug('SiteLoginController exception '+ex.getMessage());
        }
        return pr;
    }
    
   	global SiteLoginController () {}
    
    @IsTest(SeeAllData=true) global static void testSiteLoginController () {
        // Instantiate a new controller with all parameters in the page
        SiteLoginController controller = new SiteLoginController ();
        controller.username = 'test@salesforce.com';
        controller.password = '123456'; 
                
        System.assertEquals(controller.login(),null);                           
    }    
}