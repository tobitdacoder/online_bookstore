<?php

require_once("connect.php");

if (isset($_POST["book_id"]) && isset($_POST["quantity"])) {
    $book_id = $_POST["book_id"];
    $quantity = $_POST["quantity"];

    // Create a temporary cart ID (replace with a more robust session handling mechanism)
    session_start();
    if (!isset($_SESSION["cart_id"])) {
        $_SESSION["cart_id"] = uniqid(); // Generate a unique ID
    }
    $cart_id = $_SESSION["cart_id"];

    $sql = "INSERT INTO cart_items (cart_id, book_id, quantity) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iii", $cart_id, $book_id, $quantity);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Successfully added to cart!";
    } else {
        echo "Error adding item to cart.";
    }

    $stmt->close();
} else {
    echo "Missing book ID or quantity.";
}

$conn->close();

?>