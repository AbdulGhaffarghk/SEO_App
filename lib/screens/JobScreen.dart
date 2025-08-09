import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seo/constants.dart';

class Jobscreen extends StatefulWidget {

  const Jobscreen({super.key});

  @override
  State<Jobscreen> createState() => _JobscreenState();
}

class _JobscreenState extends State<Jobscreen> {

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'BPS 5 to 15 Jobs Material',
      'files': ['Math Notes.pdf', 'English Paper.docx']
    },
    {
      'title': 'BPS 16 Jobs Material',
      'files': ['GK_MCQ.docx']
    }
  ];

  void _addCategory() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Category'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Category name"),
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text("Add"),
            onPressed: () {
              setState(() {
                categories.add({'title': controller.text, 'files': []});
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _showFileOptions(String fileName, int categoryIndex) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.upload_file),
            title: Text("Upload"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Update"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete"),
            onTap: () {
              setState(() {
                categories[categoryIndex]['files'].remove(fileName);
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.download),
            title: Text("Download"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.drive_file_rename_outline),
            title: Text("Rename"),
            onTap: () {
              Navigator.pop(context);
              _renameFile(fileName, categoryIndex);
            },
          ),
        ],
      ),
    );
  }

  void _renameFile(String oldName, int categoryIndex) {
    TextEditingController renameController =
        TextEditingController(text: oldName);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Rename File"),
        content: TextField(controller: renameController),
        actions: [
          TextButton(
              child: Text("Cancel"), onPressed: () => Navigator.pop(context)),
          ElevatedButton(
            child: Text("Rename"),
            onPressed: () {
              setState(() {
                final files = categories[categoryIndex]['files'];
                final index = files.indexOf(oldName);
                if (index != -1) files[index] = renameController.text;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _uploadFile(int categoryIndex) {
    TextEditingController fileController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Upload File"),
        content: TextField(
          controller: fileController,
          decoration: InputDecoration(hintText: "Enter file name"),
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text("Upload"),
            onPressed: () {
              setState(() {
                categories[categoryIndex]['files'].add(fileController.text);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    
    setState(() {
      _selectedIndex = index;
    });
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/courses');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/jobs');
      } else if (index == 3) {
        Navigator.pushNamed(context, '/profile');
      }
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
        centerTitle: true,
        
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: "Add Category",
            onPressed: _addCategory,
          )
        ],
      ),
      body:Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "Categories ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 1.5),
            ...categories.asMap().entries.map((entry) {
              int index = entry.key;
              var category = entry.value;
              return ExpansionTile(
                title: Text(category['title']),
                children: [
                  ...category['files'].map<Widget>((file) {
                    return ListTile(
                      title: Text(file),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () => _showFileOptions(file, index),
                      ),
                    );
                  }).toList(),
                  TextButton.icon(
                    onPressed: () => _uploadFile(index),
                    icon: Icon(Icons.upload_file),
                    label: Text("Upload File"),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryBlue,
        unselectedItemColor: textGrey,
        onTap: (value) => _onItemTapped(value),
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(Icons.home_outlined,),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(Icons.book_outlined),
            label: 'My Courses',
          ),
          const BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: FaIcon(FontAwesomeIcons.briefcaseClock),
            label: 'Jobs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}