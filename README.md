# Minitest for R

This project is for test R codes, and inspired by Ruby minispec., but now it just implement some methods including:
    
    only_test, test, %equal%.
    
And some other useful functions:

    p, ps.

-----------------------

### Author

Colin Ji <jichen3000@gmail.com>


### How to install

    you cannot install by like this for now, since I don't upload to CRAN.

    install.packages("minitest")

### How to use

For a simple example, you write a function called fx, and I would like to write the unittest in same file as:
<br>code:

    # the function I want to test
    fx <- function(x) x

    if (is.null(sys.frames())){
        require(minitest)

        # only test case named "simple" will be tested
        only_test("simple")
        # this test will not run
        test("pass test", {
            fx(1) %equal% 3
        })
        test("simple", {
            fx(1) %equal% 1
            fx(1) %equal% 2
            fx(1) %equal% 3
        })
    }

result:

    Notice, only test these functions: simple

    Running tests:

    .FF

    Finished tests in 0.000882 seconds.

    1) Failure:
    in simple:
      EXPECTED:  num 2
      ACTUAL  :  num 1

    2) Failure:
    in simple:
      EXPECTED:  num 3
      ACTUAL  :  num 1

    1 tests, 3 assertions, 2 failures, 0 errors.


### Other useful function

The functions p, ps could be useful for the test.

p, print with title. This function will print variable name as the title.
<br>code:
    
    x <- 1:5
    p(x)

print result:

    x : [1] 1 2 3 4 5
    
ps, str with title. This function will print variable name as the title
in the first line, then use function str to print the content of variable below the title.
<br>code:
    
    x <- 1:5
    ps(x)

print result:

    x : 
     int [1:5] 1 2 3 4 5

