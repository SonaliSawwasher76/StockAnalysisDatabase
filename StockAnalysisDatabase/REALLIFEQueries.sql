--BASIC QUERIES

--1.Retrive all stocks information
	select * from Stocks

--2.Get historical prices for a specific stock (e.g., AAPL):
	select * from HistoricalPrices h inner join stocks s
	on h.stockid=s.stockid where s.symbol='AAPL'

--3.Get the latest real-time price for each stock:
	Select s.Symbol,s.CompanyName,r.Price,r.Datetime from RealTimePrices r inner join stocks s
	on r.stockid=s.stockid 

--4.Calculate the average closing price for each stock over the last 30 days:
	 Select s.Symbol,s.CompanyName,avg(h.ClosePrice) average from HistoricalPrices h inner join Stocks s
	 on h.StockID=s.StockID where h.Date >= DATEADD(DAY, -30, GETDATE())
	 group by Symbol,CompanyName

--5.Get the highest and lowest prices of each stock in the last month:
	Select s.Symbol,s.CompanyName,Min(h.LowPrice) LowPrice,max(H.highprice)HighPrice from HistoricalPrices h inner join Stocks s
	 on h.StockID=s.StockID where h.Date >= DATEADD(DAY, -30, GETDATE())
	 group by Symbol,CompanyName

--6.Retrieve all user information:
	select * from Users

--7.Get all portfolios and their associated users:
	select P.PortfolioName,U.UserName,u.Email from Portfolios P inner join Users U
	on P.UserID=U.UserID

--8.Get all transactions for a specific portfolio:
	SELECT t.*, s.Symbol FROM Transactions t Inner JOIN Stocks s ON t.StockID = s.StockID
	WHERE t.PortfolioID = 1; 

--9.Calculate the total value of a user's portfolio based on the latest real-time prices for specific user:
	Select P.PortfolioName,Sum(t.Quantity * R.Price) As totalValue from Portfolios P 
	inner join Transactions T on P.PortfolioID=T.PortfolioID
	inner join RealTimePrices R on T.StockID=R.StockID
	WHERE p.UserID = 1  AND r.DateTime = (SELECT MAX(DateTime) FROM RealTimePrices WHERE StockID = t.StockID)
	group by P.PortfolioName

--10.Get all alerts set by a specific user and the current status of those alerts:
  
 SELECT a.*, s.Symbol, rtp.Price AS CurrentPrice,
       CASE 
           WHEN a.AlertType = 'ABOVE' AND rtp.Price > a.AlertPrice THEN 'TRIGGERED'
           WHEN a.AlertType = 'BELOW' AND rtp.Price < a.AlertPrice THEN 'TRIGGERED'
           ELSE 'NOT TRIGGERED'
       END AS AlertStatus
FROM Alerts a
JOIN Stocks s ON a.StockID = s.StockID
JOIN RealTimePrices rtp ON a.StockID = rtp.StockID
WHERE a.UserID = 1  -- Replace with the desired UserID
AND rtp.DateTime = (SELECT MAX(DateTime) FROM RealTimePrices WHERE StockID = a.StockID);

--11.Get the transaction history for a specific stock:

SELECT t.*, u.UserName, p.PortfolioName
FROM Transactions t
JOIN Portfolios p ON t.PortfolioID = p.PortfolioID
JOIN Users u ON p.UserID = u.UserID
WHERE t.StockID = 1; 

--12.Calculate the average price at which each user bought a specific stock:

select u.UserName, s.Symbol, AVG(t.Price) AS AvgBuyPrice from Transactions T 
inner join Portfolios P on T.PortfolioID=P.PortfolioID
inner join Users U on U.UserID=P.UserID
inner join Stocks S on S.StockID=t.StockID
where TransactionType='Buy' and t.StockID=1
group by u.UserName,s.Symbol 


--13.Retrieve all dividend payments for a specific stock:
	SELECT d.*, s.Symbol FROM Dividends d inner JOIN Stocks s ON d.StockID = s.StockID WHERE s.Symbol = 'AAPL';

--14.Get the total dividend income for a user's portfolio:
   Select P.PortfolioName,Sum(D.DividendAmount * t.Quantity) As TotalDividendIncome from Portfolios P 
   inner join Transactions T on P.PortfolioID=T.PortfolioID
   inner join Dividends D on D.StockID=T.StockID
   where t.StockID=2
   group by P.PortfolioName

--15.Get the watchlist of a specific user and the latest price of each stock:
	Select S.Symbol,S.CompanyName,r.Price as LatestPrice,w.* from Watchlist w 
	inner join stocks s on w.StockID=s.StockID
	inner join RealTimePrices R on w.StockID=R.StockID
	where w.UserID=2 and r.DateTime=(select max(DateTime) from RealTimePrices where StockID=w.StockID)

--16.Get the components of a specific market index:
	SELECT ic.*, mi.IndexName, s.Symbol
FROM IndexComponents ic
JOIN MarketIndices mi ON ic.IndexID = mi.IndexID
JOIN Stocks s ON ic.StockID = s.StockID
WHERE mi.IndexSymbol = 'SPX';

--17.Calculate the total value of each market index based on the latest real-time prices:
	select m.IndexName, SUM(r.Price) AS TotalIndexValue from IndexComponents I
	inner join MarketIndices M on I.IndexID=M.IndexID
	inner join RealTimePrices R on R.StockID=I.StockID
	where r.DateTime=(Select max(datetime) from RealTimePrices where StockID=I.StockID)
	 Group by M.Indexname

--18.Get the historical performance of a specific stock over the last year:
	select YEAR(h.Date) AS Year, MONTH(h.Date) AS Month, AVG(h.ClosePrice) AS AvgMonthlyClosePrice 
	from HistoricalPrices H
	inner join Stocks S on H.StockID=S.StockID
	WHERE s.Symbol = 'AAPL'
	AND h.Date >= DATEADD(YEAR, -1, GETDATE())
	GROUP BY YEAR(h.Date), MONTH(h.Date)
	ORDER BY Year, Month;

--19.Find the top 5 stocks with the highest average trading volume over the last month:

	select s.Symbol, AVG(h.Volume) AS AvgMonthlyVolume from HistoricalPrices h 
	inner join Stocks s on s.StockID=h.StockID 

--20.Get the watchlist of a specific user and the latest price of each stock:

	SELECT w.*, s.Symbol, rtp.Price AS LatestPrice
FROM Watchlist w
JOIN Stocks s ON w.StockID = s.StockID
JOIN RealTimePrices rtp ON w.StockID = rtp.StockID
WHERE w.UserID = 1  -- Replace with the desired UserID
AND rtp.DateTime = (SELECT MAX(DateTime) FROM RealTimePrices WHERE StockID = w.StockID);






	 


