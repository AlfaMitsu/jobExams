class Person {
  final String name;
  final String email;
  final String imageUrl;

  Person({required this.name, required this.email, required this.imageUrl});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: '${json['firstname']} ${json['lastname']}',
      email: json['email'],
      imageUrl: json['image'] ?? 'https://via.placeholder.com/150', // Default image URL
    );
  }
}
