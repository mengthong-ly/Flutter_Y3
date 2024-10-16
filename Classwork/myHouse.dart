enum Color {
  Red("Red"),
  Green("Green"),
  blue("Blue"),
  transparent('Transparent');

  final String colorName;

  const Color(this.colorName);

  String toString() {
    return this.colorName;
  }
}

enum ChimneyType {
  clay('Clay'),
  brick('Brick'),
  concrete('Concrete'),
  sandLime('SandLime'),
  engineering('Engineering'),
  flyAsh('FlyAsh');

  const ChimneyType(this.chimneyType);

  final String chimneyType;

  String toString() {
    return this.chimneyType;
  }
}

enum WallType {
  clay('Clay'),
  brick('Brick'),
  concrete('Concrete'),
  sandLime('SandLime'),
  engineering('Engineering'),
  flyAsh('FlyAsh');

  const WallType(this.brickTypeName);

  final String brickTypeName;

  String toString() {
    return this.brickTypeName;
  }
}

enum DoorType {
  wooden('Wooden'),
  glass('Glass'),
  steel('Steel'),
  aluminum('Aluminum'),
  pvc('PVC'),
  fiberglass('Fiberglass'),
  flush('Flush'),
  french('French'),
  sliding('Sliding'),
  biFold('Bi-Fold');

  const DoorType(this.doorTypeName);

  final String doorTypeName;

  @override
  String toString() {
    return this.doorTypeName;
  }
}

enum RoofShape {
  Rectangle('Rectangle'),
  Triangle('Triangle'),
  DoubleTriangle('DoubleTriangle'),
  Pentagon('Pentagon');

  const RoofShape(this.shapeName);

  final String shapeName;
  String toString() {
    return this.shapeName;
  }
}

class Window {
  final double height;
  final Color color;
  final String meterail;
  final double panel;

  Window(
      {required this.height,
      this.color = Color.transparent,
      required this.meterail,
      required this.panel});
}

class Door {
  final Color color;
  final DoorType meterail;
  final double height;

  Door(
      {this.color = Color.transparent,
      required this.meterail,
      required this.height});
}

class Roof {
  final Color color;
  final String meterail;
  final RoofShape roofShape;

  Roof({
    this.color = Color.transparent,
    required this.meterail,
    this.roofShape = RoofShape.Rectangle,
  });
}

class Chimney {
  final double height;
  final Color color;
  final ChimneyType chimneyType;

  Chimney({
    required this.height,
    this.color = Color.Red,
    this.chimneyType = ChimneyType.brick,
  });
}

class Wall {
  final Color color;
  final WallType wallType;
  Wall({this.color = Color.Red, this.wallType = WallType.brick});
}

enum Country {
  Cambdoia("Cambdoia"),
  Veitnam("Veitnam"),
  Thai("Thai"),
  KingdomOfWater('KingdomOfWater');

  final String countryName;

  const Country(this.countryName);

  String toString() {
    return this.countryName;
  }
}

enum City {
  PhnomPenh("Phnom Penh"),
  Hanoy("Hanoy"),
  VeangChan("VeangChan"),
  BKK('BKK');

  final String CityName;

  const City(this.CityName);

  String toString() {
    return this.CityName;
  }
}

class Address {
  final String street;
  final City city;
  final Country country;

  Address(
      {required this.street,
      this.city = City.PhnomPenh,
      this.country = Country.Cambdoia});
}

class myHouse {
  final Address address;
  final List<Window> windows = [];
  final Roof? roof;
  final Wall wall;
  final List<Door> doors = [];
  final List<Chimney> chimneys = [];

  void addWindow(Window newWindow) {
    windows.add(newWindow);
  }

  void addChimney(Chimney newChimney) {
    chimneys.add(newChimney);
  }

  void addDoor(Door newDoor) {
    doors.add(newDoor);
  }

  myHouse({required this.wall, required this.address, this.roof});

  @override
  String toString() {
    // return ;
    StringBuffer mengthongBufferHouseInDetail = StringBuffer();
    mengthongBufferHouseInDetail.writeln(
        "\n--My address is at Street: ${address.street}, City: ${address.city}, Country: ${address.country}\n");
    mengthongBufferHouseInDetail.writeln(
        "--My wall made of ${wall.wallType.brickTypeName}, Color of ${Color.Green} \n");

    roof == null
        ? mengthongBufferHouseInDetail.writeln("--This house has no roof.\n")
        : mengthongBufferHouseInDetail.writeln("--This house has no roof.\n");

    chimneys.isEmpty
        ? mengthongBufferHouseInDetail.writeln("This house has no chimneys.\n")
        : {
            mengthongBufferHouseInDetail
                .writeln("--This house has ${chimneys.length} chimney\n"),
            chimneys.forEach((element) {
              mengthongBufferHouseInDetail.writeln(
                  "Chimney ${element.height}, Meterial: ${element.chimneyType} \n");
            })
          };

    doors.isEmpty
        ? mengthongBufferHouseInDetail.writeln("This house has no Door.\n")
        : {
            mengthongBufferHouseInDetail
                .writeln("--This house has ${doors.length} Doors\n"),
            doors.forEach((element) {
              mengthongBufferHouseInDetail.writeln(
                  "doors ${element.height}, Meterial: ${element.meterail} \n");
            })
          };
    windows.isEmpty
        ? mengthongBufferHouseInDetail.writeln("This house has no Door.\n")
        : {
            mengthongBufferHouseInDetail
                .writeln("--This house has ${windows.length} windows\n"),
            windows.forEach((element) {
              mengthongBufferHouseInDetail.writeln(
                  "windows ${element.height}, Meterial: ${element.meterail} \n");
            })
          };

    return mengthongBufferHouseInDetail.toString();
  }
}

void main() {
  final house = myHouse(
      wall: Wall(wallType: WallType.clay),
      address: Address(street: '230st'),
      roof: Roof(meterail: 'Tile', color: Color.blue));

  house.addChimney(Chimney(height: 200));
  house.addDoor(Door(meterail: DoorType.aluminum, height: 100));
  house.addWindow(Window(height: 30, meterail: 'Glass', panel: 4));

  print(house);
}
