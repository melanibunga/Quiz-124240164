import 'package:flutter/material.dart';
import 'destinationModels.dart';

class destinationDetailPage extends StatelessWidget {
  final DestinationModel destination;

  const destinationDetailPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(destination.name),
        backgroundColor: const Color.fromARGB(255, 18, 152, 186),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cover buku
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                destination.imageUrl,
                height: 260,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 260,
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image, size: 60),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              destination.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            Text(
              "${destination.category} • ${destination.location}",
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            const SizedBox(height: 16),
            const Divider(),

            _buildInfoRow(Icons.category_outlined, "Opening Hours", destination.openingHours),
            _buildInfoRow(Icons.business_outlined, "Ticket Info", destination.ticketInfo),
            _buildInfoRow(Icons.category_outlined, "Attraction", destination.attraction),
            _buildInfoRow(
                Icons.menu_book_outlined, "URL", "${destination.wikipediaUrl} "),

            const Divider(),
            const SizedBox(height: 8),

            const Text(
              "Deskripsi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              destination.description,
              style: const TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Kembali ke Library"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 18, 152, 186),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.indigo),
          const SizedBox(width: 10),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}