import 'package:flutter/widgets.dart';
import 'package:h_reed/feature/auth/widget/container1.dart';

class Container2 extends StatelessWidget {
  const Container2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container1(child: Text('path')),
              Container1(child: Text('path')),
              Container1(child: Text('path')),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container1(child: Text('path')),
              Container1(child: Text('path')),
              Container1(child: Text('path')),
            ],
          ),
        ],
      ),
    );
  }
}
