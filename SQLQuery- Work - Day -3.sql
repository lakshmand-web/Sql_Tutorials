/*--QUESTION:
Calculate the total spending for each customer. A customer may make multiple purchases.
Return customer_name and total_spent. Order the result by total_spent in descending order */


-- Step 01
-- Create a table with required columns.
CREATE TABLE purchase (                 -- Creating table with the name 'purchases'
    customer_id INT,                     -- Added Customer ID column INT datatype
    customer_name VARCHAR(50),           -- Added Customer name column with VARCHAR datatype
    purchase_day INT,                    -- Added Purchase day column with INT datatype
    amount INT                            -- Added amount column with INT datatype
);

-- Step 02
-- Insert the Data into the table columns

INSERT INTO purchase (customer_id, customer_name, purchase_day, amount) VALUES
(1, 'Lakshman', 1, 500),    
(2, 'Teja', 2, 700),        
(1, 'Lakshman', 3, 300),     
(3, 'Nagesh', 1, 1000),      
(2, 'Teja', 4, 200),         
(3, 'Nagesh', 5, 500),      
(4, 'Rushi', 2, 450),       
(4, 'Rushi', 3, 600),        
(1, 'Lakshman', 5, 350),     
(2, 'Teja', 6, 250);


--Table before output :

Select * from purchase

--Solution :

Select customer_name,      -- Here Select command is used to select the column from which we are getting the results as per question.
sum(amount) AS total_spent  -- Here sum command is used to calculate the total amout spent by each customer and As is used to name the column where the total calculated amount is shown for each customer.
From purchase       -- Here From command refers the source table from which table we are calculating this.
Group by customer_name  -- Here Group by command is used to group all rows of the same customer together 
order by total_spent DESC; ---  Here Order by command is used to arrange the results data and DESC indicate the Descending order.

-- Overall summary:
-- we have calculated the amount spent by each customer by using commands like CREATE TABLE, INSERT INTO, SELECT, SUM, AS, FROM, GROUP BY, ORDER BY, DESC


-- To delete the created table 

drop table purchase