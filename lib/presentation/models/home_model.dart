enum DataStatus { complete, unknown, danger }

class HomeModel {
  final String name;
  final String packagePath;
  final int virus;
  final int total;
  final String imagePath;
  final DataStatus status;

  HomeModel({
    required this.name,
    required this.packagePath,
    required this.virus,
    required this.total,
    required this.imagePath,
    required this.status,
  });
}

List<HomeModel> homeData = data
    .map(
      (e) => HomeModel(
        name: e["name"].toString(),
        packagePath: e["package"].toString(),
        virus: int.parse(e["virus"].toString()),
        total: int.parse(e["total"].toString()),
        imagePath: e["image"].toString(),
        status: e["status"] as DataStatus,
      ),
    )
    .toList();

var data = [
  {
    "name": "Duolingo",
    "package": "com.duolingo",
    "virus": 1,
    "total": 69,
    "image": "images/green.png",
    "status": DataStatus.complete
  },
  {
    "name": "Netflix",
    "package": "com.netflix.mediaclient",
    "virus": 1,
    "total": 71,
    "image": "images/netfliz.png",
    "status": DataStatus.complete
  },
  {
    "name": "Facebook",
    "package": "com.facebook.katana",
    "virus": 8,
    "total": 69,
    "image": "images/fbicon.png",
    "status": DataStatus.unknown
  },
  {
    "name": "GTA V Mobile",
    "package": "com.defonot.virus",
    "virus": 42,
    "total": 50,
    "image": "images/gta5.png",
    "status": DataStatus.danger
  },
  {
    "name": "Gmail",
    "package": "com.google.android.gm",
    "virus": 0,
    "total": 73,
    "image": "images/g-mail.png",
    "status": DataStatus.complete
  },
  {
    "name": "Drive",
    "package": "com.google.android.docs",
    "virus": 0,
    "total": 74,
    "image": "images/g-drive.png",
    "status": DataStatus.complete
  },
  {
    "name": "Calendar",
    "package": "com.google.calendar",
    "virus": 0,
    "total": 71,
    "image": "images/g-calendar.png",
    "status": DataStatus.complete
  },
  {
    "name": "Meet",
    "package": "com.google.meet",
    "virus": 0,
    "total": 50,
    "image": "images/g-meet.png",
    "status": DataStatus.complete
  },
];
