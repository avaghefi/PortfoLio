#' get the stock data 
#'
# TODO: this is a temp directory
dir <- "C:/Users/staghizadehvaghefi/Desktop/Learning/PM/R_1/PortfoLio"
setwd(dir)

#######################################
# Symbol names:

# Method 1
# stock_mkt <- c('nasdaq','nyse', 'nysemk')
# stock_mkt <- c('nasdaq')
# symb_df <- vector()
# for (mkt in stock_mkt){
#   file_name <- paste0(dir, '/','data/', mkt,'.csv')
#   symb_df <- rbind(symb_df, readr::read_csv(file_name))
# }
# method 2
# stock_mkt <- c("AMEX", "NASDAQ", "NYSE")
stock_mkt <- c("NASDAQ")
symb_df <- TTR::stockSymbols(exchange = stock_mkt)
symb <- symb_df$Symbol
# sample or all
symb <- c('AMD', 'MSFT', 'APPN', 'CAMT', 'NVDA', 'AAPL', 'SPI', 'UAL', 'LUV', 'UAL', 'TSLA',
                 'NFLX', 'FB', 'BABA' )

length_study <- 60
stock_env <- new.env() #env class

stock_obj <- quantmod::getSymbols(symb 
                                 ,env = stock_env 
                                 ,warnings = FALSE,
                                 from = Sys.Date() - length_study
                                 )
Daily_returns <- eapply(stock_env, 
                        quantmod::dailyReturn)

