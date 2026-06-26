import 'package:get/get.dart';
import 'package:safe_job/model/job.dart';
import 'package:safe_job/repo/get_jobs_repo.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Job> jobs = <Job>[].obs;

  @override
  void onInit() {
    super.onInit();
    GetJobsRepo();
  }
}
