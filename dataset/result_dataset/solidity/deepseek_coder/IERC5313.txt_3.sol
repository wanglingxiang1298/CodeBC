matlab
% Load the data
unemployment_data = readtable('unemployment_data.csv');
stock_market_data = readtable('stock_market_data.csv');
government_spending_data = readtable('government_spending_data.csv');
% Plot the unemployment rates over time
plot(unemployment_data.Date, unemployment_data.Rate);
xlabel('Date');
ylabel('Unemployment Rate');
title('Unemployment Rates Over Time');
% Plot the stock market performance
plot(stock_market_data.Date, stock_market_data.Price);
xlabel('Date');
ylabel('Stock Market Price');
title('Stock Market Performance Over Time');
% Plot the government spending over time
plot(government_spending_data.Year, government_spending_data.Spending);
xlabel('Year');
ylabel('Government Spending');
title('Government Spending Over Time');