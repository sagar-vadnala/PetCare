// class Dog {
//   String? message;
//   String? status;

//   Dog({this.message, this.status});

//   Dog.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['status'] = this.status;
//     return data;
//   }
// }

class DogImage {
  final String imageUrl;

  DogImage({required this.imageUrl});

  factory DogImage.fromJson(Map<String, dynamic> json) {
    return DogImage(imageUrl: json['message']);
  }
}
