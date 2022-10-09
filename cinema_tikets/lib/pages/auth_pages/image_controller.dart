import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  PickedFile? pickedOFile;
  PickedFile? get pickedFile => pickedOFile;
  final _picker = ImagePicker();
  //implementing the image picker
  Future<File> pickImage() async {
    // ignore: deprecated_member_use
    pickedOFile = await _picker.getImage(source: ImageSource.gallery);
    update();
    final file = File(pickedOFile!.path);
    return file;
  }
}

// class UploadImage extends ImageController {
//   Future uploadFile() async {
//     final path = 'files/${pickedFile!}';

//     final ref = FirebaseStorage.instance.ref().child(path);
//     ref.putFile(File(_pickedFile!.path));
//   }
// }

