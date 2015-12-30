\name{minitest-package}
\alias{minitest-package}
\alias{minitest}
\docType{package}
\title{
\packageTitle{minitest}
}
\description{
\packageDescription{minitest}
}
\details{
Some methods including:
    
    only_test, test, \%equal\%.

And some other useful functions:

    p, ps.

https://github.com/jichen3000/r-minitest
}
\author{
\packageAuthor{minitest}

Maintainer: \packageMaintainer{minitest}
}
\references{
}
\keyword{ package }
\seealso{
Ruby minitest
}
\examples{
code:

    # the function I want to test
    fx <- function(x) x

    if (is.null(sys.frames())){
        suppressPackageStartupMessages(require(minitest))
        # only test case named list below will be tested
        only_test("simple", "compare function")
        # this test will not run
        test("pass test", {
            fx(1) \%equal\% 3
        })
        test("simple", {
            fx(1) \%equal\% 1
            list(1:3, 4:6) \%equal\% list(1:3, 4:6)
        })
        test("compare function", {
            `\%equal\%`(as.integer(1), 1, `==`)
            `\%equal\%`(1, 1, identical)
        })
    }

result:

    Notice, only test these functions: simple, error, compare function

    Running tests:

    ....

    Finished tests in 0.002614 seconds.

    2 tests, 4 assertions, 0 failures, 0 errors.
}