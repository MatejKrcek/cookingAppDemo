import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cooking_app/provider/time_provider.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({Key? key}) : super(key: key);

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TimeProvider>(context, listen: false).startTimer(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instructions"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "BBQ Burger",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const Spacer(),
                  Text(
                    "${provider.currentTime} s",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/burger.jpeg",
              fit: BoxFit.cover,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(
                        '${index + 1}. Step',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      subtitle: Text(
                        'Lorem Ipsum is simply dummy text.',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
