# Apex

## What is Apex?
Apex is a programming language that uses Java-like syntax and acts like database stored procedures.   
 Apex enables developers to add business logic to system events, such as button clicks, updates of related records, and [Visualforce](https://trailhead.salesforce.com/en/content/learn/modules/visualforce_fundamentals/visualforce_creating_pages#:~:text=Visualforce%20pages%20are%20basic%20building,on%20a%20traditional%20web%20server.) pages.

 *(To customize the front-end UI and functionality of your org, use Visualforce and Lightning Web Components.)*

- Cloud development as Apex is stored, compiled, and executed in the cloud.
- Database statements that allow you to make direct database calls and query languages to query and search data.
- The global access modifier, which is more permissive than the public modifier and allows access across namespaces and applications.


---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)


## [Data Types Overview](https://www.tutorialspoint.com/apex/apex_data_types.htm)    
Apex is a strongly types language → every variable has to be declared with the specific data type.   

### Primitive:   
- Intiger: 32-bit number (does not include a decimal point)   
    *define an integer and print out*    
    *`system.debug` is an output statement in Apex (like system.out.printIn in Java)*  
    ```
    Integer i = 100;
    system.debug(i);
    ```

- Long: 64-bit number (does not include a decimal point)   
    *define a long datatype and print out*    
    ```
     Long l = 2147483648;
    system.debug(l);
    ```
- Decimal   
    `Decimal d = 27.0`
- Date   
    Storing date, not the time.   
    *date.today() function*
    ```
    Date today = date.today();
    2022-07-22
    ```
- Date Time   
    Both Date and Time

- Blob    
    collection of binary data stored as a single object.

- String   
   - a String in a method is with sing quotation marks `''`   
	```
	String s = 'abcdefg';
	```
- ID    
    stores the ID of a record. All records have a unique ID.    
    In order to perform any operation on a record, we need to use the record's ID.    
    ID in Apex is any valid 18 character Lightning Platform record identifier.

- Boolean    
    it can only be assigned to `true`, `false` or `null`    
    Used to check for a condition.
    ```
    Boolean isWinner = true;
    ```
- sObject    
    - sObject represent any record in the SalesForce database.     
    With this datatype we can create, modify or delete any records in the database.    

        *Create a new account record, named 'Hello'*   
        ```
        Account abc = new Account(Name = 'Hello');
        insert abc;
        ```  
     - An sObject, either as a generic sObject or as a specific sObject, such as an Account, Contact, or MyCustomObject__c.

- enum   
    - enum is an abstract datatype that stores one value of (a finite set of) specified identifiers    
        *List of identifiers: WINTER, SPRING, SUMMER, FALL*
        ```
        public enum Season {WINTER, SPRING, SUMMER, FALL}
        ```

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)


## [Apex Collections](https://developer.salesforce.com/docs/atlas.en-us.224.0.apexcode.meta/apexcode/langCon_apex_collections.htm): 

### [List](https://developer.salesforce.com/docs/atlas.en-us.224.0.apexcode.meta/apexcode/langCon_apex_collections_lists.htm)
Lists holds an __ordered__ collection of objects.      
 So __Lists in Apex are synonymous with arrays__ and the two can be used interchangeably. However creating list is easier than arrays.
 
- To declare a list, use the `List` keyword followed by the primitive data, sObject, nested list, map, or __set type within `<>` characters__.
- eg.:    
  *Create an empty list of String*
  ```
  List<String> my_list = new List<String>();
  ```
  *Create a nested list*
  ```
  List<List<Set<Integer>>> my_list_2 = new List<List<Set<Integer>>>();
  ```
- To access elements in a list, use the List methods provided by Apex.
  - eg.:   
    ```
    List<Integer> myList = new List<Integer>(); // Define a new list

    myList.add(47);                    // Adds a second element of value 47 to the end of the list

    Integer i = myList.get(0);                   // Retrieves the element at index 0

    myList.set(0, 1);                           // Adds the integer 1 to the list at index 0

    myList.clear();                    // Removes all elements from the list
    ```


