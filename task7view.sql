use library;
drop table members;
drop table loans;
drop table borrowers;
drop table books;
CREATE TABLE Books (book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(6,2),
    published_year INT);
    CREATE TABLE Borrowers (borrower_id INT PRIMARY KEY,
    name VARCHAR(100),
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id));
    INSERT INTO Books VALUES
(1, '1984', 'George Orwell', 'Dystopian', 299.00, 1949),
(2, 'The Alchemist', 'Paulo Coelho', 'Fiction', 350.00, 1988),
(3, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Autobiography', 400.00, 1999);
INSERT INTO Borrowers VALUES
(1, 'Riya Singh', 1, '2025-06-01', '2025-06-10'),
(2, 'Amit Joshi', 2, '2025-06-05', '2025-06-12'),
(3, 'Sana Khan', 1, '2025-06-15', NULL);
CREATE VIEW book_borrow_summary AS
SELECT b.book_id, b.title,
    COUNT(br.borrower_id) AS total_times_borrowed,
    MAX(br.borrow_date) AS last_borrowed_on
FROM Books b
LEFT JOIN Borrowers br ON b.book_id = br.book_id
GROUP BY b.book_id, b.title;
SELECT * FROM book_borrow_summary; 
SELECT title, total_times_borrowed
FROM book_borrow_summary
WHERE total_times_borrowed > 1;
create view public_books_view as select title, author, published_year from books;
select * from public_books_view;

