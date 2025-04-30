create database stock_market;
use stock_market;
desc stock_market;
select*from stock_market;

# Average Daily Trading Volume
SELECT 
    Ticker, 
    AVG(Volume) AS Avg_Daily_Trading_Volume
FROM stock_market
GROUP BY Ticker
ORDER BY Avg_Daily_Trading_Volume DESC;


# Most Volatile Stocks: 
SELECT 
    Ticker, 
    STDDEV(Close) AS Price_Volatility
FROM stock_market
GROUP BY Ticker
ORDER BY Price_Volatility DESC;

# Stocks with Highest Dividend and Lowest Dividend
SELECT 
    Ticker, 
    MIN(Dividend_Amount) AS Lowest_Dividend
FROM stock_market
WHERE Dividend_Amount > 0  
GROUP BY Ticker
ORDER BY Lowest_Dividend ASC
LIMIT 1;

# Highest and Lowest P/E Ratios
SELECT 
    Ticker, 
    PE_Ratio 
FROM stock_market
WHERE PE_Ratio IS NOT NULL
ORDER BY PE_Ratio DESC
LIMIT 1;

# Stocks with Highest Market Cap
SELECT 
    Ticker, 
    Market_Cap 
FROM stock_market
ORDER BY Market_Cap DESC
Limit 1;

# Stocks Near 52 Week High:  
SELECT 
    Ticker, 
    Close AS Latest_Close, 
    52_Week_High, 
    (Close / 52_Week_High) * 100 AS Percentage_of_High
FROM stock_market
WHERE (Close / 52_Week_High) >= 0.95  
ORDER BY Percentage_of_High DESC;

# Stocks Near 52 Week Low
SELECT 
    Ticker, 
    Close AS Latest_Close, 
    52_Week_Low, 
    (Close / 52_Week_Low) * 100 AS Percentage_of_Low
FROM stock_market
WHERE (Close / 52_Week_Low) <= 1.05  
ORDER BY Percentage_of_Low ASC;

# Stocks with Strong Buy Signals and stocks with Strong Selling Signal
SELECT 
    Ticker, 
    Close AS Latest_Close, 
    Moving_Average_10_days, 
    RS_14_days, 
    MACD
FROM Stock_Market_Data
WHERE 
    Close > Moving_Average_10_days  
    AND RS_14_days < 30  
    AND MACD > 0  
ORDER BY RS_14_days ASC;  


























