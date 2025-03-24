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
  source = "../RG"
  varrg  = var.varenvrg

}


module "sa-mod" {
  depends_on = [ module.rg-mod ]
  source = "../SA"
  varsa  = var.varenvsa
}


module "cont-mod" {
  depends_on = [ module.sa-mod ]
  source     = "../CONT"
  varcont    = var.varenvcont
  varsa-data = var.varenvsa
}


module "vn-mod" {
  source     = "../VN"
  varvn      = var.varenvvn
  depends_on = [module.rg-mod]

}

module "sn-mod" {
  source     = "../SN"
  varsn      = var.varenvsn
  depends_on = [module.vn-mod]

}

module "pi-mod" {
  source     = "../PI"
  varpi      = var.varenvpi
  depends_on = [module.rg-mod]

}

module "ni-mod" {
  depends_on = [module.pi-mod, module.sn-mod, module.vn-mod]
  source     = "../NI"
  varni      = var.varenvni
  vardatapi  = var.varenvpi
  vardatasi  = var.varenvsn


}



module "vm-mod" {
  depends_on = [module.ni-mod, module.sn-mod]
  source     = "../VM"
  varvm      = var.varenvvm
  vardatanic = var.varenvni
  # varkv = var.varenvkv
}


module "nsg-mod" {
  depends_on = [module.rg-mod]
  source     = "../NSG"
  varnsg     = var.varenvnsg
}

module "nsgni-mod" {
  depends_on = [module.nsg-mod, module.ni-mod]
  source     = "../NSGNI"
  varnsgni   = var.varenvnsgni

}

