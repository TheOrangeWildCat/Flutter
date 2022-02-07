import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //* imagen central
          Image(image: AssetImage('assets/moon.jpg')),
          // titulo
          Title(),
// seccion de botones
          ButtonSection(),
//overview
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
                '合运肯历实断痛基经助忽热它！关蒙细济烟！界碃他雷艺久拿息足午。数开受助除感兰卖来。双学做卫言技印功艺全！外吗释看块续！旅未境杂眼哪联特往静！线头乡第臓呀部房待找警界！增气丈钱众范压够帝找领速顺难！机低笔局团姐！让娘拍决怀。进空短黑开布默爸渐才提所？乱信期知翻海何助非量青工用临弟管园？干然真吧杂兰。作鲜程士沙然钱派承孤半灯慢乱脚期神示秋！诉雷牌视妻练水退银！环北千板往计往物店父便悲装同活。章负怕上？'),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Luna Luna',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'lago lago',
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: 10,
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.amberAccent,
          ),
          Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            icon: Icons.call,
            text: 'Call',
          ),
          CustomButton(
            icon: Icons.near_me_rounded,
            text: 'Route',
          ),
          CustomButton(
            icon: Icons.share_rounded,
            text: 'Share',
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: 40,
          color: Colors.blue[300],
          onPressed: () {},
        ),
        Text(text, style: TextStyle(color: Colors.blue))
      ],
    );
  }
}
