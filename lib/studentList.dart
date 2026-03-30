import 'package:flutter/material.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: StudentList(),
    );
  }
}

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  final List<Map<String, String>> millenniumScienceSchool = [    
    {'name': 'Hayase Yuuka', 'year': '2', 'rarity': '2★', 'role': 'Tank', 'Damage Type': 'Explosive', 'Armor Type': 'Heavy'},
    {'name': 'Ushio Noa', 'year': '2', 'rarity': '3★', 'role': 'Support', 'Damage Type': 'Mystic', 'Armor Type': 'Special'},
    {'name': 'Tsukatsuki Rio', 'year': '3', 'rarity': '3★', 'role': 'Support', 'Damage Type': 'Mystic', 'Armor Type': 'Elastic'},
    {'name': 'Kurosaki Koyuki', 'year': '1', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Mystic', 'Armor Type': 'Heavy'},
    {'name': 'Mikamo Neru', 'year': '3', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Light'},
    {'name': 'Ichinose Asuna', 'year': '2', 'rarity': '1★', 'role': 'Dealer', 'Damage Type': 'Mystic', 'Armor Type': 'Light'},
    {'name': 'Kakudate Karin', 'year': '2', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Heavy'},
    {'name': 'Murokasa Akane', 'year': '2', 'rarity': '2★', 'role': 'Support', 'Damage Type': 'Piercing', 'Armor Type': 'Light'},
    {'name': 'Asuma Toki', 'year': '1', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Explosive', 'Armor Type': 'Elastic'},
    {'name': 'Hanaoka Yuzu', 'year': '1', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Special'},
    {'name': 'Saiba Midori', 'year': '1', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Light'},
    {'name': 'Saiba Momoi', 'year': '1', 'rarity': '2★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Light'},
    {'name': 'Tendou Alice', 'year': '1', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Mystic', 'Armor Type': 'Special'},
  ];

  final List<Map<String, String>> trinityGeneralSchool = [
    {'name': 'Kirifuji Nagisa', 'year': '3', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Explosive', 'Armor Type': 'Heavy'},
    {'name': 'Yurizono Seia', 'year': '3', 'rarity': '3★', 'role': 'Support', 'Damage Type': 'Piercing', 'Armor Type': 'Elastic'},
    {'name': 'Misono Mika', 'year': '3', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Light'},
    {'name': 'Kenzaki Tsurugi', 'year': '3', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Heavy'},
    {'name': 'Hanekawa Hasumi', 'year': '3', 'rarity': '2★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Heavy'},
    {'name': 'Shizuyama Mashiro', 'year': '1', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Explosive', 'Armor Type': 'Heavy'},
    {'name': 'Nakamasa Ichika', 'year': '2', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Sonic', 'Armor Type': 'Heavy'},
    {'name': 'Ajitani Hifumi', 'year': '2', 'rarity': '3★', 'role': 'Support', 'Damage Type': 'Piercing', 'Armor Type': 'Light'},
    {'name': 'Shirasu Azusa', 'year': '2', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Explosive', 'Armor Type': 'Heavy'},
    {'name': 'Shimoe Koharu', 'year': '1', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Explosive', 'Armor Type': 'Heavy'},
    {'name': 'Urawa Hanako', 'year': '2', 'rarity': '2★', 'role': 'Healer', 'Damage Type': 'Piercing', 'Armor Type': 'Special'},
    
  ];

  final List<Map<String, String>> gehennaAcademy = [
    {'name': 'Sorasaki Hina', 'year': '3', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Explosive', 'Armor Type': 'Heavy'},
    {'name': 'Amau Ako', 'year': '3', 'rarity': '3★', 'role': 'Support', 'Damage Type': 'Mystic', 'Armor Type': 'Heavy'},
    {'name': 'Shiromi Iori', 'year': '2', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Heavy'},
    {'name': 'Hinomiya Chinatsu', 'year': '1', 'rarity': '1★', 'role': 'Healer', 'Damage Type': 'Piercing', 'Armor Type': 'Light'},
    {'name': 'Hanuma Makoto', 'year': '3', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Piercing', 'Armor Type': 'Special'},
    {'name': 'Kyougoku Satsuki', 'year': '3', 'rarity': '3★', 'role': 'Dealer', 'Damage Type': 'Explosive', 'Armor Type': 'Heavy'},
    {'name': 'Motomiya Chiaki', 'year': '2', 'rarity': '2★', 'role': 'Dealer', 'Damage Type': 'Sonic', 'Armor Type': 'Special'},
    {'name': 'Natsume Iroha', 'year': '2', 'rarity': '3★', 'role': 'Tactical', 'Damage Type': 'Mystic', 'Armor Type': 'Heavy'},
    {'name': 'Tanga Ibuki', 'year': '1', 'rarity': '2★', 'role': 'Support', 'Damage Type': 'Mystic', 'Armor Type': 'Heavy'},
    {'name': 'Aikiyo Fuuka', 'year': '2', 'rarity': '2★', 'role': 'Healer', 'Damage Type': 'Explosive', 'Armor Type': 'Heavy'},
    {'name': 'Ushimaki Juri', 'year': '1', 'rarity': '1★', 'role': 'Support', 'Damage Type': 'Explosive', 'Armor Type': 'Light'},
  ];

  List<MapEntry<String, List<Map<String, String>>>> get schools => [
    MapEntry('Millennium Science School', millenniumScienceSchool),
    MapEntry('Trinity General School', trinityGeneralSchool),
    MapEntry('Gehenna Academy', gehennaAcademy),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Animation<double> _buildFadeAnimation() {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  Color getRarityColor(String rarity) {
    switch (rarity) {
      case '3★':
        return const Color.fromARGB(255, 255, 161, 235); // Pink
      case '2★':
        return const Color.fromARGB(255, 253, 218, 101); // Yellow
      case '1★':
        return const Color.fromARGB(255, 81, 177, 255); // Blue
      default:
        return Colors.grey;
    }
  }

  Color getDamageTypeColor(String damageType) {
    switch (damageType) {
      case 'Explosive':
        return const Color.fromARGB(255, 143, 30, 22);
      case 'Piercing':
        return const Color.fromARGB(255, 255, 197, 6);
      case 'Mystic':
        return const Color.fromARGB(255, 31, 165, 189);
      case 'Sonic':
        return const Color.fromARGB(255, 142, 94, 197);
      default:
        return Colors.grey;
    }
  }

  Color getArmorTypeColor(String armorType) {
    switch (armorType) {
      case 'Light':
        return const Color.fromARGB(255, 143, 30, 22);
      case 'Heavy':
        return const Color.fromARGB(255, 255, 197, 6);
      case 'Special':
        return const Color.fromARGB(255, 31, 165, 189);
      case 'Elastic':
        return const Color.fromARGB(255, 142, 94, 197);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: _buildAnimatedList(),
    );
  }

  List<Widget> _buildAnimatedList() {
    final widgets = <Widget>[];
    final fadeAnimation = _buildFadeAnimation();

    for (final schoolEntry in schools) {
      // Animate school header
      widgets.add(
        AnimatedBuilder(
          animation: fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: fadeAnimation.value,
              child: child,
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              schoolEntry.key,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        ),
      );

      // Animate student cards
      for (var i = 0; i < schoolEntry.value.length; i++) {
        final student = schoolEntry.value[i];

        widgets.add(
          AnimatedBuilder(
            animation: fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: fadeAnimation.value,
                child: child,
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Text('${i + 1}'),
                ),
                title: Text(
                  student['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Year ${student['year']} • ${student['role']}'),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: getDamageTypeColor(student['Damage Type']!)
                                .withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                                  getDamageTypeColor(student['Damage Type']!),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            student['Damage Type']!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color:
                                  getDamageTypeColor(student['Damage Type']!),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: getArmorTypeColor(student['Armor Type']!)
                                .withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                                  getArmorTypeColor(student['Armor Type']!),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            student['Armor Type']!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color:
                                  getArmorTypeColor(student['Armor Type']!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: getRarityColor(student['rarity']!)
                        .withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: getRarityColor(student['rarity']!),
                    ),
                  ),
                  child: Text(
                    student['rarity']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: getRarityColor(student['rarity']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return widgets;
  }
}

