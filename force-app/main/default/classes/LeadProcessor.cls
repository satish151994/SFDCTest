global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator([select LeadSource From Lead]);
    }
    
     global void execute(Database.BatchableContext bc, List<Lead> scope)
     {
         List<Lead> leads = new List<Lead>();
         for(Lead ld : scope)
         {
             ld.LeadSource = 'Dreamforce';
             leads.add(ld);
             recordsProcessed = recordsProcessed + 1;
         }
         
       update leads;  
     }
    
     global void finish(Database.BatchableContext bc)
     {
         System.debug(recordsProcessed + ' records processed. Shazam!');
     }
}