import 'package:flutter/material.dart';

class SellerLanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
      ),
      body: Center(
        child: LanguageSelection(),
      ),
    );
  }
}

class LanguageSelection extends StatefulWidget {
  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  String? selectedLanguage;
  List<String> languages = ['English', 'Sinhala'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: 300,
      height: 250,
      color: Color.fromARGB(255, 239, 218, 201),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedLanguage != null) ...[
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                selectedLanguage!,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 16.0),
          ],
          SizedBox(height: 2.0),
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final language = languages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguage = language;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: selectedLanguage == language
                            ? Color.fromARGB(192, 175, 172, 172)
                            : Color.fromARGB(255, 245, 243,
                                243), // White for selected, red for not selected
                        border: Border.all(
                            color: Color.fromARGB(255, 236, 238, 240)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            selectedLanguage == language ? Icons.check : null,
                            color: Color.fromARGB(255, 8, 8, 8),
                          ),
                          SizedBox(width: 8.0),
                          Text(language),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
