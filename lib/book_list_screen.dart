import 'package:flutter/material.dart';
import 'book_detail_screen.dart';
import 'add_book_screen.dart';

class Book {
  final String title;
  final String author;
  final String image;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });
}

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final List<Book> books = [
    Book(
      title: 'THE ROMAN EMPIRE',
      author: 'Peter Garnsey',
      image: 'assets/images/book1_cover.png',
      description: 'A comprehensive look into the rise and fall of the Roman Empire, exploring its cultural, political, and military history.',
    ),
    Book(
      title: 'ALIENOR D AQUITAINE',
      author: 'Elizabeth Chadwick',
      image: 'assets/images/book2_cover.png',
      description: 'The fascinating life of Alienor d\'Aquitaine, queen consort of France and England.',
    ),
    Book(
      title: 'THE COLD STORM',
      author: 'John Etterlee',
      image: 'assets/images/book3_cover.png',
      description: 'A gripping thriller set in the coldest of storms.',
    ),
    Book(
      title: 'THE BOX IN THE WOODS',
      author: 'Johnson Mauren',
      image: 'assets/images/book4_cover.png',
      description: 'A mystery novel that uncovers the secrets hidden in the woods.',
    ),
  ];

  void _addBook(Book book) {
    setState(() {
      books.add(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Livres'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookScreen(addBook: _addBook),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Image.network(
                book.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailScreen(
                      title: book.title,
                      author: book.author,
                      description: book.description,
                      image: book.image,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
