
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS agents;


CREATE TABLE agents (
    agent_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(20),
    region VARCHAR(100) NOT NULL,
    specialization VARCHAR(50),
    hire_date DATE,
    commission_rate DECIMAL(5,2),
    total_sales DECIMAL(15,2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    phone VARCHAR(20),
    region VARCHAR(100) NOT NULL,
    customer_type VARCHAR(30),
    budget_range VARCHAR(30),
    registration_date DATE,
    last_activity_date DATE,
    status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE properties (
    property_id INTEGER PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    region VARCHAR(100) NOT NULL,
    property_type VARCHAR(30),
    bedrooms INTEGER,
    price DECIMAL(12,2),
    square_feet INTEGER,
    listing_date DATE,
    status VARCHAR(30) DEFAULT 'Available',
    agent_id INTEGER,
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    property_id INTEGER,
    agent_id INTEGER,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(12,2),
    commission DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'Completed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

CREATE INDEX idx_agent_region ON agents(region);
CREATE INDEX idx_customer_region ON customers(region);
CREATE INDEX idx_property_region ON properties(region);
CREATE INDEX idx_transaction_date ON transactions(transaction_date);
CREATE INDEX idx_transaction_region ON transactions(transaction_date, agent_id);


INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (1, 'Rajesh Kumar', 'agent1@realty.com', '+91-7599310825', 'Delhi NCR', 'Residential', '2025-06-20', 3.35, 4428485.95, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (2, 'Priya Sharma', 'agent2@realty.com', '+91-7127978094', 'Delhi NCR', 'Residential', '2022-07-21', 1.72, 6906905.48, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (3, 'Amit Patel', 'agent3@realty.com', '+91-7854001193', 'North Mumbai', 'Commercial', '2024-04-21', 2.76, 1371503.58, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (4, 'Sneha Reddy', 'agent4@realty.com', '+91-7027911967', 'Delhi NCR', 'Investment', '2024-05-16', 2.62, 4894669.92, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (5, 'Vikram Singh', 'agent5@realty.com', '+91-8445662585', 'Chennai', 'Commercial', '2023-03-29', 2.35, 3176713.0, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (6, 'Kavya Nair', 'agent6@realty.com', '+91-9592983555', 'North Mumbai', 'Residential', '2023-06-24', 1.74, 12864921.13, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (7, 'Rohit Gupta', 'agent7@realty.com', '+91-8625792787', 'Central Mumbai', 'Residential', '2023-01-13', 2.84, 14623620.7, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (8, 'Anita Jain', 'agent8@realty.com', '+91-7196814233', 'North Mumbai', 'Luxury', '2023-08-01', 2.94, 10864005.71, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (9, 'Suresh Rao', 'agent9@realty.com', '+91-7433797840', 'Delhi NCR', 'Commercial', '2023-12-27', 3.96, 12974448.09, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (10, 'Deepika Shah', 'agent10@realty.com', '+91-8589915144', 'Pune', 'Luxury', '2023-01-25', 3.09, 6107650.51, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (11, 'Karan Mehta', 'agent11@realty.com', '+91-7306671447', 'Central Mumbai', 'Commercial', '2024-02-11', 3.25, 10569667.32, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (12, 'Ritu Agarwal', 'agent12@realty.com', '+91-8629748727', 'Bangalore', 'Commercial', '2022-08-13', 3.32, 3287634.91, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (13, 'Sanjay Verma', 'agent13@realty.com', '+91-7983753977', 'Central Mumbai', 'Commercial', '2023-10-16', 3.61, 11863998.76, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (14, 'Pooja Malhotra', 'agent14@realty.com', '+91-9436019774', 'Chennai', 'Residential', '2023-11-03', 2.5, 1926640.47, 'Active');
INSERT INTO agents (agent_id, name, email, phone, region, specialization, hire_date, commission_rate, total_sales, status) VALUES (15, 'Rahul Chopra', 'agent15@realty.com', '+91-9761027762', 'Delhi NCR', 'Luxury', '2024-06-01', 3.14, 6538846.61, 'Active');


INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (1, 'Arjun Mehta', 'customer1@email.com', '+91-9411057787', 'Pune', 'Seller', '1Cr-2Cr', '2025-04-19', '2025-08-24', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (2, 'Sonia Kapoor', 'customer2@email.com', '+91-9506254832', 'Bangalore', 'Investor', 'Above 5Cr', '2024-06-27', '2025-07-13', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (3, 'Raj Malhotra', 'customer3@email.com', '+91-9119634399', 'Pune', 'Investor', '50L-1Cr', '2025-04-20', '2025-08-07', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (4, 'Neha Singh', 'customer4@email.com', '+91-7687117441', 'North Mumbai', 'Buyer', 'Under 50L', '2025-04-05', '2025-07-30', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (5, 'Vikash Kumar', 'customer5@email.com', '+91-8639042338', 'Chennai', 'Renter', 'Above 5Cr', '2025-07-05', '2025-08-15', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (6, 'Riya Jain', 'customer6@email.com', '+91-7049310608', 'Bangalore', 'Renter', 'Above 5Cr', '2024-12-25', '2025-08-04', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (7, 'Abhishek Sharma', 'customer7@email.com', '+91-9752909971', 'Delhi NCR', 'Buyer', 'Above 5Cr', '2023-08-02', '2025-08-22', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (8, 'Priya Reddy', 'customer8@email.com', '+91-8948728483', 'Central Mumbai', 'Buyer', '1Cr-2Cr', '2024-06-20', '2025-08-29', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (9, 'Rohit Agarwal', 'customer9@email.com', '+91-9180476188', 'North Mumbai', 'Investor', 'Above 5Cr', '2023-07-21', '2025-08-28', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (10, 'Kavita Nair', 'customer10@email.com', '+91-7656439677', 'North Mumbai', 'Investor', 'Above 5Cr', '2023-12-25', '2025-08-27', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (11, 'Sanjay Patel', 'customer11@email.com', '+91-9277851678', 'Central Mumbai', 'Seller', 'Above 5Cr', '2023-07-04', '2025-07-11', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (12, 'Meera Shah', 'customer12@email.com', '+91-8558990517', 'North Mumbai', 'Investor', '2Cr-5Cr', '2025-08-20', '2025-09-01', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (13, 'Ajay Gupta', 'customer13@email.com', '+91-9436779490', 'Chennai', 'Investor', '50L-1Cr', '2025-07-11', '2025-08-24', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (14, 'Nisha Rao', 'customer14@email.com', '+91-9287955558', 'North Mumbai', 'Buyer', '2Cr-5Cr', '2025-06-30', '2025-07-22', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (15, 'Kiran Verma', 'customer15@email.com', '+91-9361388464', 'Chennai', 'Seller', '50L-1Cr', '2023-11-03', '2025-08-09', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (16, 'Sunita Chopra', 'customer16@email.com', '+91-7909666337', 'South Mumbai', 'Investor', 'Above 5Cr', '2023-12-27', '2025-08-12', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (17, 'Ramesh Tiwari', 'customer17@email.com', '+91-9791205006', 'Bangalore', 'Seller', '1Cr-2Cr', '2024-07-27', '2025-07-28', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (18, 'Geeta Bansal', 'customer18@email.com', '+91-8064746525', 'Central Mumbai', 'Renter', 'Above 5Cr', '2024-06-03', '2025-09-01', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (19, 'Vivek Saxena', 'customer19@email.com', '+91-9379074819', 'South Mumbai', 'Buyer', '1Cr-2Cr', '2025-08-18', '2025-08-02', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (20, 'Anuja Modi', 'customer20@email.com', '+91-9710566582', 'South Mumbai', 'Seller', 'Under 50L', '2025-06-28', '2025-07-25', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (21, 'Prakash Joshi', 'customer21@email.com', '+91-8419179580', 'North Mumbai', 'Seller', 'Under 50L', '2025-08-07', '2025-07-15', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (22, 'Rekha Sinha', 'customer22@email.com', '+91-7920140090', 'North Mumbai', 'Seller', '1Cr-2Cr', '2023-10-24', '2025-08-08', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (23, 'Manish Goel', 'customer23@email.com', '+91-8043665192', 'Bangalore', 'Seller', 'Above 5Cr', '2024-01-27', '2025-08-09', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (24, 'Swati Mittal', 'customer24@email.com', '+91-7416314667', 'Chennai', 'Renter', '2Cr-5Cr', '2025-02-26', '2025-09-02', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (25, 'Harish Bhat', 'customer25@email.com', '+91-9005855667', 'Delhi NCR', 'Renter', '1Cr-2Cr', '2024-07-02', '2025-08-13', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (26, 'Shilpa Desai', 'customer26@email.com', '+91-8457293575', 'Chennai', 'Buyer', 'Under 50L', '2025-07-08', '2025-08-14', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (27, 'Nitin Khanna', 'customer27@email.com', '+91-9303329764', 'Chennai', 'Buyer', '50L-1Cr', '2025-02-24', '2025-08-27', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (28, 'Payal Arora', 'customer28@email.com', '+91-8986972437', 'Pune', 'Seller', '2Cr-5Cr', '2025-03-05', '2025-08-22', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (29, 'Sachin Pandey', 'customer29@email.com', '+91-7217275224', 'South Mumbai', 'Buyer', '2Cr-5Cr', '2024-02-23', '2025-09-02', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (30, 'Divya Iyer', 'customer30@email.com', '+91-8015242176', 'Delhi NCR', 'Buyer', 'Under 50L', '2023-07-30', '2025-07-16', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (31, 'Manoj Dubey', 'customer31@email.com', '+91-8722454917', 'South Mumbai', 'Renter', '2Cr-5Cr', '2024-05-04', '2025-08-26', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (32, 'Seema Ghosh', 'customer32@email.com', '+91-8139038460', 'North Mumbai', 'Seller', '2Cr-5Cr', '2025-09-06', '2025-08-15', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (33, 'Rajesh Kulkarni', 'customer33@email.com', '+91-9387006772', 'Chennai', 'Renter', '1Cr-2Cr', '2024-07-02', '2025-07-26', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (34, 'Nidhi Agrawal', 'customer34@email.com', '+91-7935018220', 'Delhi NCR', 'Renter', '50L-1Cr', '2025-02-26', '2025-08-21', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (35, 'Vinod Yadav', 'customer35@email.com', '+91-9509023674', 'North Mumbai', 'Buyer', '1Cr-2Cr', '2025-07-12', '2025-09-05', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (36, 'Shruti Bajaj', 'customer36@email.com', '+91-7798112150', 'Pune', 'Seller', 'Under 50L', '2024-04-06', '2025-09-03', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (37, 'Ashish Sood', 'customer37@email.com', '+91-9446737272', 'North Mumbai', 'Buyer', '50L-1Cr', '2024-07-22', '2025-09-01', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (38, 'Preeti Sethi', 'customer38@email.com', '+91-9823396242', 'South Mumbai', 'Buyer', 'Above 5Cr', '2025-06-17', '2025-08-13', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (39, 'Gaurav Anand', 'customer39@email.com', '+91-8349409434', 'Bangalore', 'Investor', '1Cr-2Cr', '2025-02-11', '2025-07-28', 'Active');
INSERT INTO customers (customer_id, name, email, phone, region, customer_type, budget_range, registration_date, last_activity_date, status) VALUES (40, 'Rashmi Chawla', 'customer40@email.com', '+91-9772404776', 'South Mumbai', 'Investor', '2Cr-5Cr', '2025-04-27', '2025-07-28', 'Active');


INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (1, '408 Bannerghatta Road', 'Central Mumbai', 'Apartment', 1, 12540567.02, 2806, '2025-07-19', 'Available', 9);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (2, '319 Whitefield Road', 'Central Mumbai', 'Villa', 3, 22259875.99, 1500, '2025-03-03', 'Under Contract', 3);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (3, '549 Marathahalli', 'Bangalore', 'Office', NULL, 16068588.61, 3805, '2024-10-09', 'Available', 11);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (4, '937 Whitefield Road', 'Central Mumbai', 'Apartment', 2, 8082716.19, 938, '2024-08-24', 'Sold', 5);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (5, '389 Electronic City', 'South Mumbai', 'Office', NULL, 6682738.18, 3097, '2025-04-26', 'Rented', 5);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (6, '967 MG Road', 'North Mumbai', 'Shop', NULL, 21075006.06, 922, '2025-09-07', 'Under Contract', 13);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (7, '234 Koramangala', 'Central Mumbai', 'Villa', 4, 14688649.69, 2251, '2024-11-25', 'Available', 2);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (8, '178 HSR Layout', 'Delhi NCR', 'Villa', 5, 2828647.18, 2012, '2024-11-14', 'Sold', 7);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (9, '231 MG Road', 'Central Mumbai', 'Office', NULL, 22676574.24, 3760, '2025-08-19', 'Under Contract', 4);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (10, '799 Residency Road', 'Delhi NCR', 'Apartment', 3, 19942673.56, 2164, '2024-10-26', 'Sold', 15);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (11, '343 Marathahalli', 'South Mumbai', 'Villa', 4, 2570086.32, 3516, '2025-03-22', 'Rented', 13);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (12, '786 Marathahalli', 'Delhi NCR', 'Villa', 3, 5661550.39, 3372, '2025-07-15', 'Rented', 14);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (13, '140 Marathahalli', 'Pune', 'Villa', 2, 20781491.93, 2385, '2025-03-13', 'Under Contract', 14);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (14, '915 Marathahalli', 'South Mumbai', 'Villa', 1, 17180763.2, 2132, '2025-03-24', 'Under Contract', 14);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (15, '172 Jayanagar', 'Central Mumbai', 'Office', NULL, 16754079.99, 2137, '2024-09-26', 'Under Contract', 1);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (16, '219 HSR Layout', 'Central Mumbai', 'Villa', 5, 24138289.26, 1587, '2025-08-20', 'Available', 10);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (17, '545 Richmond Road', 'Delhi NCR', 'Office', NULL, 12037059.33, 2594, '2025-07-11', 'Rented', 15);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (18, '691 Residency Road', 'Central Mumbai', 'Apartment', 4, 2038899.4, 3803, '2024-12-07', 'Sold', 6);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (19, '542 Brigade Road', 'Delhi NCR', 'Office', NULL, 16332574.43, 3217, '2025-07-07', 'Under Contract', 9);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (20, '417 Koramangala', 'Pune', 'Office', NULL, 11255208.9, 1711, '2024-11-29', 'Sold', 4);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (21, '531 Koramangala', 'Pune', 'Villa', 5, 15089420.86, 2163, '2024-12-02', 'Available', 5);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (22, '394 Residency Road', 'Pune', 'Warehouse', NULL, 15953216.12, 5479, '2025-01-13', 'Rented', 8);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (23, '792 Residency Road', 'Bangalore', 'Shop', NULL, 20255914.18, 2980, '2024-10-06', 'Available', 5);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (24, '628 Koramangala', 'Delhi NCR', 'Warehouse', NULL, 9709329.87, 4048, '2024-09-29', 'Under Contract', 4);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (25, '926 Residency Road', 'South Mumbai', 'Apartment', 1, 7631378.51, 2446, '2024-10-31', 'Available', 8);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (26, '525 HSR Layout', 'Delhi NCR', 'Warehouse', NULL, 6472010.45, 6491, '2024-12-29', 'Rented', 4);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (27, '252 Koramangala', 'Delhi NCR', 'Apartment', 1, 19903669.36, 1396, '2025-06-10', 'Rented', 1);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (28, '671 Residency Road', 'Chennai', 'Apartment', 4, 5066799.43, 2403, '2024-10-02', 'Under Contract', 13);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (29, '554 Electronic City', 'Chennai', 'Warehouse', NULL, 11815037.41, 9176, '2025-01-23', 'Sold', 12);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (30, '983 Bannerghatta Road', 'Pune', 'Office', NULL, 19290866.09, 3940, '2024-10-17', 'Under Contract', 13);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (31, '897 Whitefield Road', 'Pune', 'Villa', 3, 12117069.65, 3422, '2025-04-15', 'Sold', 5);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (32, '444 Richmond Road', 'Bangalore', 'Apartment', 2, 5469105.13, 2068, '2024-09-18', 'Sold', 12);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (33, '320 Brigade Road', 'Pune', 'Shop', NULL, 9610271.99, 7833, '2025-02-08', 'Available', 4);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (34, '953 Airport Road', 'Pune', 'Warehouse', NULL, 23759426.77, 520, '2024-08-13', 'Rented', 8);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (35, '107 Richmond Road', 'Central Mumbai', 'Shop', NULL, 21629302.86, 7065, '2024-12-07', 'Sold', 8);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (36, '325 Palace Road', 'Pune', 'Shop', NULL, 2667570.86, 5707, '2024-10-01', 'Rented', 12);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (37, '270 Marathahalli', 'Pune', 'Villa', 5, 14284843.48, 2113, '2024-11-09', 'Available', 2);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (38, '759 Airport Road', 'South Mumbai', 'Shop', NULL, 6179767.61, 4462, '2025-02-26', 'Under Contract', 4);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (39, '566 Richmond Road', 'Central Mumbai', 'Shop', NULL, 8399902.16, 7106, '2025-05-02', 'Available', 8);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (40, '120 Indiranagar', 'Bangalore', 'Apartment', 3, 7157109.81, 781, '2024-08-05', 'Available', 13);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (41, '132 Residency Road', 'South Mumbai', 'Apartment', 5, 5504793.95, 1017, '2025-01-09', 'Available', 10);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (42, '324 Bannerghatta Road', 'Delhi NCR', 'Office', NULL, 19638656.26, 1187, '2024-11-02', 'Available', 13);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (43, '939 Commercial Street', 'Central Mumbai', 'Apartment', 5, 2590603.79, 1777, '2024-11-18', 'Rented', 7);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (44, '833 Residency Road', 'North Mumbai', 'Warehouse', NULL, 17884131.57, 4178, '2025-07-18', 'Under Contract', 14);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (45, '801 Electronic City', 'Chennai', 'Apartment', 5, 20000612.97, 1922, '2024-12-10', 'Rented', 11);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (46, '480 Brigade Road', 'Bangalore', 'Office', NULL, 2290999.45, 2220, '2025-01-01', 'Available', 7);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (47, '471 Koramangala', 'Chennai', 'Shop', NULL, 18268098.81, 7335, '2025-06-10', 'Under Contract', 10);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (48, '928 HSR Layout', 'Bangalore', 'Shop', NULL, 12692096.75, 9907, '2025-04-24', 'Under Contract', 14);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (49, '352 Marathahalli', 'North Mumbai', 'Office', NULL, 22277517.23, 1498, '2024-08-20', 'Rented', 10);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (50, '725 Koramangala', 'Pune', 'Office', NULL, 2660099.95, 3985, '2025-03-26', 'Sold', 8);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (51, '318 Richmond Road', 'Chennai', 'Office', NULL, 9827793.39, 2941, '2024-09-14', 'Under Contract', 9);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (52, '111 Whitefield Road', 'South Mumbai', 'Apartment', 2, 18561717.27, 2501, '2024-11-28', 'Sold', 12);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (53, '588 Koramangala', 'Delhi NCR', 'Shop', NULL, 12308014.64, 482, '2025-07-23', 'Under Contract', 4);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (54, '515 Indiranagar', 'South Mumbai', 'Office', NULL, 17271080.5, 2011, '2025-01-09', 'Under Contract', 7);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (55, '864 Whitefield Road', 'Central Mumbai', 'Office', NULL, 18165663.67, 1609, '2025-04-05', 'Under Contract', 4);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (56, '224 Indiranagar', 'South Mumbai', 'Office', NULL, 4749759.05, 2694, '2024-08-14', 'Sold', 4);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (57, '322 Indiranagar', 'Pune', 'Office', NULL, 18665455.03, 3613, '2024-12-14', 'Under Contract', 2);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (58, '953 Residency Road', 'Central Mumbai', 'Villa', 3, 6127155.5, 557, '2024-09-11', 'Sold', 5);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (59, '147 MG Road', 'Bangalore', 'Office', NULL, 18040600.04, 1017, '2024-10-17', 'Rented', 2);
INSERT INTO properties (property_id, address, region, property_type, bedrooms, price, square_feet, listing_date, status, agent_id) VALUES (60, '994 MG Road', 'Bangalore', 'Office', NULL, 12796129.73, 2304, '2025-03-18', 'Sold', 1);

-- Insert Transactions
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (1, 17, 56, 8, '2025-07-12', 'Sale', 8313795.12, 101615.07, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (2, 4, 10, 3, '2024-11-24', 'Rent', 2161027.71, 37700.7, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (3, 27, 39, 10, '2024-10-27', 'Sale', 15626024.02, 334574.13, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (4, 20, 56, 10, '2025-02-01', 'Rent', 11588274.68, 136821.71, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (5, 7, 49, 4, '2024-10-23', 'Sale', 5660599.44, 70393.09, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (6, 12, 36, 2, '2025-06-20', 'Sale', 8466092.67, 259749.32, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (7, 19, 3, 4, '2025-04-14', 'Lease', 6013008.28, 215194.75, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (8, 15, 60, 5, '2024-10-23', 'Lease', 13393069.34, 509071.29, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (9, 8, 35, 4, '2024-10-12', 'Sale', 18214023.18, 633828.6, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (10, 4, 11, 13, '2025-04-04', 'Lease', 15104675.58, 408977.39, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (11, 29, 8, 8, '2024-09-21', 'Rent', 14144806.86, 541467.27, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (12, 35, 32, 8, '2025-07-29', 'Lease', 1277285.29, 29327.57, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (13, 39, 17, 1, '2025-07-24', 'Sale', 19257266.49, 675521.0, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (14, 38, 2, 13, '2024-09-29', 'Rent', 11736816.2, 386062.27, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (15, 31, 34, 11, '2025-01-25', 'Rent', 4039038.37, 111315.45, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (16, 32, 6, 8, '2025-03-14', 'Rent', 6999513.68, 210713.4, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (17, 22, 27, 12, '2024-12-29', 'Rent', 13420378.97, 295430.42, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (18, 3, 30, 2, '2025-03-31', 'Rent', 6803838.83, 266067.8, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (19, 33, 53, 1, '2024-10-07', 'Lease', 9508538.73, 110547.44, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (20, 24, 40, 13, '2024-12-27', 'Lease', 9119798.64, 105318.66, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (21, 36, 9, 15, '2025-04-14', 'Rent', 17676509.04, 433805.46, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (22, 39, 52, 4, '2024-09-10', 'Sale', 6559627.7, 68287.26, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (23, 6, 15, 14, '2025-07-12', 'Rent', 18967684.48, 558243.44, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (24, 32, 60, 12, '2025-04-12', 'Lease', 14255526.78, 320246.28, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (25, 31, 16, 8, '2024-11-30', 'Sale', 7979927.26, 300492.5, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (26, 9, 56, 2, '2025-04-20', 'Rent', 7127567.24, 239710.94, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (27, 1, 19, 12, '2025-04-09', 'Lease', 11808505.99, 351872.49, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (28, 29, 35, 8, '2025-03-16', 'Rent', 11262389.63, 296233.53, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (29, 21, 56, 4, '2024-09-16', 'Sale', 11650054.02, 198130.99, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (30, 3, 21, 12, '2025-01-09', 'Lease', 18311888.27, 392550.75, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (31, 10, 32, 1, '2025-07-06', 'Lease', 19324395.01, 385711.85, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (32, 29, 7, 9, '2025-01-18', 'Sale', 14587654.64, 325295.34, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (33, 10, 5, 8, '2025-04-26', 'Rent', 12653558.31, 277422.94, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (34, 22, 55, 11, '2024-12-09', 'Rent', 19105722.06, 550320.75, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (35, 35, 3, 10, '2025-08-04', 'Sale', 12807639.83, 481924.24, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (36, 6, 28, 2, '2024-10-19', 'Lease', 17515295.04, 408287.77, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (37, 20, 58, 1, '2025-08-16', 'Rent', 16024797.57, 301282.75, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (38, 28, 10, 4, '2024-12-11', 'Rent', 11535597.21, 389621.54, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (39, 12, 6, 10, '2025-02-25', 'Lease', 13821124.31, 344560.87, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (40, 10, 15, 8, '2024-10-17', 'Rent', 9461624.73, 283898.15, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (41, 19, 44, 9, '2025-06-20', 'Sale', 9113730.78, 185619.07, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (42, 20, 41, 7, '2024-09-20', 'Rent', 9408298.35, 179356.51, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (43, 31, 7, 4, '2025-02-25', 'Lease', 7499703.57, 141565.69, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (44, 19, 2, 14, '2024-10-06', 'Rent', 5852367.41, 157884.41, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (45, 4, 59, 10, '2024-12-28', 'Rent', 15626949.1, 264150.94, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (46, 15, 41, 4, '2024-10-26', 'Rent', 13716406.94, 433820.48, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (47, 9, 41, 2, '2024-10-22', 'Lease', 1268740.19, 42703.66, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (48, 38, 24, 12, '2025-07-03', 'Sale', 18237742.34, 361136.0, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (49, 12, 13, 3, '2024-12-06', 'Rent', 10851621.29, 405900.65, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (50, 17, 59, 14, '2025-01-05', 'Rent', 15057907.34, 303589.36, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (51, 30, 5, 3, '2025-05-16', 'Lease', 14622225.89, 576090.36, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (52, 24, 6, 13, '2025-02-18', 'Sale', 5656942.28, 77543.45, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (53, 17, 38, 7, '2024-10-17', 'Rent', 2612748.99, 44455.03, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (54, 40, 57, 9, '2025-03-25', 'Lease', 4816660.4, 57301.45, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (55, 20, 42, 7, '2025-07-11', 'Sale', 1384262.81, 15387.97, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (56, 8, 7, 4, '2024-12-07', 'Sale', 8078593.71, 170703.48, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (57, 35, 27, 10, '2025-06-21', 'Rent', 13270977.0, 464627.42, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (58, 27, 18, 1, '2024-09-20', 'Rent', 4736758.85, 110560.1, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (59, 24, 7, 11, '2025-03-04', 'Lease', 18083076.14, 530644.33, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (60, 26, 18, 4, '2025-07-08', 'Rent', 2287631.76, 37432.92, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (61, 39, 2, 1, '2025-03-22', 'Sale', 19782007.63, 664860.28, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (62, 5, 54, 13, '2024-11-29', 'Sale', 11934470.13, 410445.4, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (63, 22, 50, 3, '2024-11-07', 'Sale', 5906859.5, 233444.07, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (64, 35, 17, 13, '2025-06-11', 'Sale', 13390624.03, 144262.61, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (65, 23, 51, 13, '2025-05-10', 'Lease', 6813543.51, 103752.46, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (66, 9, 48, 7, '2024-12-13', 'Sale', 15040472.86, 365293.66, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (67, 33, 38, 2, '2025-01-20', 'Lease', 4820220.25, 137150.72, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (68, 34, 20, 8, '2024-10-14', 'Sale', 1686095.45, 41089.23, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (69, 28, 44, 2, '2024-12-31', 'Lease', 18239166.17, 222603.94, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (70, 21, 39, 3, '2025-08-06', 'Sale', 5862811.99, 169976.41, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (71, 21, 25, 10, '2024-12-11', 'Rent', 9347450.64, 263250.42, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (72, 8, 55, 11, '2024-10-10', 'Lease', 14556378.37, 239462.5, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (73, 15, 27, 6, '2025-01-19', 'Rent', 8611798.18, 110683.78, 'Pending');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (74, 21, 43, 5, '2025-03-01', 'Sale', 13893010.19, 336600.36, 'Completed');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (75, 6, 6, 7, '2025-07-21', 'Lease', 14906521.97, 512084.92, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (76, 4, 38, 9, '2024-11-25', 'Rent', 13565258.66, 302834.35, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (77, 28, 56, 15, '2025-08-13', 'Rent', 12207996.78, 250866.83, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (78, 33, 14, 3, '2024-10-07', 'Rent', 4872774.95, 64547.46, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (79, 24, 8, 13, '2025-04-19', 'Lease', 4910102.34, 112310.6, 'Cancelled');
INSERT INTO transactions (transaction_id, customer_id, property_id, agent_id, transaction_date, transaction_type, amount, commission, status) VALUES (80, 40, 40, 11, '2024-10-14', 'Lease', 1011949.71, 38325.09, 'Cancelled');
