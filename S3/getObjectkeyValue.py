#########################################################
# Description:  This script will access a dictionary    #
#               object and key string from input and    #
#               returns the value                       #
# Example:                                              #
# Input dict : {"a":{"b":{"c":"d"}}}                    #
# Input Key string: a/b/c                               #
# Output: d                                             #
#########################################################
import json

# Function to return value of key from dictionary
def getValuesfromJson(inputDictObj,keyString): 
    iter = 1 
    keysList = keyString.split('/')
    for key in keysList:
        try:
            subDictObj = inputDictObj[key]
        except KeyError:
            print("\n Key not found \n")
            return None
        else:
            if type(subDictObj) == dict:                
                inputDictObj = subDictObj
        iter+=1
    return subDictObj

if __name__ == "__main__":
    inputString = input("Enter the key-val object:  ")
    inputKey = input("Enter the key string: ")
    try:
        inputJson = json.loads(inputString) # converting input string type object to dictionary/json
    except json.decoder.JSONDecodeError:    
        print("Input dictionary string is not in valid format, it should be like {\"a\":{\"b\":{\"c\":\"d\"}}} ")
    else:
        value = getValuesfromJson(inputJson,inputKey)
        if value:
            print("\nValue is: " + str(value) + "\n")

        