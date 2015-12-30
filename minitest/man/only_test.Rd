\name{only_test}
\alias{only_test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Add test cases
}
\description{
Add test cases name which need to be tested
}
\usage{
only_test(...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{\dots}{
test cases names
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
invisible(c(\dots))
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
\packageAuthor{minitest}

Maintainer: \packageMaintainer{minitest}
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
code:

    # the function I want to test
    fx <- function(x) x

    if (is.null(sys.frames())){
        # only test case named list below will be tested
        only_test("simple", "error", "compare function")
        # this test will not run
        test("pass test", {
            fx(1) \%equal\% 3
        })
        test("simple", {
            fx(1) \%equal\% 1
            fx(1) \%equal\% 2
        })
        test("error", {
            fxx(1) \%equal\% 3
        })
        test("compare function", {
            `\%equal\%`(as.integer(1), 1, identical)
            `\%equal\%`(as.integer(1), 1, `==`)
            `\%equal\%`(1, 1, identical)
        })
    }

result:

    Notice, only test these functions: simple, error, compare function

    Running tests:

    .FEF..

    Finished tests in 0.003731 seconds.

    1) Failure:
    in simple:
      EXPECTED:  num 2
      ACTUAL  :  num 1

    2) Error:
    in error:
    class: simpleError,error,condition
    could not find function "fxx"

    3) Failure:
    in compare function:
      EXPECTED:  num 1
      ACTUAL  :  int 1

    3 tests, 5 assertions, 2 failures, 1 errors.

}