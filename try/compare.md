http://www.johnmyleswhite.com/notebook/2010/08/17/unit-testing-in-r-the-bare-minimum/


## compare function and operator
which one is more readable

function:
pros:
    1. easy to invoke
    2. easy to only run some of them 
cons: 
    1.too many types for define a function
    2.use name prefix to match, have to let user to remember

operator:
pros:
    1. save types, except for two %%
    2. easy to remember
cons:
    1. hard to only run, have to use global variable
    2. look a little weird
