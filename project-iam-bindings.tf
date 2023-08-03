# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# authoritative project-iam-bindings to increase reproducibility
module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  projects = [var.project_id]
  mode     = "authoritative"

  bindings = {
    "roles/cloudtrace.agent" = [
      "serviceAccount:${google_service_account.gke_workload_development.email}",
      #"serviceAccount:${google_service_account.gke_workload_staging.email}",
      "serviceAccount:${google_service_account.gke_workload_production.email}",
      "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
    ],
    "roles/monitoring.metricWriter" = [
      "serviceAccount:${google_service_account.gke_workload_development.email}",
      #"serviceAccount:${google_service_account.gke_workload_staging.email}",
      "serviceAccount:${google_service_account.gke_workload_production.email}",
      "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
    ],
    "roles/logging.logWriter" = [
        "serviceAccount:${google_service_account.gke_workload_development.email}",
        #"serviceAccount:${google_service_account.gke_workload_staging.email}",
        "serviceAccount:${google_service_account.gke_workload_production.email}",
        "serviceAccount:${google_service_account.cloud_build_pr.email}",
        "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
       
      ],
    "roles/gkehub.gatewayEditor" = [
      "serviceAccount:${google_service_account.gke_workload_development.email}",
      #"serviceAccount:${google_service_account.gke_workload_staging.email}",
      "serviceAccount:${google_service_account.gke_workload_production.email}",
      "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com",
      "serviceAccount:${google_service_account.cloud_build_pr.email}"
      ],
    "roles/gkehub.viewer" =  [
      "serviceAccount:${google_service_account.gke_workload_development.email}",
     # "serviceAccount:${google_service_account.gke_workload_staging.email}",
      "serviceAccount:${google_service_account.gke_workload_production.email}",
      "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com",
      "serviceAccount:${google_service_account.cloud_build_pr.email}"
      ]
   
  }
}

