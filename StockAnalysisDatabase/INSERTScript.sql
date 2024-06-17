-- Insert sample data into Stocks table
INSERT INTO Stocks (Symbol, CompanyName, Sector, Industry)
VALUES 
('AAPL', 'Apple Inc.', 'Technology', 'Consumer Electronics'),
('GOOGL', 'Alphabet Inc.', 'Technology', 'Internet Content & Information'),
('MSFT', 'Microsoft Corporation', 'Technology', 'Software');

-- Insert sample data into HistoricalPrices table
INSERT INTO HistoricalPrices (StockID, Date, OpenPrice, HighPrice, LowPrice, ClosePrice, Volume)
VALUES 
(1, '2023-06-14', 135.67, 137.50, 134.78, 136.33, 25000000),
(2, '2023-06-14', 2025.67, 2050.00, 2000.50, 2030.10, 1500000),
(3, '2023-06-14', 300.45, 310.00, 295.50, 305.20, 20000000);

-- Insert sample data into RealTimePrices table
INSERT INTO RealTimePrices (StockID, DateTime, Price)
VALUES 
(1, '2023-06-15 10:00:00', 137.00),
(2, '2023-06-15 10:00:00', 2040.00),
(3, '2023-06-15 10:00:00', 307.50);


-- Insert sample data into Users table
INSERT INTO Users (UserName, Email, PasswordHash)
VALUES 
('john_doe', 'john.doe@example.com', 'hashed_password1'),
('jane_smith', 'jane.smith@example.com', 'hashed_password2');

-- Insert sample data into Portfolios table
INSERT INTO Portfolios (UserID, PortfolioName)
VALUES 
(1, 'Johns Tech Stocks'),
(2, 'Janes Growth Stocks');

-- Insert sample data into Transactions table
INSERT INTO Transactions (PortfolioID, StockID, TransactionType, Quantity, Price)
VALUES 
(1, 1, 'BUY', 10, 135.67),
(1, 3, 'BUY', 5, 300.45),
(2, 2, 'BUY', 15, 2025.67);

-- Insert sample data into Alerts table
INSERT INTO Alerts (UserID, StockID, AlertPrice, AlertType)
VALUES 
(1, 1, 140.00, 'ABOVE'),
(2, 3, 290.00, 'BELOW');


-- Insert sample data into Dividends table
INSERT INTO Dividends (StockID, DividendDate, DividendAmount)
VALUES 
(1, '2023-06-01', 0.82),
(2, '2023-06-01', 1.10),
(3, '2023-06-01', 0.56);

-- Insert sample data into Watchlist table
INSERT INTO Watchlist (UserID, StockID)
VALUES 
(1, 1),
(1, 3),
(2, 2);

-- Insert sample data into MarketIndices table
INSERT INTO MarketIndices (IndexName, IndexSymbol)
VALUES 
('S&P 500', 'SPX'),
('NASDAQ 100', 'NDX');

-- Insert sample data into IndexComponents table
INSERT INTO IndexComponents (IndexID, StockID)
VALUES 
(1, 1),
(1, 2),
(2, 3);
