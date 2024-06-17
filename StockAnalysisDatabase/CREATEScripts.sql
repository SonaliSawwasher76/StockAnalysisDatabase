-- Table for storing stock information
CREATE TABLE Stocks (
    StockID INT PRIMARY KEY IDENTITY(1,1),
    Symbol NVARCHAR(10) NOT NULL,
    CompanyName NVARCHAR(100),
    Sector NVARCHAR(50),
    Industry NVARCHAR(50)
);

-- Table for storing historical stock prices
CREATE TABLE HistoricalPrices (
    PriceID INT PRIMARY KEY IDENTITY(1,1),
    StockID INT FOREIGN KEY REFERENCES Stocks(StockID),
    Date DATE NOT NULL,
    OpenPrice DECIMAL(10, 2),
    HighPrice DECIMAL(10, 2),
    LowPrice DECIMAL(10, 2),
    ClosePrice DECIMAL(10, 2),
    Volume BIGINT
);

-- Table for storing real-time stock prices
CREATE TABLE RealTimePrices (
    RealTimePriceID INT PRIMARY KEY IDENTITY(1,1),
    StockID INT FOREIGN KEY REFERENCES Stocks(StockID),
    DateTime DATETIME NOT NULL,
    Price DECIMAL(10, 2)
);

-- Table for storing user information
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(100) NOT NULL
);

-- Table for storing portfolios
CREATE TABLE Portfolios (
    PortfolioID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    PortfolioName NVARCHAR(100) NOT NULL
);

-- Table for storing transactions
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    PortfolioID INT FOREIGN KEY REFERENCES Portfolios(PortfolioID),
    StockID INT FOREIGN KEY REFERENCES Stocks(StockID),
    TransactionType NVARCHAR(10) CHECK (TransactionType IN ('BUY', 'SELL')),
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    TransactionDate DATETIME DEFAULT GETDATE()
);

-- Table for storing price alerts
CREATE TABLE Alerts (
    AlertID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    StockID INT FOREIGN KEY REFERENCES Stocks(StockID),
    AlertPrice DECIMAL(10, 2) NOT NULL,
    AlertType NVARCHAR(10) CHECK (AlertType IN ('ABOVE', 'BELOW')),
    AlertDate DATETIME DEFAULT GETDATE()
);
-- Table for storing dividend payments
CREATE TABLE Dividends (
    DividendID INT PRIMARY KEY IDENTITY(1,1),
    StockID INT FOREIGN KEY REFERENCES Stocks(StockID),
    DividendDate DATE NOT NULL,
    DividendAmount DECIMAL(10, 2) NOT NULL
);

-- Table for storing user's watchlist
CREATE TABLE Watchlist (
    WatchlistID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    StockID INT FOREIGN KEY REFERENCES Stocks(StockID),
    DateAdded DATETIME DEFAULT GETDATE()
);

-- Table for storing market indices
CREATE TABLE MarketIndices (
    IndexID INT PRIMARY KEY IDENTITY(1,1),
    IndexName NVARCHAR(100) NOT NULL,
    IndexSymbol NVARCHAR(10) NOT NULL
);

-- Table for storing components of each market index
CREATE TABLE IndexComponents (
    IndexComponentID INT PRIMARY KEY IDENTITY(1,1),
    IndexID INT FOREIGN KEY REFERENCES MarketIndices(IndexID),
    StockID INT FOREIGN KEY REFERENCES Stocks(StockID),
    DateAdded DATETIME DEFAULT GETDATE()
);
