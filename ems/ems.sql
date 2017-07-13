SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `latrix`
--

-- ---------------------------------------------------
--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
`name` char(20) DEFAULT NULL,
  `userid` char(10) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
`repassword` char(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `contact` varchar(40) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
`usertype` enum('manager','employee') DEFAULT 'employee'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','admin','admin','admin','a@gmail.com','44433336','asdffgg','manager'),('kamal','kamal1','12345','12345','customer@gmail.com','69721642','dsagdshjdj','employee');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE IF NOT EXISTS `designation` (
  `desig_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`desig_id`),
  UNIQUE KEY `desig_id_UNIQUE` (`desig_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`desig_id`, `name`) VALUES
(1, 'Manager'),
(2, 'Office Assistance');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE IF NOT EXISTS `emp` (
  `emp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(60) NOT NULL DEFAULT 'unknown',
    `email` varchar(60) NOT NULL DEFAULT 'unknown',
    `past_leave` int(11) NOT NULL,
  `mobile_phone` varchar(15) NOT NULL,
  `av_leave` int(10) unsigned NOT NULL DEFAULT '0',
   PRIMARY KEY (`emp_id`),
    KEY `idx_name` (`name`)
)


INSERT INTO `emp` (`emp_id`,  `name`, `email`,`past_leave`, `mobile_phone`, `av_leave`) VALUES
(1,  'Admin', 'a@gmail.com',0, '999999999', 0),
(2, 'Krishno', 'k@gmail.com', 0, '3333333', 0);


-- --------------------------------------------------------

--
-- Table structure for table `emp_leave`
--

CREATE TABLE IF NOT EXISTS `emp_leave` (
  `emp_leave_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) unsigned NOT NULL,
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `end_date` date NOT NULL DEFAULT '0000-00-00',
  `workdays` decimal(4,1) unsigned NOT NULL DEFAULT '0.0',
  `type_id` int(11) unsigned NOT NULL,
  `submit_date` date NOT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `approval_date` date NOT NULL,
  `approval_emp_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`emp_leave_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_start` (`start_date`),
  KEY `fk_emp_leave_emp` (`emp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `e_leave`
--

INSERT INTO `e_leave` (`emp_leave_id`, `emp_id`, `leavetype`,`start_date`, `end_date`, `description`,`approved`, `approval_emp_id`) VALUES
('4',2, 'personal', '2013-01-18', '2013-01-12', 'arranged', 1,1);

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE IF NOT EXISTS `leave_types` (
  `leave_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `isPaid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isAWOL` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isAnnual` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`leave_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`leave_type_id`, `name`, `description`, `isPaid`, `isAWOL`, `isAnnual`) VALUES
(1, 'CL', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE IF NOT EXISTS `titles` (
  `title_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`title_id`, `name`) VALUES
(1, 'Mr.'),
(2, 'Mrs.'),
(3, 'Ms.'),
(4, 'Dr.');

-- --------------------------------------------------------

--
-- Table structure for table `yesno`
--

CREATE TABLE IF NOT EXISTS `yesno` (
  `idyesno` int(11) NOT NULL,
  `option` varchar(5) NOT NULL,
  PRIMARY KEY (`idyesno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `yesno`
--

INSERT INTO `yesno` (`idyesno`, `option`) VALUES
(1, 'Yes'),
(2, 'No');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_designation1` FOREIGN KEY (`designation_desig_id`) REFERENCES `designation` (`desig_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `emp_leave`
--
ALTER TABLE `emp_leave`
  ADD CONSTRAINT `emp_leave_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `leave_types` (`leave_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `emp_leave_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