- variable declaration using the List syntax
  - eg.:      
  *The `colors` variable is declared using the List syntax.*
  ```
  List<String> colors = new List<String>();
  ```
  *This is the same as above*
  ```
  String[] colors = new List<String>();
  ```
  - `List.add()` method to add new elements

    - eg.:   
      *Wow to add elements to a list when you create it, and then use the `add()` method to add more elements.*
      ```
      // Create a list and add elements to it in one step
      List<String> colors = new List<String> { 'red', 'green', 'blue' };

      // Add elements to a list after it has been created❗️
      List<String> moreColors = new List<String>();
      moreColors.add('orange');
      moreColors.add('purple');
      ```
  - List elements can be read by specifying an index between square brackets.    
  Also we can use the `get()` method to read a list element.
  - eg.:    
    *How to iterate over array elements*
    ```
    // Get elements from a list
    String color1 = moreColors.get(0);
    String color2 = moreColors[0];
    System.assertEquals(color1, color2);      //← System Class, Asserts that the first two arguments are the same. 

    // Iterate over a list to read elements
    for(Integer i=0; i<colors.size(); i++) {
      // Write value to the debug log
      System.debug(colors[i]);
    }
    ```

    ```
    List<Integer> listOfNumbers = new List<Integer>();
         listOfNumbers.add(1);
	 listOfNumbers.add(2);
	 listOfNumbers.add(3);
	 istOfNumbers.add(3);
	 istOfNumbers.add(1);
     System.debug('listOfNumbers' + listOfNumbers);

     // output:
     // listOfNumbers(1,2,3,3,1)
    ```
  - compare:   
    *compare color1 & color2*   
    ```
    System.assertEquals(color1,color2);
    ```

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)

### [Sets]()    
A set is an __unordered__ collection of elements that do not contain any duplicates. Set elements can be of any data type—primitive types, collections, sObjects, user-defined types, and built-in Apex types.

  Declaring a `Set`:   
  `Set<Integer> setOfNumbers = new Set<Integer>();`
   (Set<TYPE> VARIABLENAME = OPERATOR;) 
  eg.:  
  ```
  Set<Integer> setOfNumbers = new Set<Integer>();
    setOfNumbers.add(3);
    setOfNumbers.add(2);
    setOfNumbers.add(2);
    setOfNumbers.add(1);

  System.debug('setOfNumbers: ' + setOfNumbers);

  // output:
  //setOfNumbers {1,2,3}  //doesn't put the two 2 twice, and it puts the numbers in order 
  ```

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)

	
### [MAP]()  
  we define datatype four 2 different elements.    
  `Map< key, value> variable = new Map< key, value>();`    
eg.:       
 *`.put()` method importing the value and the key.*      
 *For the `3` key we have a value `three` and a value `four`, therfore `three` is overwritten by `four`*     
  ```
  Map<Integer, String> mapOfIntegerString = new Map<Integer, String>();
    mapOfIntegerString.put(1, 'one');
    mapOfIntegerString.put(2, 'two');
    mapOfIntegerString.put(3, 'three');
    mapOfIntegerString.put(3, 'four');
  System.debug('mapOfIntegerString: ' + mapOfIntegerString);
  System.debug('Value at 3: ' + mapOfIntegerString.get(3);

  // mapOfIntegerString: {1=one, 2=two, 3=four}
  // Value at: 3: four  
  ```

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)	



## Inspect Debug Logs
Debug logs are useful for debugging your code. 

- `sendMail()` called the `inspectResults()` helper method, which writes messages to the log by using the `System.debug()` method to indicate whether the email send operation was successful or not.

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)

## Call a Static Method

The `sendMail()` method in our class doesn’t access class member variables, it doesn’t need to be an instance method.   

By adding the `static` method to its declaration, because `static` methods are easier to call (than instance methods) because they don’t need to be called on an instance of the class but are __called directly on the class name__.

- eg.:   
  *`generateStringArray()` method has a `n` parameter, an intiger.*     
  *It has alist, which returns `n` indexed 'Test', like [Test 1, Test 2, etc.]*
  *We create a for loop with the `n`, and adding the the `i` index to the string 'Test' in an array.*   
  ```
  public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer n)
      {
          // creating an Array
          List<String> myArray = new List<String>();
          
          // looping through the 'myArray'
          for(Integer i = 0; i < n; i++)
          {
            myArray.add('Test '+i);
            System.debug(myArray[i]);
          }
          return myArray;
      }
  }
  ```   

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)

