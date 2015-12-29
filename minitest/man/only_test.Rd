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
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
