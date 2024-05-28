import 'package:flutter/material.dart';
import 'member_detail_screen.dart';
import 'add_member_screen.dart';

class Member {
  final String name;
  final String email;
  final String phone;
  final String image;

  Member({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });
}

class MemberListScreen extends StatefulWidget {
  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  final List<Member> members = [
    Member(
      name: 'mehdi',
      email: 'mehdi@gmail.com',
      phone: '06-66-66-66-66',
      image: 'assets/images/member1.png',
    ),
    Member(
      name: 'Hiba',
      email: 'hibatallahachir@gmail.com',
      phone: '06-66-66-66-66',
      image: 'assets/images/member2.png',
    ),
    // Add more members here
  ];

  void _addMember(Member member) {
    setState(() {
      members.add(member);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Adhérents'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddMemberScreen(addMember: _addMember),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Image.asset(
                member.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(member.name),
              subtitle: Text(member.email),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberDetailScreen(
                      name: member.name,
                      email: member.email,
                      phone: member.phone,
                      image: member.image,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
