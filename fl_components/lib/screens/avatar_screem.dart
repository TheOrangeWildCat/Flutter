import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Angel Acuña'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                child: const Text('AA'),
                backgroundColor: Colors.orange[900],
              ),
            )
          ],
        ),
        body: const Center(
            child: CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage(
              'https://www.nj.com/resizer/mg42jsVYwvbHKUUFQzpw6gyKmBg=/1280x0/smart/advancelocal-adapter-image-uploads.s3.amazonaws.com/image.nj.com/home/njo-media/width2048/img/somerset_impact/photo/sm0212petjpg-7a377c1c93f64d37.jpg'),
        )));
  }
}
