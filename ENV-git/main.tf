variable "varenvrg" {}
variable "varenvsa" {}
variable "varenvcont" {}
variable "varenvvn" {}
variable "varenvsn" {}
variable "varenvpi" {}
variable "varenvni" {}
variable "varenvvm" {}
variable "varenvnsg" {}
variable "varenvnsgni" {}


module "rg-mod" {
  source = "git::https://github.com/devops-2611/class-codes.git//RG"
  varrg  = var.varenvrg

}


module "sa-mod" {
  depends_on = [ module.rg-mod ]
  source = "git::https://github.com/devops-2611/class-codes.git//SA"
  varsa  = var.varenvsa
}


module "cont-mod" {
  depends_on = [ module.sa-mod ]
  source     = "git::https://github.com/devops-2611/class-codes.git//CONT"
  varcont    = var.varenvcont
  varsa-data = var.varenvsa
}


module "vn-mod" {
  source     = "git::https://github.com/devops-2611/class-codes.git//VN"
  varvn      = var.varenvvn
  depends_on = [module.rg-mod]

}

module "sn-mod" {
  source     = "git::https://github.com/devops-2611/class-codes.git//SN"
  varsn      = var.varenvsn
  depends_on = [module.vn-mod]

}

module "pi-mod" {
  source     = "git::https://github.com/devops-2611/class-codes.git//PI"
  varpi      = var.varenvpi
  depends_on = [module.rg-mod]

}

module "ni-mod" {
  depends_on = [module.pi-mod, module.sn-mod, module.vn-mod]
  source     = "git::https://github.com/devops-2611/class-codes.git//NI"
  varni      = var.varenvni
  vardatapi  = var.varenvpi
  vardatasi  = var.varenvsn


}



module "vm-mod" {
  depends_on = [module.ni-mod, module.sn-mod]
  source     = "git::https://github.com/devops-2611/class-codes.git//VM"
  varvm      = var.varenvvm
  vardatanic = var.varenvni
  # varkv = var.varenvkv
}


module "nsg-mod" {
  depends_on = [module.rg-mod]
  source     = "git::https://github.com/devops-2611/class-codes.git//NSG"
  varnsg     = var.varenvnsg
}

module "nsgni-mod" {
  depends_on = [module.nsg-mod, module.ni-mod]
  source     = "git::https://github.com/devops-2611/class-codes.git//NSGNI"
  varnsgni   = var.varenvnsgni

}

