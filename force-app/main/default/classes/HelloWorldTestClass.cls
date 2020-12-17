@isTest 
private class HelloWorldTestClass {
    static testMethod void validateHelloWorld() {
       Account a = new Account(Name='Behind the Cloud', NumberOfEmployees=100);
       System.debug('account name: ' + a.NumberOfEmployees);

       // Insert book
       insert a;
    
       // Retrieve the new book
       a = [SELECT NumberOfEmployees FROM Account  WHERE Id =:a.Id];
       System.debug('Phone after trigger fired: ' + a.NumberOfEmployees);

       // Test that the trigger correctly updated the price
       System.assertEquals(90, a.NumberOfEmployees);
    }
}