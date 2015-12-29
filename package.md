## 
> source("list_helper.R")
> source("p_methods.R")
> source("test_methods.R")
package.skeleton(name="minitest", code_files=c("list_helper.R", "p_methods.R", "test_methods.R"))

## Read-and-delete-me

    * Edit the help file skeletons in 'man', possibly combining help files for multiple functions.
    * Edit the exports in 'NAMESPACE', and add necessary imports.
    * Put any C/C++/Fortran code in 'src'.
    * If you have compiled code, add a useDynLib() directive to 'NAMESPACE'.
    * Run R CMD build to build the package tarball.
    * Run R CMD check to check the package tarball.

    Read "Writing R Extensions" for more information.

R CMD INSTALL minitest
Error in match.arg(units) : 'arg' must be NULL or a character vector

sessionInfo()    

Error in test_env$start_time <<- Sys.time() : 
  cannot change value of locked binding for 'test_env'

exportPattern("^[[:alpha:]]+")

global env

cannot reg.finalizer just in the file

export in NAMESPACE  