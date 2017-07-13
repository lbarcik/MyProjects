#assign an integer to a variable

age = 36
print(age)

#assign a string to a variable

name = "Lauren"
print(name)

#assign a float to a variable

thisfloat = .252525
print(thisfloat)

#use the print function and .format()notation to print out the variable you assigned

print(age, name, thisfloat)

#use each of these operators +, -, *, /, +=, %

a = 10
b = 40
print (a+b)
print (b-a)
print (a*b)
print (b/a)

#=+ adds the integer to another number and changes the value of the variable

b += 5
print b

#the % operator assigns a string variable

name = "Lauren"
print "%s is so tired" %(name,)

#use each of these operators: and, or, not (boolean operators)

f_name = "Lauren"
l_name = "Barcik"
myAge = 36

if f_name == "Lauren" and l_name == "Barcik":
    print("hey, that's my name!")
if f_name == "Lauren"  or f_name == "Louise":
    print("shhh...don't tell anyone your first name is Lauren-Louise")
if not age == 36:
    print("When is your birthday?")
else:
    print("OH! you are so young!")

#Use of conditional statements: if, elif, else

allieAge = 10
hayesAge = 8
twinsAge = 14

if twinsAge >= (allieAge + hayesAge):
    print("Combined the two are older")
elif twinsAge > (allieAge or hayesAge):
    print("the twins will teach them a lot")
else:
    print("whose kids are these?")

#using the while loop
    
number = 1
while number <=10:
    print("counted to number: "),number
    number = number + 2
print("done counting")

#using the for loop

print"Letters in my name:"
spell = "Lauren"
for letters in spell:
    print letters

#create list which iterates through to print each item out on a new line

studyDays = ['Mon','Tue','Wed','Thu','Fri']
for days in studyDays:
    print'days I study:' , days
print "Ready for the weekend!"

#create a tuple and iterate through using a for loop to print each item out on a new line

print "Student scores for Python test:"
testScores = ("Student 1004, 93","Student 1005, 97","Student 1006, 100","Student 1007, 84")
for result in testScores:
        print result

#define a function that returns a string

def myGemstones(name, hardness):
    print"Gemstones and Hardness:"
    print"Name: ",name
    print"Hardness: ", hardness
    return
    
#calling the function
    
myGemstones(name = 'Diamond', hardness = 10)
    
        

    
    





        


