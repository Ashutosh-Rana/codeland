import 'dart:io';

import 'package:codeland/design_comp/secondary_button.dart';
import 'package:codeland/utils/app_colors.dart';
import 'package:codeland/utils/text_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatefulWidget {
  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _uploadedImage; // Store the uploaded image file
  bool showUploadedImage = false; // Flag to control image visibility

  void uploadImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery, // Choose from gallery
    );
    if (pickedFile != null) {
      setState(() {
        _uploadedImage = File(pickedFile.path);
        showUploadedImage = false;
      });
    }
  }

  void viewImage() {
    if (_uploadedImage != null) {
      setState(() {
        showUploadedImage = true;
      });
    } else {
      print("No image uploaded yet.");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Upload a Image",
              style: AppTextStyles.poppinsStyle16Black,
            ),
            SizedBox(height: screenHeight * .03),
            DottedBorder(
              color: AppColors.darkGrey,
              borderType: BorderType.Rect,
              strokeWidth: 1, // Adjust stroke width (thickness)
              dashPattern: const [
                8,
                4
              ], // Customize dash pattern (space, dash length)
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.82,
                height: MediaQuery.of(context).size.height * 0.63,
                child: showUploadedImage
                    ? Image.file(
                        _uploadedImage!,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.contain,
                      ) // Show uploaded image
                    : Center(
                        child: Image(
                        image: const AssetImage('assets/images/Image.png'),
                        loadingBuilder: (context, child, loadingProgress) {
                          // print(loadingProgress);
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const CircularProgressIndicator(
                              color: AppColors.tertiaryColor);
                        },
                      )),
              ),
            ),
            SizedBox(height: screenHeight * .09),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SecondaryButton(
                  text: "Upload",
                  textColor: AppColors.white,
                  btnColor: AppColors.tertiaryColor,
                  onPressed: () {
                    uploadImage();
                  },
                ),
                SecondaryButton(
                  text: "View",
                  textColor: AppColors.black,
                  btnColor: AppColors.grey,
                  onPressed: () {
                    viewImage();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
