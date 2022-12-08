import 'package:flutter/material.dart';
import 'package:studyapi/constellation_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(
                "https://kurasul.hello-storage.com/wp/wp-content/uploads/2021/12/4474738_1.jpg",
              ),
            ),
            Text(
              "StudyApi contellations",
              style: TextStyle(
                fontSize: 30,
                color: Colors.purple[600],
              ),
            ),
            ElevatedButton(
              child: Text('星座機能へ'),
              onPressed: () => {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ConstellationPage(),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
