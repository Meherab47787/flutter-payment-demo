class Dog {
  final int? id;
  final String name;
  final int age;

  Dog({
    this.id,
    required this.name,
    required this.age,
  });

  // Convert Dog to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Create Dog from Map
  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      id: map['id'] as int?,
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  // Optional: Override toString for easier debugging
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}