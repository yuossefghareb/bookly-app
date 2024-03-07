import 'package:bookly_app/Features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/core/Uti/widgets/custom_button.dart';
import 'package:enhanced_url_launcher/enhanced_url_launcher.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.booksModel});

  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Free',
              textColor: Colors.black,
              backgroundcolor: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onpressed: () async {
                Uri _url = Uri.parse(booksModel.volumeInfo.previewLink!);
                if (!await launchUrl(_url)) {}
              },
              text: 'Free Preview',
              textColor: Colors.white,
              backgroundcolor: Color(0xffEF8262),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
