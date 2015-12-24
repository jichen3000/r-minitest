options(error=function()traceback(2))
source("test_methods.R")

# the function I want to test
fx <- function(x) x

main <- function(){
    # only_test("test1","test2")
    test("some test", {
        fx(1)==1
    })
    test("some error", {
        dd()
    })
    # fx(1)
    test("test1", {
        fx(1) %equal% 1
        fx(1) %equal% 2
        fx(1) %equal% 3
    })

}
if (is.null(sys.frames())){
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


