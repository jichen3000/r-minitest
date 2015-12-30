options(error=function()traceback(2))
# the function I want to test
fx <- function(x) x

if (is.null(sys.frames())){
    suppressPackageStartupMessages(require(minitest))
    # only test case named list below will be tested
    only_test("simple", "error", "compare function")
    # this test will not run
    test("pass test", {
        fx(1) %equal% 3
    })
    test("simple", {
        fx(1) %equal% 1
        list(1:3, 4:6) %equal% list(1:3, 4:6)

        fx(1) %equal% 2
        list(1:3, 4:6) %equal% list(1:3, 4:5)
    })
    test("error", {
        fxx(1) %equal% 3
    })
    test("compare function", {
        `%equal%`(as.integer(1), 1, identical)
        `%equal%`(as.integer(1), 1, `==`)
        `%equal%`(1, 1, identical)
    })
}


