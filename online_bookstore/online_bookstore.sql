-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2024 at 04:56 PM
-- Server version: 8.0.36
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN` int NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `author_fname` varchar(50) DEFAULT NULL,
  `author_lname` varchar(50) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `description_of_book` varchar(200) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT '0.00',
  `genre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `title`, `author_fname`, `author_lname`, `publication_date`, `description_of_book`, `price`, `genre_id`) VALUES
(1, 'The Lord of the Rings', 'J. R. R.', 'Tolkien', '1954-12-15', NULL, 24.99, 1),
(2, 'The Hitchhiker\'s Guide to the Galaxy', 'Douglas', 'Adams', '1979-10-12', NULL, 15.99, 2),
(3, 'Pride and Prejudice', 'Jane', 'Austen', '1813-01-28', NULL, 12.50, 3),
(4, 'The Hunger Games', 'Suzanne', 'Collins', '2008-09-01', NULL, 10.99, 4),
(5, 'Gone Girl', 'Gillian', 'Flynn', '2012-06-26', NULL, 17.95, 5),
(6, 'A Song of Ice and Fire (Series)', 'George', 'R. Martin', '1996-08-01', NULL, 29.99, 6),
(7, 'Dune', 'Frank', 'Herbert', '1965-08-01', NULL, 19.99, 7),
(8, 'The Adventures of Tom Sawyer', 'Mark', 'Twain', '1876-12-01', NULL, 8.99, 1),
(9, 'Catch-22', 'Joseph', 'Heller', '1961-11-01', NULL, 14.50, 2),
(10, 'Wuthering Heights', 'Emily', 'Brontë', '1847-12-08', NULL, 9.95, 3),
(11, 'Ender\'s Game', 'Orson', 'Card', '1985-01-15', NULL, 11.99, 4),
(12, 'The Girl with the Dragon Tattoo', 'Stieg', 'Larsson', '2005-09-05', NULL, 16.50, 5),
(13, 'The Wheel of Time (Series)', 'Robert', 'Jordan', '1990-01-10', NULL, 24.95, 6),
(14, '1984', 'George', 'Orwell', '1949-06-08', NULL, 13.99, 7),
(15, 'Treasure Island', 'Robert', 'Stevenson', '1883-11-14', NULL, 7.99, 1),
(16, 'The Importance of Being Earnest', 'Oscar', 'Wilde', '1895-02-14', NULL, 10.50, 2),
(17, 'Jane Eyre', 'Charlotte', 'Brontë', '1847-04-18', NULL, 8.50, 3),
(18, 'The Martian', 'Andy', 'Weir', '2011-10-04', NULL, 12.99, 4),
(19, 'The Silence of the Lambs', 'Thomas', 'Harris', '1988-02-08', NULL, 18.99, 5),
(20, 'Mistborn (Series)', 'Brandon', 'Sanderson', '2006-06-19', NULL, 22.99, 6),
(21, 'Fahrenheit 451', 'Ray', 'Bradbury', '1953-10-09', NULL, 11.50, 7),
(22, 'To Kill a Mockingbird', 'Harper', 'Lee', '1960-07-11', NULL, 14.99, 3),
(23, 'The Count of Monte Cristo', 'Alexandre', ' Dumas', '1844-01-01', NULL, 16.99, 6),
(24, 'The Book Thief', 'Markus', 'Zusak', '2005-03-01', NULL, 15.50, 3),
(25, 'The Martian Chronicles', 'Ray', ' Bradbury', '1950-10-26', NULL, 9.99, 7);

-- --------------------------------------------------------

--
-- Table structure for table `book_genre`
--

