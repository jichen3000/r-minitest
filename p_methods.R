# options(error=function()traceback(2))

p <- function(variable){
    parse_tree <- substitute(variable)
    cat(deparse(parse_tree))
    cat(" : ")
    print(variable)
}

# pp <- function(variable){
#     parse_tree <- substitute(variable)
#     cat(deparse(parse_tree))
#     cat(" : \n")
#     print(variable)
# }

ps <- function(variable){
    parse_tree <- substitute(variable)
    cat(deparse(parse_tree))
    cat(" : \n")
    # str will print
    str(variable)
}


if (is.null(sys.frames())){
    x <- 1:5
    ps(x)
    p(x)
    p(1:5)
    p(c(1:5))
    ps(1:5)

    l <- list(1,2)
    p(l)
    ps(l)

    p(sum)
    p(p)

}
