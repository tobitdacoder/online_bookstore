<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Book List</title>
</head>
<body>
  <h1>Book List</h1>
  <?php include 'books.php'; // Include the book data retrieval script ?>
  <?php if (count($books) > 0): ?>
    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th>Author</th>
          <th>ISBN</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($books as $book): ?>
          <tr>
            <td><?php echo $book['title']; ?></td>
            <td><?php echo $book['author_fname'] . ' ' . $book['author_lname']; ?></td>
            <td><?php echo $book['ISBN']; ?></td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  <?php else: ?>
    <p>There are currently no books available.</p>
  <?php endif; ?>
</body>
</html>
