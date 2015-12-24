list_append <- function(the_list, item){
    # print(the_list)
    the_list[[length(the_list)+1]] <- item
    the_list
}

list_last <- function(the_list){
    the_list[[length(the_list)]]
}

if (is.null(sys.frames())){
    the_list <- list(1,2)
    the_list <- list_append(the_list, 5)
    print(list_last(the_list))

    the_list <- list()
    the_list <- list_append(the_list, list(2,3))
    the_list <- list_append(the_list, list(3,4,5))
    print(str(the_list))

}