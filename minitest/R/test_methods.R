# source("p_methods.R")
# source("list_helper.R")

test_env <- new.env(parent = emptyenv())
# test_env <-     structure(list(
#                 name            = "env"
#             ), class = "TestCase")
test_env$test_cases <- list()
test_env$need_init <- TRUE


new_test_case <- function(name){
    structure(list(
                name            = name, 
                assertion_count = 0,
                failure_count   = 0,
                error_count     = 0,
                failure_error_list = list()
            ), class = "TestCase")
}

new_test_failure <- function(test_name, actual, expect, 
        failure_msg=NULL){
    structure(list(
                test_name=test_name, 
                actual=actual, 
                expect=expect,
                failure_msg=failure_msg
            ), class = "TestFailure")
}

new_test_error <- function(test_name, the_error){
    structure(list(
                test_name=test_name, 
                error=the_error
            ), class = "TestError")
}

new_test_statics <- function(test_cases){
    all_assertion_count <- 0
    all_failure_count <- 0
    all_error_count <- 0
    failure_error_list <- list() 
    if(length(test_cases)>0){
        all_assertion_count <- sum(sapply(test_cases, 
                function(x) get("assertion_count", x)))
        all_failure_count <- sum(sapply(test_cases, 
                function(x) get("failure_count", x)))
        all_error_count <- sum(sapply(test_cases, 
                function(x) get("error_count", x)))
        failure_error_list <- lapply(test_cases, 
                function(x) get("failure_error_list", x) )
        failure_error_list <- Reduce(c, failure_error_list)
    }
    # ps(test_cases)
    structure(list(
                test_count=length(test_cases), 
                assertion_count=all_assertion_count, 
                failure_count=all_failure_count, 
                error_count=all_error_count, 
                failure_error_list=failure_error_list
            ), class = "TestStatics")
}

print_report_header <- function(){
    # if(bindingIsLocked("test_env", environment())){
    #     unlockBinding("test_env", environment())
    # }

    test_env$start_time <- Sys.time()
    if(!is.null(test_env$only_tests)){
        cat("Notice, only test these functions: ")
        cat(paste(test_env$only_tests,collapse=", "))
        cat("\n")
        cat("\n")
    }
    cat("Running tests:\n\n")
}

print_detail <- function(test_object, index){
    UseMethod("print_detail")
}

# 1) Failure:
# File "/Users/colin/work/GoogleDrive/minitest/test/test_only.py", line 29, in <module>:
# EXPECTED: 1
#   ACTUAL: 2
print_detail.TestFailure <- function(the_failure, index){
    cat(paste0(index, ") Failure:\n"))
    cat(paste0("in ", the_failure$test_name,":\n"))
    cat("  EXPECTED: ")
    str(the_failure$expect)
    cat("  ACTUAL  : ")
    str(the_failure$actual)
    cat("\n")
}

# Error: object 'ppp' not found
print_detail.TestError <- function(the_error, index){
    original <- the_error$error
    cat(paste0(index, ") Error:\n"))
    cat(paste0("in ", the_error$test_name,":\n"))
    cat("class: ")
    cat(paste(attr(original,"class"), collapse=","))
    cat("\n")
    cat(original$message)
    cat("\n")
    cat("\n")
}

print_report_footer <- function(){
    # if(bindingIsLocked("test_env", environment())){
    #     unlockBinding("test_env", environment())
    # }

    test_env$end_time <- Sys.time()
    time_diff_str <- toString(round(
            test_env$end_time - test_env$start_time,6))
    cat(paste0("\n\nFinished tests in ", 
            time_diff_str, " seconds.\n\n"))
    test_statics <- new_test_statics(test_env$test_cases)
    # ps(test_env$test_cases[[1]]$failure_error_list)
    mapply(print_detail, 
            test_statics$failure_error_list,
            1:length(test_statics$failure_error_list))
    # ps(test_statics$failure_error_list)
    # cat(test_statics$failure_error_list[[1]])
    cat(paste0(
            test_statics$test_count," tests, ", 
            test_statics$assertion_count, " assertions, ",
            test_statics$failure_count, " failures, ",
            test_statics$error_count, " errors.\n"
            ))
}

print_assertion <- function(test_result){
    if (inherits(test_result, "error")){
        cat("E")
    }else{
        if (test_result){
            cat(".")
        }else{
            cat("F")
        }
    }
}

handle_test_error <- function(the_error){
    cur_test_case <- list_last(test_env$test_cases)
    # ps(cur_test_case)
    cur_test_case$error_count <- cur_test_case$error_count + 1
    cur_test_case$failure_error_list <- list_append(
            cur_test_case$failure_error_list, 
            new_test_error(cur_test_case$name, the_error))
    print_assertion(the_error)
    test_env$test_cases[[length(test_env$test_cases)]] <- cur_test_case

}

only_test <- function(...){
    test_env$only_tests <- c(...)
    # print(test_env$only_tests)
    invisible(c(...))
}

test <- function(name, block){
    # if(bindingIsLocked("test_env", environment())){
    #     unlockBinding("test_env", environment())
    # }
    if (test_env$need_init){
        test_env$need_init <- FALSE
        print_report_header()
        invisible(reg.finalizer(environment(),
                function(e) print_report_footer(),
                onexit=TRUE))

    }
    if (is.null(test_env$only_tests) || (name %in% test_env$only_tests)) {
        test_env$test_cases <- list_append(test_env$test_cases,
                new_test_case(name))
        # ps(test_env$test_cases)
        tryCatch(eval(block), error = handle_test_error)
        # print(test_env$only_tests)
    }
    invisible(name)
}

`%equal%` <- function(actual, expect, compare_func=identical, failure_msg=NULL){
    cur_test_case <- list_last(test_env$test_cases)
    # ps(cur_test_case)
    result <- compare_func(actual, expect)
    result
    cur_test_case$assertion_count <- cur_test_case$assertion_count + 1 
    if(!result){
        cur_test_case$failure_count <- cur_test_case$failure_count + 1
        cur_test_case$failure_error_list <- list_append(
                cur_test_case$failure_error_list, 
                new_test_failure(cur_test_case$name, actual, expect))
        # cur_test_case$assertion_count <- cur_test_case$assertion_count + 1 
    }
    print_assertion(result)
    test_env$test_cases[[length(test_env$test_cases)]] <- cur_test_case
    # ps(test_env$test_cases)
    invisible(result)
}

