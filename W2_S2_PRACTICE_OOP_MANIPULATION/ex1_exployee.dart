enum Skills {
  coding('coding'),
  singing('singing'),
  typing('typing'),
  sleeping('sleeping'),
  eating('eating'),
  flutter('flutter'),
  dart('dart'),
  cplusplus('C++'),
  java('Java'),
  javascript('JavaScript');

  final String skillName;

  const Skills(this.skillName);
  // noted that this place we override the original method
  @override
  String toString() {
    return switch (this) {
      Skills.coding => this.skillName,
      Skills.singing => this.skillName,
      Skills.typing => this.skillName,
      Skills.sleeping => this.skillName,
      Skills.eating => this.skillName,
      Skills.flutter => this.skillName,
      Skills.dart => this.skillName,
      Skills.cplusplus => this.skillName,
      Skills.java => this.skillName,
      Skills.javascript => this.skillName,
    };
  }
}

class Address {
  final String street;
  final String city;
  final int zipCode;

  Address({required this.city, required this.street, required this.zipCode});
}

class Employee {
  final String _name;
  static const double _basesalary = 80000;
  final List<Skills> _skill;
  final int _yearOfExperience;

  Employee({
    required String name,
    required int yearOfExperience,
  })  : this._skill = [],
        this._name = name,
        this._yearOfExperience = yearOfExperience;

  Employee.Flutter({
    required String name,
    required int yearOfExperience,
  })  : this._skill = [Skills.flutter],
        this._name = name,
        this._yearOfExperience = yearOfExperience;
  Employee.Dart({
    required String name,
    required int yearOfExperience,
  })  : this._skill = [Skills.dart],
        this._name = name,
        this._yearOfExperience = yearOfExperience;

  void addSkill(Skills skill) {
    this._skill.add(skill);
  }

  String get name => _name;
  double get salary => _BaseSalaryComputation();
  List<Skills> get skill => _skill;
  int get yearOfExperience => _yearOfExperience;

  double _BaseSalaryComputation() {
    double bonusSum = 0;
    const flutterSalary = 7000;
    const dartSalary = 5000;
    const defultSalary = 100;
    // each skill
    for (var i = 0; i < this._skill.length; i++) {
      switch (this._skill[i]) {
        case Skills.flutter:
          bonusSum += flutterSalary;
          break;
        case Skills.dart:
          bonusSum += dartSalary;
          break;
        default:
          bonusSum += defultSalary;
          break;
      }
    }
    bonusSum += 2000 * _yearOfExperience;
    // // each year
    // for (var i = 0; i < this._yearOfExperience; i++) {
    //   bonusSum += 2000;
    // }

    return bonusSum + _basesalary;
  }
}

void main() {
// em
  Employee employee = Employee(name: 'John Doe', yearOfExperience: 5);
  employee.addSkill(Skills.singing);
  employee.addSkill(Skills.singing);
  employee.addSkill(Skills.singing);
  employee.addSkill(Skills.singing);
  employee.addSkill(Skills.singing);
  employee.addSkill(Skills.singing);
  print('--------------------------------');
  print('Employee name: ${employee.name}');
  print('Employee salary: ${employee.salary.toStringAsFixed(2)}');
  print(
      'Employee Skills: ${employee.skill.map((skill) => skill.toString()).join(', ')}');
  print('Employee years of experience: ${employee.yearOfExperience}');

// em1
  Employee employee1 = Employee.Flutter(name: 'John Doe', yearOfExperience: 10);
  print('-------------------------------');
  print('Employee1 name: ${employee1.name}');
  print('Employee1 salary: ${employee1.salary.toStringAsFixed(2)}');
  print(
      // 'Employee1 Skills: ${employee1.skill.map((e) => e.toString()).join(', ')}');
      'Employee1 Skills: ${employee.skill.map((e) => e.toString()).join(', ')}');
  print('Employee1 years of experience: ${employee1.yearOfExperience}');

  // em 2
  Employee employee2 = Employee.Dart(name: 'John Doe', yearOfExperience: 5);
  print('-------------------------------');
  print('Employee2 name: ${employee2.name}');
  print('Employee2 salary: ${employee2.salary.toStringAsFixed(2)}');
  print(
      'Employee2 Skills: ${employee2.skill.map((skill) => skill.toString()).join(', ')}');
  print('Employee2 years of experience: ${employee2.yearOfExperience}');
  print('--------------------------------');
  print(Skills.coding);
}
