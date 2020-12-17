public class OpportunityChildCreation 
{
List<opportunity_trigger__c> oppch = new List<opportunity_trigger__c>();
Public void afterInsert()
    {
        for(Opportunity  opp : (List<Opportunity>)trigger.new)
         {
          for (Integer i=0; i < opp.No_of_Child_Records__c;i++)
           {   
              opportunity_trigger__c Child = new opportunity_trigger__c ();
              if((opp.Status__c == True) && (opp.No_of_Child_Records__c > 0))
                {
                   Child.Opportunity__c = opp.id;
                   Child.Name = opp.Name;
                   oppch.add(Child);
                 }    
           } 
         }
    insert oppch;
       
}
    Public void beforeUpdate()
    {
       for(Opportunity  op : (List<Opportunity>)trigger.new)
        {
        List<opportunity_trigger__c> opch = new List<opportunity_trigger__c>(); 
        Integer count = Integer.valueOf(op.Updated_Count__c);
        List<opportunity_trigger__c> rectodelete = new List<opportunity_trigger__c>([SELECT id FROM opportunity_trigger__c WHERE Opportunity__c =:op.Id Limit :count]);
          if(op.Count_Value__c < (op.No_of_Child_Records__c))
           {
          for(Integer i = Integer.valueOf(op.No_of_Child_Records__c); i > op.Count_Value__c; i--)
           {
             opportunity_trigger__c Child2 = new opportunity_trigger__c ();
             child2.Opportunity__c = op.Id;
             child2.Name = op.Name;
             opch.add(child2);
           }
          }
    else 
    {
       if(!rectodelete.isEmpty())
         delete rectodelete;   
     }
       upsert opch;
    }
}
}