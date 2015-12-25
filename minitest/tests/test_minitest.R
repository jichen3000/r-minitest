options(error=function()traceback(2))
# the function I want to test
fx <- function(x) x
# invisible(reg.finalizer(globalenv(),
#         function(e) print_report_footer(),
#         onexit=TRUE))
# str(environment())
if (is.null(sys.frames())){
    require(minitest)
    only_test("test1","some error")
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


