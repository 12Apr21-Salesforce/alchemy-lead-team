    Lead off your class with the following comment, filled out with 
    your information.

    /////////////////////////////////////////////////////////////////
    //
    // Name: Coding Challenges
    // Author: Name (Email)
    // Date: 00/00/0000
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////

    Write the following methods in a class called P0B. 
    Note: The method signatures are given.

    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    public static Integer nFibonacci( Integer n ){
       if(n==0){
            return 0;
        }else if(n==1){
            return 1;
        }
        return nFibonacci(n-1)+nFibonacci(n-2);
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
        Integer n=intList.size();
        for(Integer i=0; i<n; i++){
            for(Integer j=1; j<n-i; j++){
                if(intList[j-1]>intList[j]){
                    Integer temp;
                    temp=intList[j-1];
                    intList[j-1]=intList[j];
                    intList[j]=temp;
                }
            }
        }
        return intList;
    }

    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    public static Integer nFactorial( Integer n) {
        if(n<2){
            return 1;
        }
        Integer result=1;
        for (Integer i=1; i<n+1; i++){
            result*=i;
        }
        return result;
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
        for(Integer j=0; j<n; j++){
            Integer tmp=nList[0];
            for(Integer i=0; i<nList.size()-1; i++){
              nList[i]=nList[i+1];
            }
            nList[nList.size()-1]=tmp; 
        } 
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
       Boolean flag= true;
       Integer i=0;
       Integer j=s.length()-1;
       while(i>j){
           if (s.charAt(i)!=s.charAt(j)){
               flag=false;
           }
           i++;
           j--;
       }
       return flag;
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
        List<Account> accs=[select Id, Name, NumberOfEmployees, Size__c from Account];
        for (Account acc : accs){
            if(acc.NumberOfEmployees>1 && acc.NumberOfEmployees<1000){
                acc.Size__c='samll';
            }else if(acc.NumberOfEmployees>1001 && acc.NumberOfEmployees<10000){
                acc.Size__c='medium';
            }else{
                acc.Size__c='large'; 
            }
        }
       update accs;

    }

    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads( ) {
        List<Lead> leads=[SELECT Id, StateCode, Name, Description, Status FROM Lead where StateCode like '%ca%'];
        for (Lead ld : leads){
            ld.Status='Closed - Not Converted';
            ld.Description='We are no longer doing business in California.';
        }
        update leads;
    }

    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ) {
      List<Opportunity> opps=[SELECT Id, Name, CloseDate, StageName FROM Opportunity where StageName !='Closed Won'];
      for (Opportunity opp : opps){
          if(opp.CloseDate<Date.today()){
            
              opp.StageName='Closed Lost';
          }
      }
      update opps;
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
        Boolean flag= true;
        Boolean checked=false;
        List<String> ls=str.split('');
        Integer start;
        Integer second;
        Integer totalQM=0;
        Integer count=0;
        while(!checked || count<ls.size()){
            if(ls[count].isNumeric()){
                start=count;
                Boolean next=false;
                while(!next || count<ls.size()){
                    count=start+1;
                    if(ls[count]=='?'){
                        totalQM++;
                    }
                    if(ls[count].isNumeric()){
                        next=true;
                        second=count;
                    }
                    count++;
                }
            }
           
            if((integer.valueOf(ls[start])+integer.valueOf(ls[second]))==10){
                if(totalQM==3){
                    checked=true;
                }else{
                    flag=false;
                    count=second-1;
                }
            }
         count++;
        }
        return flag;
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
        Integer count=0; 
        Integer num;
        if (firstNum==n){
           num=1;
        }else{
            num=firstNum/n+1;
        }
        Integer result;
        if(n<firstNum){
           while(result<secondNum){
               result=n*num;
               num++;
               count++;
            }
           return count;
        }
        return count;  
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
        Integer degree;
        Integer start;
        Integer second;
        Integer count=0;
        if(str.length()<=2){
            return str.length();
        }else{
            while(count<str.length()){
                start=count;
                Boolean next=false;
                while(!next){
                   count=start+1;
                   if(str.charAt(count)==str.charAt(start))
                   {
                    next=true;
                    second=count;
                    }
                    count++;
                }
                String sub=str.substring(start, second+1);
                if(sub==sub.reverse()){
                    degree++;
                    count=start;
                }else{
                    degree++;
                    count=second;
                }
                count++;
            }
            return degree;
        }
    }