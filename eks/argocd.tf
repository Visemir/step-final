resource "helm_release" "argocd" {
  name       = "argocd"
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  version    = "6.6.0"

  namespace       = "argocd"
  create_namespace = true

  set {
    # Run server without TLS
    name  = "configs.params.server\\.insecure"
    value = true
  }

  set {
    name  = "global.domain"
    value = "argocd.olegk.devops3.test-danit.com"
  }

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.ingressClassName"
    value = "nginx"
  }

   

  set {
    name  = "server.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/force-ssl-redirect"
    value = "false"
  }

  set {
    name  = "server.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/ssl-passthrough"
    value = "true"
  }

  
  set {
    name  = "server.ingress.backendProtocol"
    value = "HTTP"  
  }

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = "$2a$10$WttnEprScw2HSAEuw7GF0OZPi0tZgodgQEH.KYmYYv.0NvMRKYCCa"
  }

  depends_on = [helm_release.nginx_ingress]
}