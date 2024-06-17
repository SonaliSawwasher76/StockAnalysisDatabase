INSERT INTO Users (UserName, Email, PasswordHash)
VALUES 
('alice_green', 'alice.green@example.com', 'hashed_password'),
('bob_jones', 'bob.jones@example.com', 'hashed_password'),
('emily_wang', 'emily.wang@example.com', 'hashed_password'),
('michael_brown', 'michael.brown@example.com', 'hashed_password');


INSERT INTO Portfolios (UserID, PortfolioName)
VALUES 
(1, 'Main Portfolio'),
(1, 'Tech Stocks'),
(2, 'Retirement Portfolio'),
(2, 'Healthcare Investments'),
(3, 'Growth Stocks'),
(4, 'Education Fund');


-- Assume StockID 1 corresponds to AAPL, StockID 2 to GOOG, and StockID 3 to MSFT
INSERT INTO Transactions (PortfolioID, StockID, TransactionType, Quantity, Price, TransactionDate)
VALUES 
(1, 1, 'Buy', 100, 150.25, '2024-06-10'),
(1, 2, 'Buy', 50, 2700.75, '2024-06-11'),
(2, 3, 'Buy', 200, 300.50, '2024-06-12'),
(1, 1, 'Sell', 50, 160.00, '2024-06-13'),
(2, 1, 'Buy', 75, 155.50, '2024-06-14'),
(3, 2, 'Buy', 25, 2725.25, '2024-06-14'),
(4, 3, 'Buy', 150, 305.00, '2024-06-14'),
(4, 3, 'Sell', 50, 310.00, '2024-06-14');


INSERT INTO Alerts (UserID, StockID, AlertPrice, AlertType, AlertDate)
VALUES 
(1, 1, 170.00, 'Above', '2024-06-14'),
(2, 2, 2800.00, 'Above', '2024-06-14'),
(3, 3, 310.00, 'Below', '2024-06-14'),
(4, 1, 160.00, 'Below', '2024-06-14');


-- Assume StockID 1 corresponds to AAPL, StockID 2 to GOOG, and StockID 3 to MSFT
INSERT INTO Dividends (StockID, DividendDate, DividendAmount)
VALUES 
(1, '2023-06-01', 0.82),
(1, '2024-06-01', 0.88),
(2, '2023-06-01', 1.10),
(2, '2024-06-01', 1.20),
(3, '2023-06-01', 0.56),
(3, '2024-06-01', 0.60),
(4, '2023-06-01', 0.75),
(4, '2024-06-01', 0.80);


INSERT INTO Watchlist (UserID, StockID, DateAdded)
VALUES 
(1, 2, '2024-06-10'),
(1, 3, '2024-06-11'),
(2, 1, '2024-06-12'),
(3, 2, '2024-06-13'),
(4, 1, '2024-06-14');


INSERT INTO MarketIndices (IndexName, IndexSymbol)
VALUES 
('S&P 500', 'SPX'),
('NASDAQ 100', 'NDX'),
('Dow Jones Industrial Average', 'DJIA'),
('FTSE 100', 'FTSE');


-- Assume StockID 1 corresponds to AAPL, StockID 2 to GOOG, and StockID 3 to MSFT
INSERT INTO IndexComponents (IndexID, StockID, DateAdded)
VALUES 
(1, 1, '2024-06-10'),
(1, 2, '2024-06-11'),
(1, 3, '2024-06-12'),
(2, 1, '2024-06-10'),
(2, 3, '2024-06-12'),
(3, 2, '2024-06-11'),
(4, 1, '2024-06-10'),
(4, 2, '2024-06-11');


