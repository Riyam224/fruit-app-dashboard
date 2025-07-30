// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class ImageProduct extends StatefulWidget {
//   const ImageProduct({super.key, required this.onImagePicked});

//   final ValueChanged<File?> onImagePicked;

//   @override
//   State<ImageProduct> createState() => _ImageProductState();
// }

// class _ImageProductState extends State<ImageProduct> {
//   bool isLoading = false;
//   File? fileImage;

//   Future<void> pickImage() async {
//     setState(() => isLoading = true);

//     try {
//       final ImagePicker picker = ImagePicker();
//       final XFile? pickedFile = await picker.pickImage(
//         source: ImageSource.gallery,
//       );

//       if (pickedFile != null) {
//         fileImage = File(pickedFile.path);
//         widget.onImagePicked(fileImage);
//       }
//     } catch (e) {
//       debugPrint("Image pick error: $e");
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   void _clearImage() {
//     setState(() {
//       fileImage = null;
//       widget.onImagePicked(null); // notify parent
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       enabled: isLoading,
//       child: GestureDetector(
//         onTap: () => pickImage(),
//         child: Container(
//           height: 200,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: const Color(0xFFE6E9E9),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: fileImage != null
//               ? Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.file(
//                         fileImage!,
//                         width: double.infinity,
//                         height: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Positioned(
//                       top: 8,
//                       right: 8,
//                       child: IconButton(
//                         onPressed: _clearImage,
//                         icon: const Icon(
//                           Icons.close,
//                           color: Colors.white,
//                           size: 18,
//                         ),
//                         padding: const EdgeInsets.all(4),
//                         constraints: const BoxConstraints(),
//                         style: IconButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           shape: const CircleBorder(),
//                           shadowColor: Colors.black26,
//                           elevation: 4,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               : const Center(
//                   child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
//                 ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageProduct extends StatefulWidget {
  const ImageProduct({super.key, required this.onImagePicked});
  final ValueChanged<File?> onImagePicked;

  @override
  State<ImageProduct> createState() => _ImageProductState();
}

class _ImageProductState extends State<ImageProduct> {
  bool isLoading = false;
  File? fileImage;

  Future<void> pickImage() async {
    setState(() => isLoading = true);

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        final selectedImage = File(pickedFile.path);
        setState(() {
          fileImage = selectedImage;
        });
        widget.onImagePicked(selectedImage);
      }
    } catch (e) {
      debugPrint("Image pick error: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _clearImage() {
    setState(() {
      fileImage = null;
    });
    widget.onImagePicked(null); // notify parent
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: pickImage,
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE6E9E9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: fileImage != null
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        fileImage!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        onPressed: _clearImage,
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: const CircleBorder(),
                          shadowColor: Colors.black26,
                          elevation: 4,
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                ),
        ),
      ),
    );
  }
}
