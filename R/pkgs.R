#' install the required packages if they are not available
#' 
#' 

package_list <- c('readr'
                  ,'dplyr'
                  ,'xts'
                  ,'zoo'
                  ,'TTR'
                  ,'quantmod')

pkg_load <- function(pkg_list){
  available_packages <- installed.packages()[, "Package"]
  new_pkgs <- pkg_list[!(pkg_list %in% available_packages)]
  if (length(new_pkgs)){
    install.packages(new_pkgs, 
                     dependencies = TRUE, 
                     quiet = TRUE) 
  } 
  sapply(package_list, 
         require, 
         character.only = TRUE, 
         quietly = TRUE)
}

pkg_load(package_list)

