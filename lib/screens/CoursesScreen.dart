import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seo/constants.dart';

void main() => runApp(MaterialApp(home: CoursesScreen()));

class Course {
  final String title, tutor, duration, about;
  final ImageProvider poster;

  Course({
    required this.title,
    required this.tutor,
    required this.duration,
    required this.about,
    required this.poster,
  });
}

// ──────────────────────────────
// 1. Main Courses Screen
// ──────────────────────────────

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  int _selectedIndex = 1;

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

  final List<Course> _courses = [];

  void _openAddCourse() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddCourseScreen(onCourseAdded: (c) {
          setState(() => _courses.add(c));
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Courses'), centerTitle: true),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue[700],
            padding: EdgeInsets.all(12),
            child: Text('My Courses',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Expanded(
            child: _courses.isEmpty
                ? Center(child: Text('No courses yet. Tap + to add one.'))
                : ListView.builder(
                    itemCount: _courses.length,
                    itemBuilder: (context, index) {
                      final c = _courses[index];
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          leading: Image(image: c.poster, width: 60, height: 60,
                              fit: BoxFit.cover),
                          title: Text(c.title),
                          subtitle: Text('${c.tutor} · ${c.duration}',
                              maxLines: 1),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CourseDetailScreen(course: c),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _openAddCourse,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryBlue,
        unselectedItemColor: textGrey,
        selectedLabelStyle: TextStyle(color: primaryBlue),
        onTap: (value) => _onItemTapped(value),
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(Icons.book,),
            label: 'My Courses',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.briefcase),
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

// ──────────────────────────────
// 2. Add Course Screen
// ──────────────────────────────

class AddCourseScreen extends StatefulWidget {
  final Function(Course) onCourseAdded;

  AddCourseScreen({required this.onCourseAdded});

  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _tutorCtrl = TextEditingController();
  final _durationCtrl = TextEditingController();
  final _aboutCtrl = TextEditingController();
  final _posterUrlCtrl = TextEditingController();

  void _saveCourse() {
    if (_formKey.currentState?.validate() != false) {
      widget.onCourseAdded(
        Course(
          title: _titleCtrl.text,
          tutor: _tutorCtrl.text,
          duration: _durationCtrl.text,
          about: _aboutCtrl.text,
          poster: _posterUrlCtrl.text.isNotEmpty
              ? NetworkImage(_posterUrlCtrl.text)
              : AssetImage(
                  'https://via.placeholder.com/150'), // placeholder
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Course'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _posterUrlCtrl,
                decoration: InputDecoration(labelText: 'Poster Image URL'),
                keyboardType: TextInputType.url,
                validator: (v) {
                  if (v != null && v.isNotEmpty) {
                    final uri = Uri.tryParse(v);
                    if (uri == null ||
                        !(uri.hasScheme &&
                            (uri.scheme == 'http' || uri.scheme == 'https')))
                      return 'Enter valid URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _titleCtrl,
                decoration: InputDecoration(labelText: 'Course Name'),
                validator: (v) => (v?.isEmpty ?? true) ? 'Required' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _tutorCtrl,
                decoration: InputDecoration(labelText: 'Tutor Name'),
                validator: (v) => (v?.isEmpty ?? true) ? 'Required' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _durationCtrl,
                decoration: InputDecoration(labelText: 'Duration'),
                validator: (v) => (v?.isEmpty ?? true) ? 'Required' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _aboutCtrl,
                decoration: InputDecoration(labelText: 'About Course'),
                maxLines: 3,
                validator: (v) => (v?.isEmpty ?? true) ? 'Required' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(onPressed: _saveCourse, child: Text('Save Course')),
            ],
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────
// 3. Course Detail Screen
// ──────────────────────────────

class CourseDetailScreen extends StatelessWidget {
  final Course course;
  CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title), centerTitle: true),
      body: ListView(
        children: [
          Image(image: course.poster, width: double.infinity, height: 180,
              fit: BoxFit.cover),
          SizedBox(height: 12),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Course Lectures'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Course Assignments'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.quiz),
            title: Text('Course Quizzes'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ElevatedButton.icon(
              icon: Icon(Icons.school),
              label: Text('View Certificate'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

