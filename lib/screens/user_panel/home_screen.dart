import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🌈 gradient background: lavender ➜ mint
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3E5F5), Color(0xFFE8F5E9)], // lavender to mint
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _body(context),
      ),
      // deep-indigo app-bar
      appBar: AppBar(
        backgroundColor: Color(0xFF3949AB),
        title: const Text('Care_Now', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.notifications),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Color(0xFF3949AB),      // indigo highlight
        unselectedItemColor: Colors.grey.shade600,
        onTap: (i) {
          if (i == 1) Navigator.pushNamed(context, AppRoutes.myBookings);
          if (i == 2) Navigator.pushNamed(context, AppRoutes.profile);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  //--- main scroll body -----------------------------------------------------
  Widget _body(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        _buildSearchBar(),
        _buildCategorySection(),
        _buildBannerSection(),
        _buildFeaturedCaretakers(context),
      ],
    ),
  );

  // search bar --------------------------------------------------------------
  Widget _buildSearchBar() => Padding(
    padding: const EdgeInsets.all(16),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search service, city, or zip',
        prefixIcon: const Icon(Icons.search, color: Color(0xFF3949AB)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  // categories --------------------------------------------------------------
  Widget _buildCategorySection() => Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _categoryTile('Hourly', Icons.access_time, const Color(0xFF0288D1)), // blue
        _categoryTile('Daily', Icons.today, const Color(0xFF43A047)),        // green
        _categoryTile('Weekly', Icons.date_range, const Color(0xFFF4511E)),  // deep-orange
      ],
    ),
  );

  Widget _categoryTile(String label, IconData icon, Color c) => Column(
    children: [
      CircleAvatar(radius: 28, backgroundColor: c.withOpacity(.15), child: Icon(icon, color: c)),
      const SizedBox(height: 5),
      Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    ],
  );

  // promo banners -----------------------------------------------------------
  Widget _buildBannerSection() => Container(
    height: 150,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: PageView(
      children: [
        _bannerTile('Special Offer – 20 % Off', const Color(0xFFFFCCBC)), // peach
        _bannerTile('Trusted Caretakers Near You', const Color(0xFF90CAF9)), // light blue
      ],
    ),
  );

  Widget _bannerTile(String t, Color c) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: c,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))],
    ),
    child: Center(
      child: Text(t,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
    ),
  );

  // featured caretakers -----------------------------------------------------
  Widget _buildFeaturedCaretakers(BuildContext ctx) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Featured Caretakers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (c, i) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: const CircleAvatar(backgroundImage: AssetImage('lib/assets/images/user1.png')),
            title: Text('Caretaker ${i + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('5 years experience • ₹300/hr'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF3949AB)),
            onTap: () => Navigator.pushNamed(ctx, AppRoutes.caretakerDetails),
          ),
        ),
      ),
    ],
  );
}
