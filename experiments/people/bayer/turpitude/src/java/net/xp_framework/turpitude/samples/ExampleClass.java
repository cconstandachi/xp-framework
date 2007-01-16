package net.xp_framework.turpitude.samples;

public class ExampleClass {
    int intval = 0;
    String stringval = "";

   /**
    * default constructor
    */
    public ExampleClass() {
        System.out.println("ExampleClass: Constructor() called");
    }

   /**
    * int constructor
    */
    public ExampleClass(int i) {
        System.out.println("ExampleClass: Constructor(int) called: " + i);
        intval = i;
    }

   /**
    * string constructor
    */
    public ExampleClass(String s) {
        System.out.println("ExampleClass: Constructor(String) called: " + s);
        stringval = s;
    }

   /**
    * int constructor
    */
    public ExampleClass(int i, String s) {
        System.out.println("ExampleClass: Constructor(int, String) called: " + i + " " + s);
        intval = i;
        stringval = s;
    }

    /**
     * set both vals
     */
    public void setValues(int i, String s) {
        System.out.println("ExampleClass: setValues(int, String) called: " + i + " " + s);
        intval = i;
        stringval = s;
    }

    public String toString() {
        String retval = "ExampleClass, intval: " + intval + " stringval: " + stringval;
        System.out.println("ExampleClass: toString(): " + retval);
        return retval;
    }
    

}

