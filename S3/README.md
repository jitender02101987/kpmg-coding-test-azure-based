S3
-------------
This solution contains a python file which accept object and key and returns value. Example below:

Example Inputs
object = {“a”:{“b”:{“c”:”d”}}}
key = a/b/c
value = d

object = {“x”:{“y”:{“z”:”a”}}}
key = x/y/z
value = a

### Prerequisite
-   Install python

Usage:
---------

getObjectkeyValue.py requires 2 parameter object and key.

Result:
---------

PS C:\Users\Jitender\Documents\KGS-coding-challenge-main\S3> python .\getObjectkeyValue.py
Enter the key-val object:   {"a":{"b":{"c":"d"}}}
Enter the key string: a/b/c

Value is: d

PS C:\Users\Jitender\Documents\KGS-coding-challenge-main\S3> python .\getObjectkeyValue.py
Enter the key-val object:   {"a":{"b":{"c":"d"}}}
Enter the key string: a

Value is: {'b': {'c': 'd'}}

PS C:\Users\Jitender\Documents\KGS-coding-challenge-main\S3> python .\getObjectkeyValue.py
Enter the key-val object:  a
Enter the key string: a
Input dictionary string is not in valid format, it should be like {"a":{"b":{"c":"d"}}}

