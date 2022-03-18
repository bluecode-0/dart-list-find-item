import "files/Person.dart";

void main() {
  final people = [
    Person('John', 40),
    Person('George', 42),
    Person('Paul', 40),
    Person('Dan', 44),
    Person('Chris', 17)
  ];

  final personName = 'Chris';

  findPersonUsingLoop(people, personName);
  print('-----------------------------------');
  findPersonUsingFirstWhere(people, personName);
  print('-------------------------------');
  findPersonUsingIndexWhere(people, personName);
  print('---------------------------------');
  findPersonUsingSingleWhere(people, personName);
  print('---------------------------');
  findPersonUsingWhere(people, personName);
  print('-----------------------------');
  findPersonUsingRetainWhere(people, personName);
}

/// Find a person in the list using loop.
void findPersonUsingLoop(List<Person> people,
    String personName) {
  for (var i = 0; i < people.length; i++) {
    if (people[i].name == personName) {
      print('Using loop: ${people[i]}');

      // Found the person, stop the loop
      return;
    }
  }
}

/// Find a person in the list using firstWhere method.
void findPersonUsingFirstWhere(List<Person> people,
    String personName) {
  // Note (from document):
  // 1. Returns the first element that satisfies
  //    the given predicate test. Iterates through
  //    elements and returns the first to satisfy test.
  // 2. If no element satisfies test, the result of
  //    invoking the orElse function is returned.
  //    If orElse is omitted, it defaults to throwing a StateError.
  final person =
      people.firstWhere((element) =>
          element.name == personName,
         );

  print('Using firstWhere: $person');
}

/// Find a person in the list using indexWhere method.
void findPersonUsingIndexWhere(List<Person> people,
    String personName) {
  // Find the index of person. If not found, index = -1
  final index = people.indexWhere((element) =>
        element.name == personName);
  if (index >= 0) {
    print('Using indexWhere: ${people[index]}');
  }
}

/// Find a person in the list using [singleWhere] method.
void findPersonUsingSingleWhere(List<Person> people,
    String personName) {
  // Note (from document):
  // 1. If exactly one element satisfies test,
  //    that element is returned.
  // 2. If more than one matching element is found,
  //    throws StateError.
  // 3. If no matching element is found,
  //    returns the result of orElse. If orElse is omitted,
  //    it defaults to throwing a StateError.
  final person = people.singleWhere((element) =>
        element.name == personName);

  print('Using singleWhere: $person');
}

void findPersonUsingWhere(List<Person> people,
    String personName) {
  // Return list of people matching the condition
  final foundPeople = people.where((element) =>
        element.name == personName);

  if (foundPeople.isNotEmpty) {
    print('Using where: ${foundPeople.first}');
  }
}

/// Find a person in the list using retainWhere method.
/// We probably don't use [retainWhere] method to find
/// element in real, because this method will modify
/// original list (remove all others elements which
/// do not match the condition). [retainWhere] method keeps
/// all elements match the condition. Therefore, the result
/// could contain more than one element.
void findPersonUsingRetainWhere(List<Person> people,
    String personName) {
    people.retainWhere((element) =>
        element.name == personName);
    if (people.isNotEmpty) {
      print('Using retainWhere: ${people[0]}');
    }
}

