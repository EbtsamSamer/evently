class TaskModel {
  String id;
  String userId;
  String title;
  String description;
  int date;
  String category;
  bool isFav;

  TaskModel({this.id = " ",required this.title,required this.description,required this.date,required this.category,this.isFav=false,required this.userId});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'isFav': isFav,
      'title': title,
      'description': description,
      'date': date,
      'category': category,
    };
  }

//named Constructor
  TaskModel.fromJson(Map<String, dynamic> json):this
    (
     id: json['id'],
     userId: json['userId']??" ",
      isFav: json['isFav'],
      title:json['title'],
      description:json['description'] ,
      date:json['date'] ,
      category:json['category'] ,
    );
  }
