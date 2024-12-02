1. Create GitHub repo with:

 - [test python backend server](https://github.com/Visemir/step-final/blob/main/app/app.py). Just script which listening on some port and respond 200 on /

 - [Dockerfile](https://github.com/Visemir/step-final/blob/main/app/Dockerfile) with everything needed to run this script

 - [GitHub action](https://github.com/Visemir/step-final/blob/main/.github/workflows/main.yml) which will build docker image automatically and push to docker hub. Use Github secrets to store your docker hub creds

![](https://github.com/Visemir/step-final/blob/main/img/secrets.jpg)

![](https://github.com/Visemir/step-final/blob/main/img/git-actins.jpg)

2. Use terraform code to create EKS cluster 

 - one node group with one node

 - nginx ingress controller

![](https://github.com/Visemir/step-final/blob/main/img/eks.jpg)

3. [Write terraform code which will install ArgoCD](https://github.com/Visemir/step-final/blob/main/eks/argocd.tf) to EKS using helm chart or raw k8s manifest

 - argocd must have dns name in domain: devops1.test-danit.com (change devops1 to your group number) example: argocd.student1.devops1.test-danit.com where student1 is your cluster name.

4. [Write K8S manifests](https://github.com/Visemir/step-final/tree/main/kube-deploy) to deploy your app from item 1 to EKS.

 - deployment, service, ingress.

 - app must be available by dns name in domain: devops1.test-danit.com (change devops1 to your group number) example: app.student1.devops1.test-danit.com

![](https://github.com/Visemir/step-final/blob/main/img/app-v1.jpg)

5. Write [ArgoCD app](https://github.com/Visemir/step-final/blob/main/argo-app-config/argo-app.yaml) which will deliver code from item 4 to EKS and will update it on new commit.

![](https://github.com/Visemir/step-final/blob/main/img/argo.jpg)

![](https://github.com/Visemir/step-final/blob/main/img/argo-merge.jpg)

![](https://github.com/Visemir/step-final/blob/main/img/app-v2.jpg)





