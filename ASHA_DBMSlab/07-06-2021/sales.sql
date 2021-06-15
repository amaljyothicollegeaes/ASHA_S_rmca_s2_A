/*creating and inserting table clientmaster*/
CREATE TABLE `clientmaster` (
  `client_no` int(11) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `clientmaster` (`client_no`, `cname`, `city`) VALUES
(101, 'senchu', 'kannur'),
(102, 'sobin', 'kannur'),
(103, 'sajan', 'mumbai'),
(104, 'siju', 'gujarath'),
(105, 'george', 'kottayam');
ALTER TABLE `clientmaster`
  ADD PRIMARY KEY (`client_no`);
  /*creating and inserting table salesmaster*/
  INSERT INTO `salesmaster` (`salesmanno`, `sname`, `city`) VALUES
(1, 'biju', 'mumbai'),
(2, 'amith', 'mumbai'),
(3, 'sreelal', 'kannur'),
(4, 'anoop', 'thrissur'),
(5, 'goutham', 'pala');

CREATE TABLE `salesorder` (
  `order_no` int(11) NOT NULL,
  `client_no` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL
)
ALTER TABLE `salesmaster`
  ADD PRIMARY KEY (`salesmanno`);
  /*creating and inserting table salesorder*/
  CREATE TABLE `salesorder` (
  `order_no` int(11) NOT NULL,
  `client_no` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `salesorder` (`order_no`, `client_no`, `order_date`) VALUES
(0, 101, '2013-06-01'),
(1, 103, '2013-02-01'),
(2, 103, '2013-03-21'),
(3, 102, '2013-03-02'),
(4, 105, '2013-04-02');
ALTER TABLE `salesorder`
  ADD PRIMARY KEY (`order_no`);
/*____________________________________________________________________________________________________*/
/*a)Retrieve all orders placed by a client named sajan.*/
SELECT * FROM salesorder WHERE client_no IN (SELECT client_no FROM clientmaster WHERE cname = 'Sajan')
/*b)Retrieve the names of all clients and salesman in the city of mumbai.*/
SELECT c.cname,s.sname FROM clientmaster c,salesmaster s WHERE c.city="mumbai" and s.city IN (SELECT city FROM salesmaster where city="mumbai")
/*c)Retrieve the order number, cname, order date from client master and sales order table.*/

SELECT c.cname,s.order_date,s.order_no FROM clientmaster c,salesorder s WHERE c.client_no IN (SELECT s.client_no from salesorder)


  