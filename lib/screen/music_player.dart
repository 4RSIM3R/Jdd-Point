import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[200],
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.8,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blueAccent[200],
                        width: 2.0
                      )
                    ),
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://suaranahdliyin.com/wp-content/uploads/2019/05/Screenshot_2019-05-30-00-47-31-1024x576.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent[200]),
                    gradient: LinearGradient(colors: [
                      Colors.blue.withOpacity(0.1),
                      Colors.blueAccent[200]
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 42.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '#NgajiRutinan',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                              Text('KH Ahmad Bahauddin Nursalim',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Spacer(),
                      Text("Tanda Hawa Nafsu",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "Kitab Al-Hikam",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 18.0),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Slider(
            onChanged: (double value) {},
            value: 2.0,
            max: 10.0,
            inactiveColor: Colors.blueAccent[400],
            activeColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '2:00',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                Text('10:00',
                    style: TextStyle(color: Colors.white.withOpacity(0.7)))
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.fast_rewind,
                color: Colors.white54,
                size: 42.0,
              ),
              SizedBox(width: 32.0),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.play_arrow,
                      size: 58.0,
                      color: Colors.blueAccent[200],
                    ),
                  )),
              SizedBox(width: 32.0),
              Icon(
                Icons.fast_forward,
                color: Colors.white54,
                size: 42.0,
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
              Icon(
                Icons.shuffle,
                color: Colors.white,
              ),
              Icon(
                Icons.repeat,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 58.0),
        ],
      ),
    );
  }
}