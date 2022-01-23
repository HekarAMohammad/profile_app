import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'config.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _linktreeState createState() => _linktreeState();
}

// ignore: camel_case_types
class _linktreeState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 230, 229, 229),
          body: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(),
                      margin: const EdgeInsets.only(top: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(100), // Image radius
                          child: Image.asset('images/${user.imageLink}',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color.fromARGB(221, 33, 32, 32)),
                      width: 150,
                      height: 25,
                      child: Center(
                          child: Text(
                        user.job ?? "",
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        user.name ?? "No Name",
                        style: const TextStyle(
                            fontSize: 18, color: Color.fromARGB(255, 2, 2, 2)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        user.location ?? "",
                        style: const TextStyle(
                            fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    const SizedBox(
                      width: 320,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        "Bio",
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        user.bio ?? "",
                        style: const TextStyle(
                            fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 290,
                child: ListView.builder(
                    itemCount: user.socialMedia?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (user.socialMedia?[index] == null) {
                        return const Text("data");
                      }

                      SocialMedia s = user.socialMedia![index];
                      return Container(
                        height: 65,
                        margin:
                            const EdgeInsets.only(left: 15, right: 15, top: 12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 67, 67, 68),
                              onPrimary: const Color.fromARGB(135, 0, 0, 0)),
                          onPressed: () async {
                            String link = s.link ??
                                "https://www.linkedin.com/in/hekar-azwar-mohammed-salih-579a601a6/";
                            await _launchInBrowser(link);
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: 50,
                                height: 50,
                                child: Image.asset("images/${s.imageName}"),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Text(s.name ?? "",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(
                                            255, 219, 217, 217))),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: user.contacts?.length ?? 0,
                    itemBuilder: (c, i) {
                      if (user.contacts?[i] == null) {
                        return const Text("data");
                      }
                      Contacts contacts = user.contacts![i];
                      return Container(
                        margin: const EdgeInsets.all(5),
                        width: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              primary:
                                  const Color.fromARGB(255, 194, 193, 193)),
                          onPressed: () async {
                            if (user.contacts?[i].name == "phone") {
                              String alink = contacts.link ?? "+9947500000000";
                              await _makePhoneCall(alink);
                            } else {
                              String alink = contacts.link ??
                                  "https://www.linkedin.com/in/hekar-azwar-mohammed-salih-579a601a6/";
                              await _launchInBrowser(alink);
                            }
                          },
                          child: Image.asset('images/${contacts.imageName}'),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}
