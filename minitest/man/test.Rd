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
        only_test("simple", "identical", "as function")
        # this test will not run
        test("pass test", {
            fx(1) \%equal\% 3
        })
        test("pass test", {
            fxx(1) \%equal\% 3
        })
        test("simple", {
            fx(1) \%equal\% 1
            fx(1) \%equal\% 2
            fx(1) \%equal\% 3

        })
        test("as function", {
            `\%equal\%`(as.integer(1),1, identical)
            `\%equal\%`(as.integer(1),1, `==`)
            `\%equal\%`(1,1, identical)
        })
        test("identical", {
            as.integer(1) \%identical\% 1

            as.integer(1) \%equal\% 1
        })
    }

result:

    Notice, only test these functions: simple, identical, as function

    Running tests:

    .FFF..F.

    Finished tests in 0.001689 seconds.

    1) Failure:
    in simple:
      EXPECTED:  num 2
      ACTUAL  :  num 1

    2) Failure:
    in simple:
      EXPECTED:  num 3
      ACTUAL  :  num 1

    3) Failure:
    in as function:
      EXPECTED:  num 1
      ACTUAL  :  int 1

    4) Failure:
    in identical:
      EXPECTED:  num 1
      ACTUAL  :  int 1

    3 tests, 8 assertions, 4 failures, 0 errors.

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
