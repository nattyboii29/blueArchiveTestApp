import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> playerInfo = [
    {'label': 'Username', 'value': 'NatNat29'},
    {'label': 'UID', 'value': '8746398'},
    {'label': 'Level', 'value': '90/90'},
    {'label': 'Club', 'value': 'CLUBNAMEXD'},
    {'label': 'Current Friends', 'value': '23/50'},
    {'label': 'Friend Code', 'value': 'AYYUBFAY'},
  ];

  final List<Map<String, dynamic>> missions = [
    {'label': 'Normal', 'value': '27-5'},
    {'label': 'Hard', 'value': '25-1'},
  ];

  final List<Map<String, dynamic>> rank = [
    {'label': 'Previous Total Assault', 'value': 'Rank 45657'},
    {'label': 'Previous Grand Assault', 'value': 'Rank -'},
    {'label': 'Tactical Challenge', 'value': 'Rank 675'},
  ];
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buildAnimatedCard(Map<String, dynamic> stat, int index) {
    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(index * 0.05, 1.0, curve: Curves.easeOut),
      ),
    );
    final slideAnimation = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(index * 0.05, 1.0, curve: Curves.easeOut),
      ),
    );
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: animation,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ListTile(
            title: Text(stat['label']),
            trailing: Text(
              stat['value'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Top section: Image, Name and Description
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/sensei.jpg'),
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nathaniel Rolando Castellano',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'S.C.H.A.L.E.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Middle section: Scrollable list of stats
            Expanded(
              child: ListView(
                children: [
                  // Player Info Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Player Info',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Info stats
                  ...playerInfo.asMap().entries.map((entry) {
                    int index = entry.key;
                    var stat = entry.value;
                    return buildAnimatedCard(stat, index);
                  }),
                  // Missions Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Missions',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Mission stats
                  ...missions.asMap().entries.map((entry) {
                    int index = entry.key + playerInfo.length;
                    var stat = entry.value;
                    return buildAnimatedCard(stat, index);
                  }),
                  // Rank Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Rank',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Rank stats
                  ...rank.asMap().entries.map((entry) {
                    int index = entry.key + playerInfo.length + missions.length;
                    var stat = entry.value;
                    return buildAnimatedCard(stat, index);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}