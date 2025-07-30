// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class ImageProduct extends StatefulWidget {
//   const ImageProduct({super.key, required this.onImagePicked});
//   // todo move image to form widget in another screen
//   final ValueChanged<File?> onImagePicked;
//   @override
//   State<ImageProduct> createState() => _ImageProductState();
// }

// // todo pick image and save it to file

// class _ImageProductState extends State<ImageProduct> {
//   // todo
//   bool isLoading = false;
//   File? fileImage;

//   // todo clear image form
//   Future<void> pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? pickedFile = await picker.pickImage(
//       source: ImageSource.gallery,
//     );
//     fileImage = File(pickedFile!.path);
//     // todo send image to file after picked
//     widget.onImagePicked(fileImage!);
//   }

//   void _clearImage() {
//     setState(() => fileImage = null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       // todo
//       enabled: isLoading,
//       child: GestureDetector(
//         // todo
//         onTap: () async {
//           isLoading = true;
//           setState(() {});
//           try {
//             await pickImage();
//           } catch (e) {
//             isLoading = false;
//             setState(() {});
//           }
//         },
//         child: Container(
//           height: 200,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: const Color(0xFFE6E9E9),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: fileImage != null
//               // todo
//               ? Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: fileImage != null
//                           ? ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.file(fileImage!),
//                             )
//                           : Icon(Icons.public_outlined, size: 120),
//                     ),

//                     // Positioned(
//                     //   top: 8,
//                     //   right: 8,
//                     //   child: GestureDetector(
//                     //     onTap: _clearImage,
//                     //     child: Container(
//                     //       decoration: BoxDecoration(
//                     //         color: Colors.redAccent, // More visible than black
//                     //         shape: BoxShape.circle,
//                     //         boxShadow: [
//                     //           BoxShadow(
//                     //             color: Colors.black26,
//                     //             blurRadius: 4,
//                     //             offset: Offset(0, 2),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //       padding: const EdgeInsets.all(6),
//                     //       child: const Icon(
//                     //         Icons.close,
//                     //         color: Colors.white,
//                     //         size: 18,
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                     Positioned(
//                       top: 8,
//                       right: 8,
//                       child: IconButton(
//                         onPressed: () {
//                           // todo
//                           _clearImage();
//                           widget.onImagePicked(fileImage!);
//                         },
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
        fileImage = File(pickedFile.path);
        widget.onImagePicked(fileImage);
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
      widget.onImagePicked(null); // notify parent
    });
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () => pickImage(),
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
