trigger HelloWorldTrigger on Account (before insert) {
Account[] acc = Trigger.new;

   MyHelloWorld.applyDiscount(acc);
}