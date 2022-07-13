'''
Given two strings s1 and s2, we want to visualize how different the two strings are. 
We will only take into account the lowercase letters (a to z). First let us count the frequency of each lowercase letters in s1 and s2.

s1 = "A aaaa bb c"

s2 = "& aaa bbb c d"

s1 has 4 'a', 2 'b', 1 'c'

s2 has 3 'a', 3 'b', 1 'c', 1 'd'

So the maximum for 'a' in s1 and s2 is 4 from s1; the maximum for 'b' is 3 from s2. 
In the following we will not consider letters when the maximum of their occurrences is less than or equal to 1.

We can resume the differences between s1 and s2 in the following string: where in stands for string s1 and because the maximum for is 4. 
In the same manner stands for string s2 and because the maximum for is 3."1:aaaa/2:bbb"11:aaaaaaaaa2:bbbbbbb

The task is to produce a string in which each lowercase letters of s1 or s2 appears as many times as its maximum if this maximum is strictly greater than 1;
these letters will be prefixed by the number of the string where they appear with their maximum value and . 
If the maximum is in s1 as well as in s2 the prefix is .:=:

In the result, substrings (a substring is for example 2:nnnnn or 1:hhh; it contains the prefix) 
will be in decreasing order of their length and when they have the same length sorted in ascending lexicographic order 
(letters and digits - more precisely sorted by codepoint); the different groups will be separated by '/'. See examples and "Example Tests".

Hopefully other examples can make this clearer.

s1 = "my&friend&Paul has heavy hats! &"
s2 = "my friend John has many many friends &"
mix(s1, s2) --> "2:nnnnn/1:aaaa/1:hhh/2:mmm/2:yyy/2:dd/2:ff/2:ii/2:rr/=:ee/=:ss"

s1 = "mmmmm m nnnnn y&friend&Paul has heavy hats! &"
s2 = "my frie n d Joh n has ma n y ma n y frie n ds n&"
mix(s1, s2) --> "1:mmmmmm/=:nnnnnn/1:aaaa/1:hhh/2:yyy/2:dd/2:ff/2:ii/2:rr/=:ee/=:ss"

s1="Are the kids at home? aaaaa fffff"
s2="Yes they are here! aaaaa fffff"
mix(s1, s2) --> "=:aaaaaa/2:eeeee/=:fffff/1:tt/2:rr/=:hh"
Note for Swift, R, PowerShell
The prefix is replaced by =:E:

s1 = "mmmmm m nnnnn y&friend&Paul has heavy hats! &"
s2 = "my frie n d Joh n has ma n y ma n y frie n ds n&"
mix(s1, s2) --> "1:mmmmmm/E:nnnnnn/1:aaaa/1:hhh/2:yyy/2:dd/2:ff/2:ii/2:rr/E:ee/E:ss"
'''

def list_unique_letters(string):
    unique_letters = []
    positive_set = negative_set = set(string)
    auxilary_set = set(map(chr, range(97,123)))
    positive_set -= (negative_set - auxilary_set)
    for latter in sorted(positive_set):
        if string.count(latter) > 1:
            unique_letters.append(latter)
    return unique_letters


def mix(s1, s2):
    unique_letters = list (set(list_unique_letters(s1)+list_unique_letters(s2)))
    final_list = []
    intermediate_list = []

    for latter in unique_letters:
        if s1.count(latter) == s2.count(latter)  :
            final_list.append([s1.count(latter) * -1,'=',latter])
        elif s1.count(latter) >  (s2.count(latter)):
            final_list.append([s1.count(latter) * -1,'1',latter])
        else:
            final_list.append([s2.count(latter) * -1,'2',latter])
    final_list = sorted(final_list)
    string = []
    for i in final_list:
        string.append(i[1]+':'+str(i[2]*(i[0]*-1))) 
    return "/".join(string)
