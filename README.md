# Terragrunt-workspace

Central repository for managing Terragrunt configurations and profiles across multiple cloud environments and setups.

---

## Prerequisites

- [Terragrunt](https://terragrunt.gruntwork.io/) installed on your machine
- [Terraform](https://www.terraform.io/downloads.html) installed (compatible version with your Terragrunt)
- [Docker](https://docs.docker.com/get-docker/) installed and running
- [kubectl](https://kubernetes.io/docs/tasks/tools/) installed
- Basic understanding of Kubernetes and Helm

---

## Usage

1. Navigate to the desired Terragrunt environment directory.

2. Run the following to plan and apply your infrastructure:

   ```bash
   terragrunt plan -all
   terragrunt apply -all
   ```
3. Follow the Post-Apply Instructions below.

---

## Post-Apply Instructions

After running `terragrunt apply`, please follow these steps to access your Kubernetes cluster and deploy ArgoCD applications:

1. **Copy the Kubeconfig file**

   Copy the generated kubeconfig from the control plane node to your local Kubernetes config directory:

   ```bash
   cp /tmp/rancher/k3s/kubeconfig ~/.kube/config
   ```
2. **Deploy the ArgoCD Application Manifest**

   Apply the ArgoCD app manifest to deploy your application:

   ```bash
   kubectl apply -f k3s-helm/argocd-app.yaml
   ```

---

## Troubleshooting
 - **Namespace creation or Kubernetes API not ready**:

   Ensure the k3s control plane container is fully started and healthy before running Helm or Kubernetes resource provisioning. You may need to wait a minute or check container logs:
   ```bash
   docker logs <k3s-control-plane-container-name>
   ```

 - **Docker or networking issues:**

   Make sure Docker daemon is running and your network configurations do not conflict.

 - **Kubeconfig issues:**

   Verify the copied kubeconfig file has proper permissions and correct paths.

---

## Contributing
  Contributions, issues, and feature requests are welcome! Feel free to check issues page
