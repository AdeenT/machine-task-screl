import 'package:flutter/material.dart';
import 'package:screl_machine_task/view/open_user/open_user.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDark = false;
  bool isFilled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Users",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),
            SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
            const SizedBox(
              height: 30,
            ),
            ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text(
                    'first name',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    "last name",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Colors.blueAccent,
                  trailing: IconButton(
                    isSelected: isFilled,
                    onPressed: () {
                      setState(() {
                        isFilled = !isFilled;
                      });
                    },
                    icon: const Icon(Icons.star_border_outlined),
                    selectedIcon: const Icon(Icons.star),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const OpenUser();
                        },
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(thickness: 0),
              itemCount: 20,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
