options(error=function()traceback(2))
# the function I want to test
fx <- function(x) x

if (is.null(sys.frames())){
    suppressPackageStartupMessages(require(minitest))
    # only test case named list below will be tested
    only_test("simple", "identical", "as function")
    # this test will not run
    test("pass test", {
        fx(1) %equal% 3
    })
    test("pass test", {
        fxx(1) %equal% 3
    })
    test("simple", {
        fx(1) %equal% 1
        fx(1) %equal% 2
        fx(1) %equal% 3

    })
    test("as function", {
        `%equal%`(as.integer(1),1, identical)
        `%equal%`(as.integer(1),1, `==`)
        `%equal%`(1,1, identical)
    })
    test("identical", {
        as.integer(1) %identical% 1

        as.integer(1) %equal% 1
    })
}


