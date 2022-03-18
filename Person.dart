class Person {
  final String name;
  final int age;

  const Person(this.name, this.age);

  @override
  String toString() {
    return 'Person name: $name, age: $age';
  }
}