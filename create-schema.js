db = connect('mongodb://user:password@localhost:27017/books?authSource=admin');
db.createCollection("bookshelf");