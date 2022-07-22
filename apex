# Apex

## What is Apex?
Apex is a programming language that uses Java-like syntax and acts like database stored procedures.   
 Apex enables developers to add business logic to system events, such as button clicks, updates of related records, and [Visualforce](https://trailhead.salesforce.com/en/content/learn/modules/visualforce_fundamentals/visualforce_creating_pages#:~:text=Visualforce%20pages%20are%20basic%20building,on%20a%20traditional%20web%20server.) pages.

 *(To customize the front-end UI and functionality of your org, use Visualforce and Lightning Web Components.)*

- Cloud development as Apex is stored, compiled, and executed in the cloud.
- Database statements that allow you to make direct database calls and query languages to query and search data.
- The global access modifier, which is more permissive than the public modifier and allows access across namespaces and applications.

<br>

## Data Types Overview
 data type specific to Salesforce—the `sObject` data type
- A primitive, such as an Integer, Double, Long, Date, Datetime, String, ID, Boolean, among others.
- An sObject, either as a generic sObject or as a specific sObject, such as an Account, Contact, or MyCustomObject__c.
- A collection, including:
  - A list (or array) of primitives, sObjects, user defined objects, objects created from Apex classes, or collections
  - A set of primitives
  - A map from a primitive to a primitive, sObject, or collectio

 - A typed list of values, also known as an __*enum*__
 - User-defined Apex classes
  - System-supplied Apex classes

<br>

## [Apex Collections](https://developer.salesforce.com/docs/atlas.en-us.224.0.apexcode.meta/apexcode/langCon_apex_collections.htm): 
### [List](https://developer.salesforce.com/docs/atlas.en-us.224.0.apexcode.meta/apexcode/langCon_apex_collections_lists.htm)
Lists hold an ordered collection of objects.   
__Lists in Apex are synonymous with arrays__ and the two can be used interchangeably.
 
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
    for(Integer i=0;i<colors.size();i++) {

        // Write value to the debug log
        System.debug(colors[i]);
    }
    ```

## [Apex Classes](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_defining.htm)
One of the benefits of Apex classes is code reuse.

We can define top-level classes (also called outer classes) as well as inner classes, that is, a class defined within another class
- eg.:   
  ```
  public class myOuterClass {
  // Additional myOuterClass code here
    
    class myInnerClass {
    // myInnerClass code here
    
    }
  }
  ```
 __Save an Apex Class__

  *A trigger generally causes a program routine to be executed.*

  Notes: 
  -  public method `sendMail()` that sends email and uses built-in Messaging methods of the Apex class library
  - this class has a private helper method `inspectResults()`, which can’t be called externally because it is private but is used only within the class

  - Create an email message object
    ```
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    ```
  - `Anonymous Apex` allows you to run lines of code on the fly and is a handy way to invoke Apex, especially to test out functionality. 

<br>

## Inspect Debug Logs
Debug logs are useful for debugging your code. 

- `sendMail()` called the `inspectResults()` helper method, which writes messages to the log by using the `System.debug()` method to indicate whether the email send operation was successful or not.

<br>

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

<br>

<br>

---

<br>

# Data Types, Lists, arrays

- a String in a method is with sing quotation marks `''`   
eg.: 
`System.debug('Hello');`

- List  
  ```
  List<Integer> listOfNumbers = new List<Integer>();
	  listOfNumbers.add(1);
	  listOfNumbers.add(2);
	  listOfNumbers.add(3);
	  listOfNumbers.add(3);
	  listOfNumbers.add(1);
  System.debug('listOfNumbers' + listOfNumbers);

  // output:
  //listOfNumbers(1,2,3,3,1)
  ```

- Set = arrays.   
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

- MAP  
  we define datatype four 2 different element.
  `Map< key, vlaue> variable = new Map< key, value>();`
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

# Iterating Collections

- Do While loop
- While loop
  ```
  Integer count = 1;

  while (count < 11) {
      System.debug(count);
      count++;
  }
  ```
- for loop
  - eg.:   
    ```
    List<Integer> listOfNumbers = new List<Integer>();
    Integer maxListSize = 5;
    for(Integer i = 0; i<maxListsize; i++) {
        listOfNumbers.add(i);
    }
    System.debug('listOfNumbers: ' + listOfNumbers);

    //listOfNumbers: (0,1,2,3,4)
    ```

# Conditional Statements

  - If Else...
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

# [Class](https://www.youtube.com/watch?v=TCxOlvxT8l4)
user defined datatype, acts as a blueprint for their instances
It is constracted by 3 parts:
- constructor - used for memory allocation and initialization
- state - member __variables__(they define the state)
- behaviour - memeber functions/methods (they define the behaviour)  

```
class ClassName [implements InterfaceNameList][extends ClassName]
{
  //body of the class
}
```
- class access specifier:
`private | public | global` 
  - private: can be accessed locally, can be only accessed by the member function of the same class
  - public: everybody can access everything
  - global: typically for managed packages

- class can not run by itself. We need a sort of invocation method to run it.   
  `classTypeName variableName =  new classTypeName()`   
  `new classType()` invokes the cunstructor of a class.   
- eg.: 
  ```
  public class Demo1 {

      // adding a method
      public void printOutput(String stringToDisplay) {
          System.debug('Display text: '+ stringToDisplay);
      } 
      
  }
  ```
  *intitalizing*
  ```
  Demo1 d1 = new Demo1();
  ```
  *calling the method*
  ```
  d1.printOutput('Hello!');
  ```


# Object
an object is an instance of a class *i.e. a class in action*
- object = instance
- instantiation: the way, a process as a class turn into an instance   
  - `MyClass m1 = new MyClass();` (MyClass = datatype | m1 = variable)  
  - Once we created a class, the `new` keyword tells to the APex runtime, that "you need to allocate memory for that class".

# Methods
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

# Static vs Instance variables and methods
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

# Pasing by Value vs Passing by Reference
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
  