## [Keywords in Apex](https://www.salesforcetutorial.com/static-final-this-super-keywords-in-apex/)

- [Final](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_keywords_final.htm)   
   This keyword is used to modify variables and give it a constant value.    
   To define a constant, mark a variable as both static and final (so use both keywords: static final).        
   This keyword is used to Defines constants and methods that can’t be overridden.   

   *INT_CONST is a variable initialized its value to 10.*    
   *This means that this INT_CONST variable will be 10 throughout the program. (Can't be overwritten.)*
   ```
   public class myClass {
    static final Integer INT_CONST = 10;
   }
   ```

- [Return](https://stackoverflow.com/questions/14847524/how-to-exit-an-apex-function) 
  This keyword is used to return a value from a method.   

    *After the `return` keyword the variable whose value we want to return.*  
    ```
    public String getName() {
        return 'Name';
    }
    ```

	- *(When the method return type is `void`, the method does not return a value. To return a value, replace void with a different return type.)* 
	For example, here, the wilt method expects a `return` (response) value that’s an integer.	     
	     ```	
	     //1    public static Integer wilt(Integer numberOfPetals){
	     //2      if(numberOfPetals >= 1){
	     //3         numberOfPetals--;
	     //4      }
	     //5      return numberOfPetals;
	     //6    }
	     ```	
	- In line 1, the keyword `Integer` (immediately after `public static`) indicates that the method returns a value that’s an integer.     
	Line 5 uses the `return` keyword, followed by the `numberOfPetals` variable name, to return the resulting `numberOfPetals` value.      
	When a method returns a variable value, the variable data type must match the return type that the method declared. In this case, the `wilt` method is expected to return an integer value and the `numberOfPetals` variable is an integer. 


- [With sharing](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_keywords_sharing.htm)    
If we declare a class as a `with sharing`, __[Sharing rules](https://www.tutorialkart.com/salesforce/sharing-rules-salesforce-salesforce-security/)__ given to the current user will be taken into the consideration and the user can access or perform the operations based on the permissions given to him on object and fields (Field Level Security, Sharing rules).
    ```
    public with sharing class MyApexClass {
        //statement(s)
    }
    ```

- [Without sharing](https://www.tutorialkart.com/apex_soql/apex-access-modifiers-with-sharing-without-sharing/)    
If we declare a class as a `without sharing`, then this Apex class runs in system mode which means Apex code has access to all the objects and field irrespective of current users sharing rules, [field level security](https://www.tutorialkart.com/salesforce/salesforce-security-field-level-security-admin-tutorials/) and Object permissions.    
    ```
    public without sharing noSharing{
        //statement(s)
    }
    ```

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)
	
## [Conditional Statements](https://www.levelupsalesforce.com/if-statements-in-apex)

  - __if__, __if else__    
	An __if__ statement consists of a condition followed by one or more statements.  
	If the condition is true, then the code inside of the if statement is executed.    
	If its false, then the first set of code after the end of the if statelent will be executed (after the parenthesis).  
	
    ```
    if(boolean condition){
      // code block
    }
    else if(boolean condition) {
      // code block
    }
    else {
      // code block
    }
    
    ```
	
  - Switch Statements   
 the Switch statement allows us to write if / else logic
      ```
      switch on expression {
        when value1, value2{
          // code block
        } 
        when value 3 {
          // code lock
        } 
        when value 4{
          // code blcok
        }
      }
      ```
	
  - Ternary Operators   
   Uses ? :    
   `(boolean condition) ? value if true : value if false`

  - eg.:   
    if else block with for loops.
    ```
    Integer totalSum = 0;
    List<Integer> listOfNumbers = new List<Integer>();
    for(Integer i = 1; i<= 10; i++) {
        listOfNumbers.add(i);
    }
    System.debug('listOfNumbers: ' + listOfNumbers);


    for(Integer i = 1; i<listOfNumbers.size(); i++) {
        if(Math.mod(listOfNumbers[i],2) == 0) {				//mod() = modulo, and the [i],2 means, if it is even number (divisible by 2 and remainder is 0)
            totalSum = totalSum + listOfNumbers[i];
            System.debug('totlaSum value: ' + totalSum);
        }
    }
    System.debug('Final summation: ' + totalSum);

    // Final Summation: 30
    ```
---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)
	
## Iterating Collections

- __while loop__   
A whileloop statement in Apex repeatedly executes a target statement as long as a given condition is true.    
  ```
  Integer count = 1;
  while (count < 10) {
      system.debug(count);
      count++;
  } 
  ```
  ```		    
  Integer count = 1;

  while (count < 11) {
      System.debug(count);
      count++;
  }
  ```
	
- __do-while loop__    
Repeatedly executes a block of code asl ong as a particular condition remains true.    
It is __guaranteed to execute at least one time__.
    ```
    Integer count = 1;
    do{
        system.debug(count);
        count++;
    }
    while (count < 10);
    ``` 
	
	
- for loop      
   A for loop is a repetition control structure that allows you to efficiently write a loop that needs to execute a specific nulber of times.   
		       
  - eg.:     
     *Making a list of Integer values*     
    ```
    List<Integer> listOfNumbers = new List<Integer>();
    Integer maxListSize = 5;
    for(Integer i = 0; i<maxListsize; i++) {
        listOfNumbers.add(i);
    }
    System.debug('listOfNumbers: ' + listOfNumbers);

    //listOfNumbers: (0,1,2,3,4)
    ```   

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)

## [Apex Classes & OOP](https://www.salesforcetutorial.com/apex-class/)
it is a blueprint (template) from which objects are created.   
One of the benefits of Apex classes is code reuse.   
*An object is an instance of a class.*  
	
Class is constracted by 3 parts:
- constructor - used for memory allocation and initialization
- state - member __variables__(they define the state)
- behaviour - memeber functions/methods (they define the behaviour)  

A class can contain: 
- variables: 
    - specifies the state of an object (object's name, object's type)
    - since they qre qssociqted with class (they are members of it) → member variables
- methods     

__Declaring a class__        

|`public`       |  `class` |  `Flower`  | `{ body }` |   
|:--------------|:---------|:-----------|:-----------|	
|Access Modifier|  Keyword | Class Name |   the code |
	
	
*creating a simple class:*   
`class` keyword + `name`   
like:   	
```
class ClassName [implements InterfaceNameList][extends ClassName]
{
  //body of the class
}
```   

__Access Modifier__    
An access modifier is a keyword in a class or method declaration.      
The access modifier determines what other Apex code can see and use the class or method.     
	
__Methods__      
Methods are defined within a class.     
A method describes the behaviors inherited by objects of that class. A class can have one or more methods.    

 - __declaring a method__    

|`public`       |  `static` |  `Intiger`  | `growBig`    |`( numberOfMeters)`| `{ body }`    |  
|:--------------|:----------|:------------|:-------------|:------------------|:--------------|	
|Access Modifier|  Keyword  | Return Type |  Method Name | Parameter         |body of method |     
	
	
- eg.: 
  ```
  public class Demo1 {

      // adding a method
      public void printOutput(String stringToDisplay) {
          System.debug('Display text: '+ stringToDisplay);
      }    
  }
  ```   

eg.:  
```
public class MyApexClass {
    public static void MyApexMethod() {
        system.debug('Hello World');
    }
}
``` 
     	
	
__Parameter__  
A parameter is a variable that serves as a placeholder, waiting to receive a value. Parameters are declared similarly to a variable, with a data type followed by the parameter name.     
	


- [top level class](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_defining.htm): an outer class
- [inner class](https://www.levelupsalesforce.com/salesforce-inner-class): inside of the outer class
- mandatory to use [access modifiers](https://www.javatpoint.com/access-modifiers):    
modifiers specifies the accessibility or scope of a field, method, constructor, or class.   
 We can change the access level of fields, constructors, methods, and class by applying the access modifier on it.   
 In Apex for a declaration of a class we have to use __public__, __global__, __private__.

 - not necessary to use access modifiers in the declaration of the inner classes
 __Save an Apex Class__

  *A [trigger]() generally causes a program routine to be executed.*

  Notes: 
  -  public method `sendMail()` that sends email and uses built-in Messaging methods of the Apex class library
  - this class has a private helper method `inspectResults()`, which can’t be called externally because it is private but is used only within the class

  - Create an email message object
    ```
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    ```
  - `Anonymous Apex` allows you to run lines of code on the fly and is a handy way to invoke Apex, especially to test out functionality. 


- class access specifier:
`private | public | global` 
  - private: can be accessed locally, can be only accessed by the member function of the same class
  - public: everybody can access everything
  - global: typically for managed packages

- class can not run by itself. We need a sort of invocation method to run it.   
  `classTypeName variableName =  new classTypeName()`   
  `new classType()` invokes the cunstructor of a class.  
	
	
  *intitalizing*
  ```
  Demo1 d1 = new Demo1();
  ```
  *calling the method*
  ```
  d1.printOutput('Hello!');
  ```

[useful video]((https://www.youtube.com/watch?v=TCxOlvxT8l4))
---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)

## Object
an object is an instance of a class *i.e. a class in action*
- object = instance
- instantiation: the way, a process as a class turn into an instance   
  - `MyClass m1 = new MyClass();` (MyClass = datatype | m1 = variable)  
  - Once we created a class, the `new` keyword tells to the APex runtime, that "you need to allocate memory for that class".


	---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)

## Methods
reusable code snippets, which have a specific purpose (usually a single job: like adding together numbers)

- defining a method:    
  access sepcifier (private|public|global) [name of the method] (input paramters) 
  ```   
  public Integer addNumbers(Integer num1, Integer num2){
    // body of the method
  }
  ```
  - the parameter's datatype has to be specified
  - methods are in the class: 
    ``` 
      class Myclass{
        Integer num1
        Integer num2

        public addNumbers() {

        }
      }
    ```

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)	
	
## Static vs Instance variables and methods
static variables and methods:
- class based: meaning that as soon as a class is loaded in the Apex runtime, the class variables and methods will allocate a memory (no `new` keyword).
- not replacable: only exist once/class
- initialize: when a class loads 
- syntax:    
`MyClass.staticMethodName();`

instance variables and methods:
- object based: we need to make a `new` call to allocate memory to the instance variables.
- can be replicated
- initialize: when instance is created
- syntax:    
`MyClass m1 = new MyClass();
  m1.instanceMethodName();`

- eg.:    

```
public class Demo2 {
	
    public String helloWorldString;							      // Member Instance variable
    private static final String DEFAULT_STRING;				// Static Member variable (CONSTANT)
    
    static{													                  // Static Initialiser Block | runs only once when the class is loaded
        DEFAULT_STRING = 'Hellow World';					    // giving a value to the CONSTANT
    }
    
    public Demo2(){											              // Constructor 
        this(DEFAULT_STRING);								          // 'this' internally points to the instance, and calls the Overloaded Constructor
    }
    
    public Demo2(String stringToDisplay){					    // Overloaded Constructor 
        this.helloWorldString = stringToDisplay;			// this = refers to the current isntance of the class
    }
    
    public void printOutput(){								      // Instance Method
         System.debug('Display text: ' + helloWorldString);
    }
    
    public static void printOutput2(){						// Static Method
        System.debug('Display from static method');
    }
}
```
*calling the methods*
```
// calls the default method
Demo2 d2 = new Demo2();
d2.printOutput();

// calls the overloaded constructor
Demo2 d2 = new Demo2('Hello Miklos');
d2.printOutput();

//Calling the Static Method - no need for the 'new' keyword
Demo2.printOutput2();
```
*the output:*
```
Hello World
Hello Miklos
Display from static method
```

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)
	
## Pasing by Value vs Passing by Reference
When we ass input paramteres to methods, there are 2 ways.

__Pass by Value__
- all primitve datatypes passed by value
- a copy of the original variable created and passed to the method
- any changes only happens on that "copy" variable, and not the original

__Pass by Reference__
- the actual variable itself sent to the variable
- any changes on that variable are actually happening on the original variable

<br>

- eg.:   
  *Pasing by Value vs Passing by Reference*
  ```
  public class Demo3 {

      public void mainValueMethod(){								// this method is making a call to the assByValue method
          
          String websiteUrl = 'www.apexhours.com';
          
          System.debug('Before value call ' + websiteUrl);
          passByValueCall(websiteUrl);
          System.debug('After value call ' + websiteUrl);
      
      }
    
        private void passByValueCall(String websiteUrlValue){		//Pass by Value call
            websiteUrlValue = 'www.salesforce.com';
      }
     
      public void mainReferenceMethod(){							// this method is making a call to the passByRefCall method
          
          Account a = new Account();
          a.Name = 'Test account';
          a.Website = 'www.apexhours.com';
              
          System.debug('After reference call ' + a);
      }
      
      private void passByRefCall(Account a){					//Pass by Reference call
          a.Website = 'www.salesforce.com';
      } 
  }
  ```
  *calling the methods*
  ```
  Demo3 d3 = new Demo3();

  d3.mainValueMethod();

  d3.mainReferenceMethod();
  ```
  /*the output:*/
  ```
  After value call www.apexhours.com
  After value call www.apexhours.com

  After reference call Account:{Name=Test account,  Website=www.apexhours.com}
  ```
  ---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)
	
## [Trigger](https://www.tutorialspoint.com/apex/apex_triggers.htm)    
Apex triggers are a piece of code which enables users to perform custom actions when a particular event occurs.    
__A trigger executes before and after an event occurs on Salesfroce record.__    
Changes can be: insertion, updating or deletion of records.    

- a trigger definition starts with ètriggerè keyword, then the name of the trigger, then the Salesforce object that the trigger is associated with and last the trigger events.   
    ```
    trigger TriggerNale on ObjectName (trigger_events) {
        // block of code
    }
    ```

    *This trigger throws us an error when we try to create a newAccoubt with the same name (of an already existing account)*
    ```
    trigger AccountDuplication on Account (before insert) {
        // creating a for loop
        for(Account acc:Trigger.new) {
            // this statement gives us the Account name
            List<Account> mynew = [select ID, Name from Account where Name =: acc.Name];

            //check for a condition
            //size context variable returns the total number of records on a trigger invocation
            //If its > 0 throws an error message
            if(mynew.size()>0)

            acc.Name.addError('Account with the same name already exiting');
        }
    }
    ```

---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#apex)


# API    

## [Lightning Platform APIs](https://developer.salesforce.com/docs/atlas.en-us.214.0.api_rest.meta/api_rest/intro_what_is_rest_api.htm)       
APIs that let us access the Salesforce data in a variety of ways.    

 Every object in our org has an API name that lets us access data for that object.    

---

<br>	
	
👈[back to contents](https://github.com/Klosmi/salesforce#api)
	
	
## [Salesforce APIs](https://help.salesforce.com/s/articleView?id=sf.integrate_what_is_api.htm&type=5)      

__SOAP API__       
Integrate your org’s data with other applications using standard SOAP protocols.        

__REST API__       
Access objects in your org using standard REST protocols.     
	
__Metadata API__       
Manage customizations in your org and build tools that manage your metadata model.     
	
__Tooling API__       
Build custom development tools for platform applications.     

__Marketing Cloud API__       
Expose Marketing Cloud capabilities with the REST API and get comprehensive access to most email functionality with the SOAP API.     
	
__Bulk API__       
Load, delete, and perform asynchronous queries on large data sets.     
	
__Streaming API__       
Send and receive notifications securely and efficiently. Notifications can reflect data changes in your org, or custom events.      
	
__Connect REST API__       
Build UI for Commerce, CMS-Managed Content, Experience Cloud Sites, Files, Notifications, Topics, and more.     
	
__Mobile SDK__       
While it’s technically a software development kit, it’s worth including here. Integrate Native or Hybrid mobile apps directly with Salesforce.    
	
---

<br>	
	
👈[back to contents](https://github.com/Klosmi/salesforce#api)
