import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});



// ฟังก์ชันช่วยสร้างตัวเลขสถิติ (ตัวเลข + ข้อความป้าย)
  Widget _stat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {

// ===== แก้ข้อมูลตรงนี้ได้เลย =====
    const String accountId = 'phztchanida';
    const String posts = '3';
    const String followers = '2.158K';
    const String following = '1450';
    const String studentName = 'พัชณิดา สังข์ทอง';
    const String caption1 = 'ni xihuan wo ma??';
    const String caption2 = 'ไม่เอาอะไรแล้วอยากนอนนน';

// ลิงก์ภาพเดียว ใช้ซ้ำทั้ง 3 ช่อง (เปลี่ยนเป็นลิงก์ที่ต้องการได้)
    const String galleryImage = '';
    const String galleryImage1 = 'https://i.pinimg.com/736x/c2/33/23/c23323f267f09bdcc162657ff4000990.jpg';
    const String galleryImage2 = 'https://i.pinimg.com/236x/b3/e4/ba/b3e4ba376b231c25b0a5ab53d746d214.jpg';

// =================================
    return Scaffold(
      backgroundColor: Colors.white,



// ① AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          accountId,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

// ② รูปโปรไฟล์ + สถิติ 3 ช่อง
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images.jpeg'),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _stat(posts, 'โพสต์'),
                        _stat(followers, 'ผู้ติดตาม'),
                        _stat(following, 'กำลังติดตาม'),
                      ],
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 16),



// ③ ชื่อและแคปชัน
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    studentName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 4),
                  Text(caption1, style: TextStyle(fontSize: 12)),
                  Text(caption2, style: TextStyle(fontSize: 12)),
                ],
              ),


              const SizedBox(height: 12),



// ④ ปุ่มติดตาม (ทึบ) + ปุ่มข้อความ (มีเส้นขอบ)
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF4A90E2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('ติดตาม'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.deepPurple,
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('ข้อความ'),
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 12),



// ⑤ แถบไอคอน
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.grid_on, size: 28, color: Colors.black87),
                  Icon(Icons.person_pin, size: 28, color: Colors.grey),
                ],
              ),


              const SizedBox(height: 8),



// ⑥ แกลเลอรีภาพ 3 คอลัมน์
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: [
                  Image.network(galleryImage, fit: BoxFit.cover),
                  Image.network(galleryImage1, fit: BoxFit.cover),
                  Image.network(galleryImage2, fit: BoxFit.cover),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}