List<Room> roomFromJson(List<dynamic> roomJson) => List<Room>.from(
  roomJson.map((roomListJson) => Room.fromJson(roomListJson)),
);

class Room {
  final String id;
  final String title;
  final String description;
  final double rentAmount;
  final String location;
  final String roomType;
  final bool isAvailable;
  final String image;
  final DateTime createdAt;
  final Vendor vendor;
  final List<AvailabilitySlot> availabilitySlots;

  Room({
    required this.id,
    required this.title,
    required this.description,
    required this.rentAmount,
    required this.location,
    required this.roomType,
    required this.isAvailable,
    required this.image,
    required this.createdAt,
    required this.vendor,
    required this.availabilitySlots,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      rentAmount: double.parse(json['rent_amount'].toString()),
      location: json['location'],
      roomType: json['room_type'],
      isAvailable: json['is_available'] == "1",
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      vendor: Vendor.fromJson(json['vendor']),
      availabilitySlots: (json['availability_slots'] as List)
          .map((e) => AvailabilitySlot.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'rent_amount': rentAmount,
      'location': location,
      'room_type': roomType,
      'is_available': isAvailable ? "1" : "0",
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'vendor': vendor.toJson(),
      'availability_slots': availabilitySlots.map((e) => e.toJson()).toList(),
    };
  }
}

class Vendor {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String vendorType;
  final String profileImage;

  Vendor({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.vendorType,
    required this.profileImage,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      vendorType: json['vendor_type'],
      profileImage: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'vendor_type': vendorType,
      'profile_image': profileImage,
    };
  }
}

class AvailabilitySlot {
  final String id;
  final String availableDate;
  final String startTime;
  final String endTime;
  final bool isBooked;
  final DateTime createdAt;

  AvailabilitySlot({
    required this.id,
    required this.availableDate,
    required this.startTime,
    required this.endTime,
    required this.isBooked,
    required this.createdAt,
  });

  factory AvailabilitySlot.fromJson(Map<String, dynamic> json) {
    return AvailabilitySlot(
      id: json['id'],
      availableDate: json['available_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      isBooked: json['is_booked'] == "1",
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'available_date': availableDate,
      'start_time': startTime,
      'end_time': endTime,
      'is_booked': isBooked ? "1" : "0",
      'created_at': createdAt.toIso8601String(),
    };
  }
}
