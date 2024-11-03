class Product {
  final String idProduct, title, image, price, stock, rating;
  final List<String>? size;
  final List<Review>? review;
  final String? description;

  Product({
    required this.idProduct,
    required this.title,
    required this.image,
    required this.price,
    required this.stock,
    required this.rating,
    this.review,
    this.size,
    this.description,
  });
}

class Review {
  final String username, comment, rating, date, image;

  Review(
      {required this.username,
      required this.comment,
      required this.rating,
      required this.date,
      required this.image});
}

List<Product> suggestionList = [
  Product(
      idProduct: '1',
      title: 'Sugerstion 1 andiansdnasindas iasndiansdnasd iasjdiasjdias ',
      image:
          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      price: '10.000',
      stock: '100',
      rating: '4.5',
      size: [
        'S',
        'M'
      ],
      review: [
        Review(
            username: 'User 1',
            comment: 'Comment 1',
            rating: '5.0',
            date: '2022-01-01',
            image: 'https://picsum.photos/id/10/200/300'),
        Review(
            username: 'User 2',
            comment: 'Comment 2',
            rating: '4.0',
            date: '2022-01-02',
            image: 'https://picsum.photos/id/10/200/300'),
      ]),
  Product(
    idProduct: '2',
    title: 'Sugerstion 2',
    image: 'https://picsum.photos/id/10/200/300',
    price: '20.000',
    stock: '200',
    rating: '4.0',
  ),
  Product(
    idProduct: '3',
    title: 'Sugerstion 3',
    image:
        'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    price: '30.000',
    stock: '300',
    rating: '3.5',
  ),
  Product(
    idProduct: '4',
    title: 'Sugerstion 4',
    image: 'https://picsum.photos/id/10/200/300',
    price: '40.000',
    stock: '400',
    rating: '3.0',
  ),
];

List<Product> productsList = [
  Product(
    idProduct: '1',
    title: 'Product 123456789abjsajdsadasdja jdjkandknaskd',
    image: 'https://picsum.photos/id/10/200/300',
    price: '10.000',
    stock: '100',
    rating: '4.5',
  ),
  Product(
    idProduct: '2',
    title: 'Product 2',
    image:
        'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    price: '20.000',
    stock: '200',
    rating: '4.0',
    description: 'Product 2 description',
  ),
  Product(
    idProduct: '3',
    title: 'Product 3',
    image: 'https://picsum.photos/id/10/200/300',
    price: '30.000',
    stock: '300',
    rating: '3.5',
  ),
  Product(
    idProduct: '4',
    title: 'Product 4',
    image: 'https://picsum.photos/id/10/200/300',
    price: '40.000',
    stock: '400',
    rating: '3.0',
    description: 'Product 4 description',
  ),
  Product(
      idProduct: '5',
      title: 'Product 5',
      image:
          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      price: '50.000',
      stock: '500',
      rating: '2.5',
      review: [
        Review(
            username: 'User 1',
            comment: 'Comment 1',
            rating: '5.0',
            date: '2022-01-01',
            image: 'https://picsum.photos/id/10/200/300'),
        Review(
            username: 'User 2',
            comment: 'Comment 2',
            rating: '4.0',
            date: '2022-01-02',
            image: 'https://picsum.photos/id/10/200/300'),
        Review(
            username: 'User 2',
            comment: 'Comment 2',
            rating: '4.0',
            date: '2022-01-02',
            image: 'https://picsum.photos/id/10/200/300'),
        Review(
            username: 'User 2',
            comment: 'Comment 2',
            rating: '4.0',
            date: '2022-01-02',
            image: 'https://picsum.photos/id/10/200/300'),
        Review(
            username: 'User 2',
            comment: 'Comment 2',
            rating: '4.0',
            date: '2022-01-02',
            image: 'https://picsum.photos/id/10/200/300'),
        Review(
            username: 'User 2',
            comment: 'Comment 2',
            rating: '4.0',
            date: '2022-01-02',
            image: 'https://picsum.photos/id/10/200/300'),
        Review(
            username: 'User 2',
            comment: 'Comment 2',
            rating: '4.0',
            date: '2022-01-02',
            image: 'https://picsum.photos/id/10/200/300'),
        Review(
            username: 'User 2',
            comment: 'Comment 2',
            rating: '4.0',
            date: '2022-01-02',
            image: 'https://picsum.photos/id/10/200/300'),
      ]),
];
