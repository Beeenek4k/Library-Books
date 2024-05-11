document.addEventListener("DOMContentLoaded", function () {
    const searchButton = document.getElementById("searchBtn");
    searchButton.addEventListener("click", searchBooks);

    function searchBooks() {
        const searchText = document.getElementById("searchID").value.toLowerCase().trim();
        const books = document.querySelectorAll("#booksTableBody tr");

        books.forEach(function(book) {
            const title = book.querySelector(".title").textContent.toLowerCase();
            const author = book.querySelector(".author").textContent.toLowerCase();
            const genre = book.querySelector(".genre").textContent.toLowerCase();

            if (title.includes(searchText) || author.includes(searchText) || genre.includes(searchText)) {
                book.style.display = "";
            } else {
                book.style.display = "none";
            }
        });
    }
});
