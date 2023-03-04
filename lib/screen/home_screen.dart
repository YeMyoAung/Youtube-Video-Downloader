import 'package:flutter/material.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final StateNotifier stateNotifier = StateNotifier([]);

  final TextEditingController controller = TextEditingController();

  DateTime get now => DateTime.now();

  Future<void> search() async {
    try {
      // log(await FlutterYoutubeDownloader.extractYoutubeLink(
      //     controller.text, 18));

      await FlutterYoutubeDownloader.downloadVideo(
        controller.text,
        "${now.day}${now.month}${now.year}${now.hour}${now.minute}${now.second}",
        null,
      );
      // print(downloadLink);
      // stateNotifier.value = [downloadLink];
    } catch (e) {
      ///
    }
  }

  @override
  void dispose() {
    // stateNotifier.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: FlutterLogo(),
        ),
        title: const Text("Flutter Youtube Downloader"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            const Text(
              "Download Video and Audio From Youtube",
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.primaryColor,
                  width: 4,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              height: 55,
              margin: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onEditingComplete: search,
                      decoration: const InputDecoration(
                        hintText: "Search or paste link here...",
                        isDense: true,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                      onPressed: search,
                      child: const Icon(Icons.arrow_right_alt),
                    ),
                  )
                ],
              ),
            ),
            Wrap(
              children: [
                const Text(
                  "By using our service you are accepting our",
                ),
                Text(
                  " Terms of use",
                  style: TextStyle(
                    color: theme.primaryColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
