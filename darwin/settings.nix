{ self, ... }:
{
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;
}
