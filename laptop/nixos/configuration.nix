# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	  <home-manager/nixos>
    ];

	home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;
	home-manager.users.donbravias = import ./home.nix;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."donbravias" = {
    isNormalUser = true;
    description = "Marvin Braun";
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.pipewire = {
  	enable = true;
	alsa.enable = true;
	pulse.enable = true;
  };


  services.keyd = {
  	enable=true;

	keyboards.default = {
		ids = [ "*" ];
		
		settings.main = {
			capslock = "esc";
			esc = "capslock";
		};
	};
  };


	services.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;

	services.gnome.core-apps.enable = false;
	services.gnome.core-developer-tools.enable = false;
	services.gnome.games.enable = false;

	environment.gnome.excludePackages = with pkgs; [
		gnome-tour
		gnome-user-docs
	];



  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	# system / cli
    wget
    git
	ripgrep
	killall
	fastfetch
	tealdeer

	# working environment
    neovim
	tmux

	# languages & LSP
	rustc
	cargo
	rust-analyzer
	gcc
	lua-language-server
	nil

	# desktop applications
	alacritty
	zathura
	zathuraPkgs.zathura_pdf_poppler
	anki
	firefox
	thunar
	obs-studio

	bibata-cursors
  ];

  fonts.packages = with pkgs; [
		recursive
		jetbrains-mono
		maple-mono.truetype
		maple-mono.Normal-TTF
		fantasque-sans-mono
		noto-fonts
		noto-fonts-color-emoji
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
