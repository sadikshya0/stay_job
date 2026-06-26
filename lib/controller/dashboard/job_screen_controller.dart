import 'package:get/get.dart';
import 'package:safe_job/repo/get_jobs_repo.dart';
import 'package:safe_job/model/job.dart';

class JobScreenController extends GetxController {
  var selectedIndex = 0.obs;
  var isLoading = false.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  RxList<Job> jobList = <Job>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchJob();
  }

  Future<void> fetchJob() async {
    try {
      isLoading.value = true;

      await GetJobsRepo.getJobsRepo(
        onSuccess: (job) {
          jobList.assignAll(job);
        },
        onError: (message) {
          Get.snackbar("Error", message);
        },
      );
    } finally {
      isLoading.value = false;
    }
  }
}
