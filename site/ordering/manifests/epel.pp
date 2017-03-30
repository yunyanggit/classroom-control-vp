class ordering::epel {
  # How do we ensure that this is enforced before any packages that might depend on it?
  yumrepo { 'epel':
    enabled => 1,
  }

}
