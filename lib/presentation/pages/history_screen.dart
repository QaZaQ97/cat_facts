import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box('facts');
    final values = box.toMap().values.toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.history),
        actions: [
          TextButton(
            onPressed: () => setState(() {
              box.isNotEmpty ?
              box.clear() : null;
            }),
            child: Text(AppLocalizations.of(context)!.clear),
          )
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          if (value is List<String>) {
            final list = List<String>.from(value);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Fact #${index + 1}:', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          list[index],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
