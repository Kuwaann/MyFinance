import 'package:flutter/material.dart';
import 'package:myfinance/styles.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 17),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              "OUR TEAMS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Daftar anggota kelompok
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  TeamMember(
                    name: "Achmad Nur Choiron",
                    nim: "124230126",
                    imagePath: "assets/images/roblox.jpeg",
                  ),
                  SizedBox(height: 16),
                  TeamMember(
                    name: "Muhammad Sulthan Al Azzam",
                    nim: "124230127",
                    imagePath: "assets/images/roblox.jpeg",
                  ),
                  SizedBox(height: 16),
                  TeamMember(
                    name: "Muhammad Emir Rivaldy",
                    nim: "124230135",
                    imagePath: "assets/images/roblox.jpeg",
                  ),
                  SizedBox(height: 16),
                  TeamMember(
                    name: "Ridho Nur Maulana",
                    nim: "124230142",
                    imagePath: "assets/images/roblox.jpeg",
                  ),
                ],
              ),
            ),

            // Tombol kembali ke menu
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/homepage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  "Kembali ke Menu",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamMember extends StatelessWidget {
  final String name;
  final String nim;
  final String imagePath;

  const TeamMember({
    super.key,
    required this.name,
    required this.nim,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 17, 17, 29),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineElement, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey[400],
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "($nim)",
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
