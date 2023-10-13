import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> userName = [
    "Muhammad Ali Jinnah",
    "Shahid Afridi",
    "Muhammad Aamir",
    "Shaheen Shah Afridi",
    "Naseem Shah",
    "Ahmed Shehzad",
    "Muhammad Siraj",
    "Rashid Khan",
    "Abdullah Shafique",
    "Hashim Amla",
    "Muhammad Rizwan"
  ];
  List<String> userTime = [
    "10:35 a.m",
    "1:02 p.m",
    "4:45 p.m",
    "1:01 a.m",
    "5:27 a.m",
    "8:25 p.m",
    "7:12 p.m",
    "1:05 a.m",
    "4:45 a.m",
    "8:56 p.m",
    "5:12 a.m"
  ];
  List<String> userMsg = [
    "How're you, brother?",
    "Aja raat me chaltey hai..",
    "kha pr hai tu.",
    "bht axh match hua ajj",
    "oK..",
    "Thc ha dekhta hn me.",
    "abhi kb kese",
    "Don't worry about it!",
    "Hahahah",
    "25 ko niltey hai",
    "axh kal huwa tha"
  ];
  List<String> userImage = [
    'assets/images/md_ali_jinnah.jpg',
    'assets/images/shahid_afridi.jpg',
    'assets/images/md_aamir.jpg',
    'assets/images/shaheen_afridi.jpg',
    'assets/images/naseem_shah.jpg',
    'assets/images/ahmed_shehzad.jpg',
    'assets/images/md_siraj.webp',
    'assets/images/rashid_khan.jpg',
    'assets/images/ab_shafique.webp',
    'assets/images/hashim_amla.jpg',
    'assets/images/md_rizwan.png'
  ];

  bool search = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: search
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: searchBarContainer(context),
                          )
                        : Text(
                            "Chat Here",
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (search) {
                        clearSearch();
                      } else {
                        search = true;
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(search ? Icons.clear : Icons.search),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  height: height * 1,
                  decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 5, right: 5, bottom: 5),
                    child: ListView.builder(
                      itemCount: userName.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(userName[index].toString()),
                          subtitle: Text(userMsg[index].toString()),
                          leading: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    backgroundColor: Colors.black,
                                    child: InteractiveViewer(
                                      child: Image.asset(
                                          userImage[index].toString()),
                                      minScale: 1,
                                      maxScale: 6,
                                    ),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage(userImage[index].toString()),
                            ),
                          ),
                          trailing: Text(userTime[index].toString()),
                        );
                      },
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void clearSearch() {
    search = false;
    setState(() {});
  }
}

searchBarContainer(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 2),
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextField(
        cursorColor: Colors.teal,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            hintText: 'Search..',
            border: OutlineInputBorder())),
  );
}
