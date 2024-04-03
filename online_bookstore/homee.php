<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookCorner</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
</head>

<body>

    <header>
        <h1>BookCorner</h1>
        <nav style="background-color: rgb(60, 124, 197);">
        <ul>
            <li><a href="#books">Browse Books</a></li>
            <li><a href="cart.php">Cart</a></li>
        </ul>
        </nav>
    </header>


<main>

<section id="books">
      <h2>Book List</h2>
      

        <?php include 'books.php'; // Include the book data retrieval script ?>
            <!-- ADVANTURES BOOK -->
            <div class="adventure">
                <h2>advanture</h2>
                <?php
                // SQL query to retrieve books
                $sql = "SELECT title, author_fname, author_lname FROM books where genre_id=1"; // Replace "books" with your actual table name
                $result = mysqli_query($conn, $sql);

                // Prepare the data for the front-end
                $books = array();
                if (mysqli_num_rows($result) > 0) {
                    // Loop through each book row and add it to the $books array
                while($row = mysqli_fetch_assoc($result)) {
                    $books[] = $row;}}
            ?>

        <?php if (count($books) > 0): ?>
                <table>
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                       
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($books as $book): ?>
                        <tr>
                        <td><?php echo $book['title']; ?></td>
                        <td><?php echo $book['author_fname'] . ' ' . $book['author_lname']; ?></td>
                        
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
                <?php else: ?>
                <p>There are currently no books available.</p>
                <?php endif; ?>
</div>
        
      
   <!-- COMEDY -->

    <div class="adventure">
            <h2>comedy</h2>
            <?php
                // SQL query to retrieve books
                $sql = "SELECT title, author_fname, author_lname FROM books where genre_id=2"; // Replace "books" with your actual table name
                $result = mysqli_query($conn, $sql);

                // Prepare the data for the front-end
                $books = array();
                if (mysqli_num_rows($result) > 0) {
                // Loop through each book row and add it to the $books array
                while($row = mysqli_fetch_assoc($result)) {
                $books[] = $row;} }
                // Close the connection
                // mysqli_close($conn);
                
                ?>

            <?php if (count($books) > 0): ?>
                    <table>
                        <thead>
                        <tr>
                            <th>Title</th>
                            <th>Author</th>
                          
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($books as $book): ?>
                            <tr>
                            <td><?php echo $book['title']; ?></td>
                            <td><?php echo $book['author_fname'] . ' ' . $book['author_lname']; ?></td>
                            
                            </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                    <?php else: ?>
                    <p>There are currently no books available.</p>
                    <?php endif; ?>
</div>
         


    </section>
  </main>

</body>
</html>

