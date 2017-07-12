#' get the stock data 
#'
# TODO: this is a temp directory
dir <- "C:/Users/staghizadehvaghefi/Desktop/Learning/PM/R_1/PortfoLio"
setwd(dir)

#######################################
# Method 1
getthat <- function(symbols
                    ,length = 60){
  stock_env <- new.env() #env class
  stock_obj <- quantmod::getSymbols(symbols 
                                    ,env = stock_env 
                                    ,warnings = FALSE,
                                    from = Sys.Date() - length
  )
  data <- list(price_list = stock_env
               ,daily_return = eapply(stock_env, 
                                      quantmod::dailyReturn))
  return(data)
}

# example
stock_mkt <- c("AMEX", "NASDAQ", "NYSE")
# stock_mkt <- c("NASDAQ")
symb_df <- TTR::stockSymbols(exchange = stock_mkt)
symb <- symb_df$Symbol
# sample or all
symb <- c('AMD', 'MSFT', 'APPN', 'CAMT', 'NVDA', 'AAPL', 'SPI', 'UAL', 'LUV', 'UAL', 'TSLA',
          'NFLX', 'FB', 'BABA' )

stock_obj <- getthat(symb,length = 60 )



