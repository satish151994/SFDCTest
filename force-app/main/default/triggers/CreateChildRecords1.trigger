trigger CreateChildRecords1 on Opportunity (after insert,after update) 
{
OpportunityChildCreation oppch = new OpportunityChildCreation();
    
if(Trigger.isInsert && Trigger.isAfter)
{
 oppch.afterInsert(); 
}

 

if(Trigger.isUpdate && Trigger.isAfter)
{
   oppch.beforeUpdate(); 
}
}