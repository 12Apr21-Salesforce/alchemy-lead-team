
    // Lead off your class with the following comment, filled out with 
    // your information.

    /////////////////////////////////////////////////////////////////
    //
    // Name: Coding Challenges
    // Author: Name (Email)
    // Date: 00/00/0000
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////

    // Write the following methods in a class called P0B. 
    // Note: The method signatures are given.
public class P0B {
    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    public static Integer nFibonacci( Integer n ){
        // Set up a result list.
        List<Integer> result = new List<Integer>();
        // add 0 and 1 to the list as starter.
        result.add(0);
        result.add(1);
        // count from 2 to n
        for (Integer i = 2; i <= n; i++) {
            // get the last, 2nd last element in the list.
            Integer a = result[result.size() - 1];
            Integer b = result[result.size() - 2];
            // push addition to the list.
            result.add(a + b);
        }
        // return last element.
        System.debug(result[result.size() - 1]);
        return result[result.size() - 1];
    }

    /*
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    public static List<Integer> sortList( List<Integer> intList ) {
        
        // bubble sort

        // loop over the list
        for (Integer i = 0; i < intList.size(); i++) {
            // 1 less element to look each iteration
            for (Integer j = 0; j < (intList.size() - i - 1); j++) {
                // if current element is greater than the following element,
                if (intList[j] > intList[j + 1]) {
                    // store smaller value, set value of next index to be current value,
                    // and set current index to be the value stored.
                    Integer tempLesser = intList[j + 1];
                    intList[j + 1] = intList[j];
                    intList[j] =  tempLesser;
                }
            }
        }
        return intList;

        // result.add(intList[0]);

        // for (Integer i = 1; i <= intList.size(); i++) {
        //     if (result[0])
            // for (Integer j = i + 1; j <= intList.size() - 1; i++) {
            //     if (j < i) {
            //         intList[i] = j;
            //         intList[j] = i;
            //     } else if (j == i) {
            //         intList[i + 1] = j;
            //         intList[j] = intList[i + 1];
            //     }
            // }
        // }
    }
    // run with:
    // List<Integer> param = new List<Integer>{2,4,5,1,3,1};
    // Challenge.sortList(param);


    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    public static Integer nFactorial( Integer n) {
        Integer num = 1;
        // loop, multiply from 1 to n passed in
        for(Integer i = 1; i <= n ; i++) {
            num = num * i;
        }
        System.debug(num);
        return num;
    }

    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */
    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {
        // set up a counter
        Integer counter = 0;
        // until counter hits n,
        while (counter < n) {
            // set up a variable to hold first element in nList.
            Integer num = nList[0];
            // loop over the list,
            for(Integer i = 1; i < nList.size(); i++) {
                // move every element left one index
                nList[i - 1] = nList[i];
            }
            // set the first element to be the last element.
            nList[nList.size() - 1] = num;
            // increment counter
            counter++;
        }
        System.debug(nList);
        return nList;
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
        List<String> openBrackets = new List<String>{'[', '(', '{'};
        List<String> closeBrackets = new List<String>{']', ')', '}'};
        List<String> strList = cleanseString(s).split('');
        List<Integer> stack = new List<Integer>();

        // Loop over the strList
        for (Integer i = 0; i < strList.size(); i++) {
            // if element is one of open brackets,
            if (openBrackets.contains(strList[i])) {
                // add corresponding index number in the `openBrackets` List
                stack.add(openBrackets.indexOf(strList[i]));
            }else if (!openBrackets.contains(strList[i]) && stack.size() != 0){
                // otherwise, and  only if stack is not empty,
                // check if the closing bracket index does not match the number we have at the top of stack.
                if (stack.remove(stack.size() - 1) != closeBrackets.indexOf(strList[i])) {
                    System.debug(false);
                    // if so, not balanced.
                    return false;
                }
            }
        } 
        // balanced if we got nothing at the end of loop, not balanced otherwise.
        if (stack.size() == 0) {
            System.debug(true);
            return true;
        } else {
            System.debug(false);
            return false;
        }
    }
    
