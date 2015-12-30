\name{test}
\alias{test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
define a testcase
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
test(name, block)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
test case name
}
  \item{block}{
the codes that you want to test
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
invisible(testcase_name)
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