CREATE TABLE `book_genre` (
  `ISBN` int DEFAULT NULL,
  `genre_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `name`, `price`, `quantity`, `image`) VALUES
(2, 4, 'tobiti', 33, 1, '1984.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_ID` int NOT NULL,
  `customer_ID` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts_books`
--

CREATE TABLE `carts_books` (
  `id` int NOT NULL,
  `cart_id` int DEFAULT NULL,
  `book_ID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_ID` int NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT 'N/A',
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_ID`, `f_name`, `l_name`, `address`, `password`, `email`, `create_at`) VALUES
(1, 'Aisha', ' Diallo', 'N/A', 'password1', 'aisha.diallo@example.com', '2024-03-29 11:49:00'),
(2, 'Boubacar', ' Keita', 'N/A', 'password2', 'boubacar.keita@example.com', '2024-03-29 11:49:00'),
(3, 'Chioma', ' Adaeze', 'N/A', 'password3', 'chioma.adaeze@example.com', '2024-03-29 11:49:00'),
(4, 'Daniel', ' Oduwole', 'N/A', 'password4', 'daniel.oduwole@example.com', '2024-03-29 11:49:00'),
(5, 'Esmeralda', ' Hernandez', 'N/A', 'password5', 'esmeralda.hernandez@example.com', '2024-03-29 11:49:00'),
(6, 'Fatima', ' Laouali', 'N/A', 'password6', 'fatima.laouali@example.com', '2024-03-29 11:49:00'),
(7, 'Gilbert', ' N\'golo', 'N/A', 'password7', 'gilbert.ngolo@example.com', '2024-03-29 11:49:00'),
(8, 'Hadijah', ' Yusuf', 'N/A', 'password8', 'hadijah.yusuf@example.com', '2024-03-29 11:49:00'),
(9, 'Ibrahim', ' Mohamed', 'N/A', 'password9', 'ibrahim.mohamed@example.com', '2024-03-29 11:49:00'),
(10, 'Jabari', ' Johnson', 'N/A', 'password10', 'jabari.johnson@example.com', '2024-03-29 11:49:00'),
(11, 'Khadija', ' Diallo', 'N/A', 'password11', 'khadija.diallo@example.com', '2024-03-29 11:49:00'),
(12, 'Lompoc', '  Manding', 'N/A', 'password12', 'lompoc.manding@example.com', '2024-03-29 11:49:00'),
(13, 'Makena', '  Adebayo', 'N/A', 'password13', 'makena.adebayo@example.com', '2024-03-29 11:49:00'),
(14, 'Nneka', '  Okafor', 'N/A', 'password14', 'nneka.okafor@example.com', '2024-03-29 11:49:00'),
(15, 'Obinna', '  Eke', 'N/A', 'password15', 'obinna.eke@example.com', '2024-03-29 11:49:00'),
(16, 'Phillip', '  Mbhele', 'N/A', 'password16', 'phillip.mbhele@example.com', '2024-03-29 11:49:00'),
(17, 'Quanisha', '  Adams', 'N/A', 'password17', 'quanisha.adams@example.com', '2024-03-29 11:49:00'),
(18, 'Rashida', '  Khan', 'N/A', 'password18', 'rashida.khan@example.com', '2024-03-29 11:49:00'),
(19, 'Sipho', '  Mthembu', 'N/A', 'password19', 'sipho.mthembu@example.com', '2024-03-29 11:49:00'),
(20, 'Tsitsi', '    Moyo', 'N/A', 'password20', 'tsitsi.moyo@example.com', '2024-03-29 11:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_ID` int NOT NULL,
  `genre_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_ID`, `genre_name`) VALUES
(4, 'Action'),
(1, 'Adventure'),
(2, 'Comedy'),
(3, 'Romantic'),
(6, 'Saga'),
(7, 'Science Fiction'),
(5, 'Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(11) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 4, 'tbushenyula toby', '0998258052', 'mrbushenyula@gmail.com', 'cash on delivery', 'mukono, kampala, Uganda', ', tobiti (1) ', 33, '03-Apr-2024', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ISBN` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ISBN`, `name`, `price`, `image`) VALUES
('45678', 'tobiti', 33, '1984.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `ISBN` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(1, 'tobit', 'mrbushenyula@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'admin'),
(3, 'theophile', 'user@gmail.com', 'e1f82dfe0b7f23af859006f362545a85', 'user'),
(4, 'cathy', 'users@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `book_genre`
--
ALTER TABLE `book_genre`
  ADD KEY `fk_book_book_id` (`ISBN`),
  ADD KEY `fk_book_genre_id` (`genre_ID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_ID`),
  ADD KEY `fk_carts_c_id` (`customer_ID`);

--
-- Indexes for table `carts_books`
--
ALTER TABLE `carts_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cbook_id` (`book_ID`),
  ADD KEY `fk_ccart_id` (`cart_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_ID`),
  ADD UNIQUE KEY `password` (`password`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_ID`),
  ADD UNIQUE KEY `genre_name` (`genre_name`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD KEY `fk_stock_ISBN` (`ISBN`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `ISBN` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts_books`
--
ALTER TABLE `carts_books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_genre`
--
ALTER TABLE `book_genre`
  ADD CONSTRAINT `fk_book_book_id` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_book_genre_id` FOREIGN KEY (`genre_ID`) REFERENCES `genres` (`genre_ID`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_c_id` FOREIGN KEY (`customer_ID`) REFERENCES `customers` (`customer_ID`) ON DELETE CASCADE;

--
-- Constraints for table `carts_books`
--
ALTER TABLE `carts_books`
  ADD CONSTRAINT `fk_cbook_id` FOREIGN KEY (`book_ID`) REFERENCES `books` (`ISBN`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ccart_id` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_ID`) ON DELETE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_stock_ISBN` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
