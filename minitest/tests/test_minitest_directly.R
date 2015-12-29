options(error=function()traceback(2))
source("../R/test_methods.R")
source("../R/p_methods.R")
source("../R/list_helper.R")

# the function I want to test
fx <- function(x) x


if (is.null(sys.frames())){
    # only test case named "simple" will be tested
    only_test("simple")
    # this test will not run
    test("pass test", {
        fx(1) %equal% 3
    })
    test("pass test", {
        fxx(1) %equal% 3
    })
    test("simple", {
        # fx(1) %equal% 1
        # fx(1) %equal% 2
        # fx(1) %equal% 3

        '%equal%'(as.integer(1),1, `==`)
    })
}


