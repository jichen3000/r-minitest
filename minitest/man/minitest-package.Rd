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


}