INSERT INTO Stocks (Symbol, CompanyName, Sector, Industry)
VALUES 
('AAPL', 'Apple Inc.', 'Technology', 'Consumer Electronics'),
('GOOG', 'Alphabet Inc.', 'Technology', 'Internet Services'),
('MSFT', 'Microsoft Corporation', 'Technology', 'Software'),
('AMZN', 'Amazon.com Inc.', 'Technology', 'Internet Retail'),
('TSLA', 'Tesla Inc.', 'Automotive', 'Electric Vehicles'),
('NVDA', 'NVIDIA Corporation', 'Technology', 'Semiconductors'),
('JNJ', 'Johnson & Johnson', 'Healthcare', 'Pharmaceuticals'),
('PFE', 'Pfizer Inc.', 'Healthcare', 'Pharmaceuticals'),
('KO', 'The Coca-Cola Company', 'Consumer Goods', 'Beverages'),
('HD', 'The Home Depot', 'Retail', 'Home Improvement');


-- Assume historical price data for the past few months for each stock
-- Assume historical price data for the past few months for each stock
INSERT INTO HistoricalPrices (StockID, Date, OpenPrice, HighPrice, LowPrice, ClosePrice, Volume)
VALUES 
-- Historical prices for AAPL
(1, '2024-06-01', 155.00, 160.00, 152.50, 158.75, 100000),
(1, '2024-05-01', 150.00, 157.50, 145.25, 155.00, 120000),
-- Historical prices for GOOG
(2, '2024-06-01', 2700.00, 2750.00, 2650.50, 2725.75, 50000),
(2, '2024-05-01', 2650.00, 2725.00, 2600.25, 2700.00, 60000),
-- Historical prices for MSFT
(3, '2024-06-01', 300.00, 305.00, 295.50, 302.25, 80000),
(3, '2024-05-01', 295.00, 302.50, 290.75, 300.00, 90000),
-- Historical prices for AMZN
(4, '2024-06-01', 3500.00, 3550.00, 3450.50, 3525.75, 40000),
(4, '2024-05-01', 3450.00, 3525.00, 3400.25, 3500.00, 45000),
-- Historical prices for TSLA
(5, '2024-06-01', 700.00, 725.00, 680.50, 712.75, 60000),
(5, '2024-05-01', 680.00, 712.50, 660.75, 700.00, 70000),
-- Historical prices for NVDA
(6, '2024-06-01', 800.00, 825.00, 780.50, 812.75, 30000),
(6, '2024-05-01', 780.00, 812.50, 760.75, 800.00, 35000),
-- Historical prices for JNJ
(7, '2024-06-01', 150.00, 155.00, 145.50, 152.75, 20000),
(7, '2024-05-01', 145.00, 152.50, 140.75, 150.00, 25000),
-- Historical prices for PFE
(8, '2024-06-01', 70.00, 75.00, 65.50, 72.75, 15000),
(8, '2024-05-01', 65.00, 72.50, 60.75, 70.00, 18000),
-- Historical prices for KO
(9, '2024-06-01', 50.00, 52.50, 48.50, 51.25, 30000),
(9, '2024-05-01', 48.00, 51.00, 46.75, 50.00, 32000),
-- Historical prices for HD
(10, '2024-06-01',48.00, 51.00, 46.75, 50.00, 22000) 

INSERT INTO RealtimePrices (StockID, DateTime, Price)
VALUES 
(4, '2024-06-15 09:30:00', 2400.50),
(4, '2024-06-15 10:00:00', 2410.75),
(4, '2024-06-15 10:30:00', 2425.25),
(5, '2024-06-15 09:30:00', 135.25),
(5, '2024-06-15 10:00:00', 134.50),
(5, '2024-06-15 10:30:00', 135.75),
(6, '2024-06-15 09:30:00', 180.75),
(6, '2024-06-15 10:00:00', 181.50),
(6, '2024-06-15 10:30:00', 182.25),
(7, '2024-06-15 09:30:00', 75.50),
(7, '2024-06-15 10:00:00', 76.25),
(7, '2024-06-15 10:30:00', 76.75),
(8, '2024-06-15 09:30:00', 125.00),
(9, '2024-06-15 10:00:00', 124.50),
(10, '2024-06-15 10:30:00', 125.75);

