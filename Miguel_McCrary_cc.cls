    //Lead off your class with the following comment, filled out with 
    //your information.

    /////////////////////////////////////////////////////////////////
    //
    // Name: Coding Challenges
    // Author: Miguel (miguel.mccrary@revature.net)
    // Date: 04/23/2021
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////

    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    

    public static Integer nFibonacci( Integer n )
        {   
            if (n <= 1)
            {
               return n; 
            }
         	return nFibonacci(n-1) + nFibonacci(n-2);
           
        }

        //For loop to show a list of nth numbers in the fibonacci sequence 
	for (Integer i = 0; i <=10; i++)
        {
		System.debug(nFibonacci(i));
	}
    

    /*
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    //Tested with execute anonymous
public static List<Integer> sortList( List<Integer> orderedIntegerList ) {


for(Integer i = 0; i < orderedIntegerList.size(); i++)
{
    for(Integer j = i+1; j < orderedIntegerList.size(); j++)
    {
        Integer greaterNum;
        if(orderedIntegerList[i] > orderedIntegerList[j])
        {
            greaterNum = orderedIntegerList[i];
            orderedIntegerList[i] = orderedIntegerList[j];
            orderedIntegerList[j] = greaterNum;
            
        }    
    }
  
}
for(Integer g:orderedIntegerList)
{
system.debug('' + g);
}
return orderedIntegerList;
}
List<Integer> orderedIntegerList = new List<Integer>{2, 4, 5, 1, 3, 1};
System.debug(sortList(orderedIntegerList));

    
    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */

    //Tested with execute anonymous
    public static Integer nFactorial( Integer n) 
{
    Integer i, fac = 1;
    for(i=1;  i <= n; i++)
    {
        fac = fac * i;
    }
    
return fac;
}
Integer num = 11;
for(Integer j = 1; j <= num; j++)
{
    System.debug('Factorial of ' + j + ' is ' + nFactorial(j));
}

    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */

    public static List<Integer> rotateLeftNTimes( List<Integer> rotatedIntegerList, Integer n) 
{  	//for loop for the number of shifts the list will go through
    for (Integer i = 0; i < n; i++) {

      // Remove first element from list 
      Integer temp = rotatedIntegerList[0];
       
      // for loop to set current indexes value to next indexes value
      for (Integer j = 0; j < rotatedIntegerList.size() - 1; j++) {
        rotatedIntegerList[j] = rotatedIntegerList[j + 1];
      }
        //Add first element to the end of the list after the rest of the array is shifted to the left
      rotatedIntegerList[rotatedIntegerList.size() - 1] = temp;
    }
    
    return rotatedIntegerList;

  }
//for loop to display a list only when it was 1, 3 or 6 rotations
for(Integer k = 1; k <= 6; k++)
{
    if (k == 1 || k == 3 || k == 6)
    {
		Integer n = k;
		List<Integer> rotatedIntegerList = new List<Integer>{1, 2, 3, 4, 5};
		System.debug('Here is the list after ' + k + ' rotation(s) to the left ' + rotateLeftNTimes(rotatedIntegerList, n)); 
    }
}

    /*
     * 5. Balanced Brackets
     * A bracket is any one of the following: (, ), {, }, [, or ]
     * 
     * The following are balanced brackets:
     *    ( )
     *    ( ) ( )
     *    ( ( ) )
     *    ( { [ ] } )
     *
     * The following are NOT balanced brackets:
     *   (
     *   )
     *   ( ( )
     *   ( [ ) ]
     *
     * Return true if balanced
     * Return false if not balanced
    */
    public static Boolean bracketsAreBalanced( String s ) {

    }

    /* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */

    /*
     * 6. Create a method that retrieves a list of all accounts and updates those accounts.
     *      Create a custom field on the Account standard object called Size__c that will be a 
     * picklist containing small/medium/large.
     *     Create a method that retrieves a list of all accounts. 
     *         - If an account has between 1-1000 employees then it is classified as small.
     *         - If an account has between 1001-10000 employees it is classified as medium.
    *         - If an account has more than 10000 employees it is classified as large.
     *     Update the Size__c field on each account to reflect the amount of employees in the Account.
    */
    public static void updateAccountSize( ) {

        Set<Course__c> courseDuplicatesSet = new Set<Course__c>();
    }

    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads( ) {

    }

    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ) {

    }

    /*  
     *  9. questionMarks declares the str parameter, which can have numbers, letters, and question marks.
     *  It will then check str to see if there are exactly 3 question marks between every pair of two numbers that add up to 10.
     *   If there are, questionMarks returns true. In any other case (including the case where str doesn't contain any two numbers that sum to 10),
     *   questionMarks will return false.
     *
     *   For example, when given the String "arrb6???4b5???ef5", questionMarks returns true because there are 3 question marks between 6 and 4 and
     *   another 3 question marks between 5 and 5 (and both pairs of numbers sum to 10).
     *
     *  Other examples:
     *      str = "aa6?9" => questionMarks returns false
     *      str = "a?7??s?3r1?????5" => questionMarks returns true because there's at least one pair of numbers that sum to 10 (7 and 3) and 3
     *          question marks between those numbers
    */
    public static Boolean questionMarks(String str) {
    }

    /*
     *   10. multipleCounter returns the number of multiples of the Integer n that exist in the inclusive range [firstNum, secondNum].
     *   You can assume that firstNum < secondNum in all cases.
     *
     *   Examples:
     *       firstNum = 1, secondNum = 6, n = 5 => multipleCounter returns 1 because there is one multiple of 5 in the range [1, 6] (which is 5)
     *       firstNum = 2, secondNum = 12, n = 2 => multipleCounter returns 6 because there are 6 multiples of 2 in the range [2, 12] 
     *          (which are 2, 4, 6, 8, 10, and 12)
    */
    public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
    }
    
    /*
     *   11. palindromicity declares a parameter str and returns the degree of palindromicity for that string - i.e. the smallest possible number
     *   of palindromes needed to construct the string.
     *
     *   Examples:
     *      str = "a" => palindromicity returns 1 because "a" backwards is "a"
     *      str = "b3b" => palindromicity returns 1 because "b3b" backwards is "b3b"
     *
     *      str = "ty" => palindromicity returns 2 because str can be broken into two 1 letter palindromes ("t" and "y")
     *      str = "343hmh" => palindromicity returns 2 because str can be broken into two 3 letter palindromes ("343" and "hmh")
     *
     *      str = "iotoihannahracecar" => palindromicity returns 3 because str can be broken into 3 palindromes ("iotoi", "hannah", and "racecar")
     *      str = "abcbabcbabab" => 2. pretty sure it's greedy
     *      str = "abcbabcbababa" => 3. both ways: "abcbabcba" "bab" "a" or "ababa" "bcbabcb" "a"
     *      str = "ababbbabbababa" => 4. NOT GREEDY. 'a' 'babbbab' 'b' 'ababa' is the answer. 
     *                                    'aba' 'bbb' 'abba' 'b' 'aba' is the greedy answer.
    */
    public static Integer palindromicity(String str) {
    }