    // method for brackets challenge..
    public static String cleanseString(String s) {
        // split to use List methods
        List<String> strList = s.split('');
        // define brackets
        List<String> brackets = new List<String>{'(',')','{','}','[',']'};
        // new List to hold only brackets
        List<String> newStrList = new List<String>();
        // loop over the list
        for (String str: strList) {
            // if element is one of the brackets specified,
            if (brackets.contains(str)) {
                // add to the new list
				newStrList.add(str);
            }
        }
        // join the list back to string and return it
        System.debug(String.join(newStrList, ''));
        return String.join(newStrList, '');
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
        // set up an sObject to store data, query NumberOfEmployees field.
        List<Account> accounts = [SELECT NumberOfEmployees FROM Account];
        System.debug(accounts);
        // if there are any record
        if (accounts.size() > 0) {
            // for each acc record in accounts sObject,
            for (Account acc : accounts) {
                // add field Size__c to sObject and set each value according to each records' NumberOfEmployees
                if (acc.NumberOfEmployees > 10000) {
                    acc.Size__c = 'Large';
                } else if (acc.NumberOfEmployees > 1000) {
                    acc.Size__c = 'Medium';
                } else {
                    acc.Size__c = 'Small';
                }
            }
            // update
            update accounts;
        }
    }

    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads( ) {
        // Query Status field of records with State='CA', store it in sObject
        List<Lead> leads = [SELECT Status FROM Lead WHERE State = 'CA'];
        // if there are any record
        if (leads.size() > 0) {
            for (Lead lead : leads) {
            // create Status field in sObject, set it to 'Closed - Not Converted'
            lead.Status = 'Closed - Not Converted';
            }
            // update
            update leads;
        }
        
    }

    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ) {
        // get today's date
        Date today = date.today();
        // Query, filter it with the date stored and by StageName
        List<Opportunity> opps = [SELECT CloseDate FROM Opportunity WHERE CloseDate < :today AND StageName != 'Closed Won'];
        // if there are any record
        if (opps.size() > 0) {
            for (Opportunity opp : opps) {
                // Set StageNames of sObject.
                opp.StageName = 'Closed Lost';
            }
            // update
            update opps;
        }
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
     *      str = "a?7???3r1?????5" => questionMarks returns true because there's at least one pair of numbers that sum to 10 (7 and 3) and 3
     *          question marks between those numbers
    */
    public static Boolean questionMarks(String str) {
        // if number,
        // check if next 3 chars are ??? followed by number.
        // if so, check if two numbers add up to 10
        // otherwise, return false.
        Integer counter = 0;
        List<String> splitStr = str.split('');
        for (Integer i = 0; i < splitStr.size(); i++) {
            System.debug(splitStr[i].isNumeric() + ', ' + splitStr[i + 4].isNumeric());
            if (splitStr[i].isNumeric() && numbersAddUpToTen()) {
                System.debug('Hi');
            }
        }
         return true;
    }

public static Boolean numbersAddUpToTen(List<String> strList, Integer i) {
    try {
        Integer nextNum = strList[i + 4];
        if (strList[i] + nextNum == 10) {
            return true;
        } else {
            return false;
        }
    } catch (Exception e) {
        System.debug(e);
    }
}

        //String str = 'abcd';
        //String s = String.join(str.split(''), '');
    	//System.debug(s);
    	

    /*
     *   10. multipleCounter returns the number of multiples of the Integer n that exist in the inclusive range [firstNum, secondNum].
     *   You can assume that firstNum < secondNum in all cases.
     *
     *   Examples:
     *       firstNum = 1, secondNum = 6, n = 5 => multipleCounter returns 1 because there is one multiple of 5 in the range [1, 6] (which is 5)
     *       firstNum = 2, secondNum = 12, n = 2 => multipleCounter returns 6 because there are 6 multiples of 2 in the range [2, 12] 
     *          (which are 2, 4, 6, 8, 10, and 12)
                4, 6, 8, 10, 12 // 6, 8, 10, 12
            
    */

    public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
        // if firstNum is less than or equal to n
        if (firstNum <= n) {
            // return secondNum / n
            System.debug(secondNum / n);
            return (secondNum / n);
        } else {
            // otherwise, do some calculation
            Integer constant = Integer.valueOf(
                Math.ceil(double.valueOf(firstNum) / double.valueOf(n))
            );
            System.debug((secondNum / n - constant) + 1);
            return (secondNum / n - constant) + 1;
        }
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
        Interger count = 0;
        List<String> originalList = str.split('');
        List<String> newList = new List<String>();
        
        for(Integer i; i < originalList.size(); i++) {
            newList.add(originalList[0]);
            originalList.remove(0);
            if (newList.length() >= 2) {
                String testStr = String.join(newList, '');
                if (isPalindrome(testStr)) {
                    count++;
                    newList.clear();
                } else {
                    
                }
            }
        }

        // split string, add first element to a new List while removing it from the original List.
        // every time an element is added to a new list, check if list has palindrome
        // if yes, increment counter and delete list.
        // if no, continue adding more elements.
        // return counter
    }
    // is palindrome
    public static Boolean isPalindrome(String str) {
        String reversed = str.reverse();
        return str == reversed;
    }
    // handler
    public static void handler(List<String> originalList, List<String> newList) {
        newList.add(originalList[0]);

        // if (isPalindrome(testStr)) {
        //     count++;
        //     newList.clear();
        // } else {
            
        // }
    }
}


