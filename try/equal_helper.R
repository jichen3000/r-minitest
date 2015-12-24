`%equal%` <- function(actual, expect){
    actual == expect
}

`%test%` <- function(msg, block){
    print(msg)
}

test <- function(msg, block){
    print(msg)
    eval(block)
}

fx <- function(x){
    x
}



# which one is best
test_fx <- function(){
    fx(5) %equal% 5    
}


"test fx" %test% {
    fx(5) %equal% 5    
}

test("fx",{
    fx(5) %equal% 5
    fx(4) %equal% 3
})