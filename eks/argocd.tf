resource "helm_release" "argocd" {
  name       = "argocd"  # Ім'я релізу Helm
  chart      = "argo-cd"  # Назва чарту Helm для ArgoCD
  repository = "https://argoproj.github.io/argo-helm" # Репозиторій, звідки береться чар
  version    = "6.6.0"

  namespace       = "argocd"  # Простір імен, у якому буде розгорнуто ArgoCD
  create_namespace = true  # Створює простір імен, якщо він не існує

  set {
    name  = "configs.params.server\\.insecure" # Налаштування для запуску сервера без TLS в нашому випадку трафік  дешифрується на лоадбалансері
    value = true
  }

  set { # Налаштування глобального домену для ArgoCD
    name  = "global.domain"
    value = "argocd.olegk.devops3.test-danit.com"
  }

  set { # Увімкнення Ingress для сервера ArgoCD
    name  = "server.ingress.enabled"
    value = "true"
  }

  set { # Встановлення класу Ingress-контролера
    name  = "server.ingress.ingressClassName"
    value = "nginx"
  }

   

  set { # Відключення примусового перенаправлення на HTTPS
    name  = "server.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/force-ssl-redirect"
    value = "false"
  }

  set {   # Увімкнення підтримки SSL-passthrough
    name  = "server.ingress.annotations.nginx\\.ingress\\.kubernetes\\.io/ssl-passthrough"
    value = "true"
  }

  
  set {  # Протокол бекенда встановлений як HTTP
    name  = "server.ingress.backendProtocol"
    value = "HTTP"  
  }

  set {   # Встановлення пароля адміністратора ArgoCD
    name  = "configs.secret.argocdServerAdminPassword" 
    value = "$2a$10$WttnEprScw2HSAEuw7GF0OZPi0tZgodgQEH.KYmYYv.0NvMRKYCCa"
  }

  depends_on = [helm_release.nginx_ingress] # Встановлення залежності від релізу Helm для NGINX Ingress
}