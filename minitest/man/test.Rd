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