List<Job> jobFromJson(List<dynamic> jobJson) =>
    List<Job>.from(jobJson.map((jobListJson) => Job.fromJson(jobListJson)));

class Job {
  String? id;
  String? title;
  String? description;
  String? companyName;
  String? location;
  String? salaryMin;
  String? salaryMax;
  String? jobType;
  String? experienceRequired;
  bool? isActive;
  String? createdAt;
  Employer? employer;

  Job({
    this.id,
    this.title,
    this.description,
    this.companyName,
    this.location,
    this.salaryMin,
    this.salaryMax,
    this.jobType,
    this.experienceRequired,
    this.isActive,
    this.createdAt,
    this.employer,
  });

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    companyName = json['company_name'];
    location = json['location'];
    salaryMin = json['salary_min'];
    salaryMax = json['salary_max'];
    jobType = json['job_type'];
    experienceRequired = json['experience_required'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    employer = json['employer'] != null
        ? new Employer.fromJson(json['employer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['company_name'] = this.companyName;
    data['location'] = this.location;
    data['salary_min'] = this.salaryMin;
    data['salary_max'] = this.salaryMax;
    data['job_type'] = this.jobType;
    data['experience_required'] = this.experienceRequired;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    if (this.employer != null) {
      data['employer'] = this.employer!.toJson();
    }
    return data;
  }
}

class Employer {
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? vendorType;

  Employer({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.vendorType,
  });

  Employer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileImage = json['profile_image'];
    vendorType = json['vendor_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['vendor_type'] = this.vendorType;
    return data;
  }
}
