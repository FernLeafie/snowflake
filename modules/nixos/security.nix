{
  # hopefully blocks compromised certificates
  # currently cant update the system due to the linux kernel failing to build
  # might remove at a later date when packages have updated properly
  # related to https://emudhra.we-have-a-problem.com/
  security.pki.caCertificateBlacklist = [
    "Comodo AAA Services root"
    # "emSign ECC Root CA - G3"
  ];
}
