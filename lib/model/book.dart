List<Book> bookFromJson(List<dynamic> bookJson) => List<Book>.from(
  bookJson.map((bookListJson) => Book.fromJson(bookListJson)),
);

class Book {
  Booking? booking;
  Room? room;
  Slot? slot;

  Book({this.booking, this.room, this.slot});

  Book.fromJson(Map<String, dynamic> json) {
    booking = json['booking'] != null
        ? new Booking.fromJson(json['booking'])
        : null;
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
    slot = json['slot'] != null ? new Slot.fromJson(json['slot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    if (this.slot != null) {
      data['slot'] = this.slot!.toJson();
    }
    return data;
  }
}

class Booking {
  String? id;
  String? date;
  String? notes;
  String? status;
  String? createdAt;

  Booking({this.id, this.date, this.notes, this.status, this.createdAt});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    notes = json['notes'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['notes'] = this.notes;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Room {
  String? id;
  String? title;
  String? location;
  String? rentAmount;
  String? roomType;
  String? image;
  Vendor? vendor;

  Room({
    this.id,
    this.title,
    this.location,
    this.rentAmount,
    this.roomType,
    this.image,
    this.vendor,
  });

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    location = json['location'];
    rentAmount = json['rent_amount'];
    roomType = json['room_type'];
    image = json['image'];
    vendor = json['vendor'] != null
        ? new Vendor.fromJson(json['vendor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['location'] = this.location;
    data['rent_amount'] = this.rentAmount;
    data['room_type'] = this.roomType;
    data['image'] = this.image;
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    return data;
  }
}

class Vendor {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? vendorType;
  String? profileImage;

  Vendor({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.vendorType,
    this.profileImage,
  });

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    vendorType = json['vendor_type'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['vendor_type'] = this.vendorType;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

class Slot {
  String? id;
  String? availableDate;
  String? startTime;
  String? endTime;

  Slot({this.id, this.availableDate, this.startTime, this.endTime});

  Slot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    availableDate = json['available_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['available_date'] = this.availableDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
