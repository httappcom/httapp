global class PostInstallation implements InstallHandler {
    global void onInstall(InstallContext context) {
        if(context.previousVersion() == null) {
            List<Task_Specifier__c> taskSpecifiers = new List<Task_Specifier__c>();
        } else {
            if(context.isUpgrade()) {
            }
            if(context.isPush()) {
            }
        }
    }
}