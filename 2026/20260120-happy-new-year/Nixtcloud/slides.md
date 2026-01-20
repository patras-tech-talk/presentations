---
theme: default
title: Nixtcloud - Self-Hosted Cloud in One Command
info: |
  ## Nixtcloud
  Privacy · Power · Peer-to-Peer
  
  Presentation by Vaios Karastathis
class: text-center
highlighter: shiki
drawings:
  persist: false
transition: slide-left
mdc: true
---

# NIXTCLOUD

## Self-Hosted Cloud in One Command

<div class="pt-12">
  <span class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Patras Tech Talk | Jan 2026 | PWC
  </span>
</div>

<div class="abs-br m-6 flex gap-2">
  <a href="https://github.com/jjacke13/nixtcloud" target="_blank" alt="GitHub" title="GitHub"
    class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-white">
    <carbon-logo-github />
  </a>
</div>

---

# Vaios Karastathis

<div class="grid grid-cols-2 gap-4">

<div>


<br>

- ⭐ github.com/jjacke13/nixtcloud (18 stars)
- 💼 linkedin.com/in/vaios-karastathis
- 📺 YouTube: @eikosiena

</div>

<div class="flex items-center justify-center">

<!-- Add your photo here if desired -->
<!-- <img src="/your-photo.jpg" class="rounded-full w-60" /> -->

</div>

</div>

---
layout: section
---

# Where Is Your Data?

---

# The Problem

<div class="grid grid-cols-2 gap-12">

<div>

## ☁️ Cloud Services

<v-click>

- Your data on their servers
- No control, no privacy
- Terms you never read
- Data analyzed & monetized

</v-click>

</div>

<div>

## 🏠 Self-Hosting

<v-click>

- Complex setup (ports, DNS, SSL)
- Constant maintenance
- Manual updates & security
- Fragile, error-prone

</v-click>

</div>

</div>

<v-click>

<div class="text-center text-2xl text-yellow-400 font-bold mt-12">
We need a better way.
</div>

</v-click>

---
layout: center
class: text-center
---

# What If...

```bash

$ nix build github:jjacke13/nixtcloud

```

<br>

<div class="text-3xl font-bold">
One command. Flash to SD-card/Disk. Boot. Done.
</div>

<br>

<v-click>

# Welcome to **NIXTCLOUD**

</v-click>

---
layout: default
---

# The Three Pillars

<div class="grid grid-cols-3 gap-8 mt-8">

<div class="text-center">
  <img src="/nixos-logo.png" class="h-32 mx-auto mb-4" />
  <h3 class="text-green-400 font-bold">NixOS</h3>
  <p class="text-sm">Declarative Foundation</p>
</div>

<div class="text-center">
  <img src="/nextcloud-logo.png" class="h-32 mx-auto mb-4" />
  <h3 class="text-blue-400 font-bold">Nextcloud</h3>
  <p class="text-sm">Cloud Application</p>
</div>

<div class="text-center">
  <img src="/holesail-logo.png" class="h-32 mx-auto mb-4" />
  <h3 class="text-purple-400 font-bold">Holesail</h3>
  <p class="text-sm">P2P Connectivity</p>
</div>

</div>

<div class="text-center mt-8">

**Each pillar solves a critical problem. Together, they create something greater.**

</div>

---
layout: section
---

# Pillar 1

## NixOS — The Foundation

---

# What is Nix?

<div class="grid grid-cols-2 gap-8">

<div class="flex justify-center items-center">
  <img src="/the-declarative-trinity.webp" class="h-96" />
</div>

<div class="flex flex-col justify-center">

<v-clicks>

- **Functional Language**
  - Pure functional approach to package management

- **Package Manager**
  - Declarative package definitions and builds
  - (Linux - MacOS - WSL)
  - (x86 / aarch64 / i686)

- **NixOS**
  - Complete Linux distribution built on Nix principles

</v-clicks>

</div>

</div>

---

# The Nixpkgs Ecosystem

<div class="flex flex-col items-center justify-center h-full">

<div class="text-center mb-8">

<div class="flex items-center justify-center">
  <img src="/nixos-packages.png" class="max-h-96 rounded-lg" text="https://search.nixos.org/options" />
</div>

## 📦 **120,000+ packages**

### The largest package repository

</div>

<div class="grid grid-cols-1 gap-8 mt-5">

<v-clicks>

<div class="text-center p-4 bg-gray-800 rounded-lg">

**github.com/NixOS/nixpkgs**

</div>

</v-clicks>

</div>

</div>

---

# Nix Power Tools

<div class="grid grid-cols-2 gap-8 mt-8">

<div>

## 🛠️ nix-shell

**Instant development environments**

<div class="text-white opacity-100">

```bash
# Need Python + numpy?
nix-shell -p python3 python3Packages.numpy

# Or declaratively:
nix-shell shell.nix
```

</div>

<v-clicks>

- Zero system pollution
- Reproducible across machines
- Perfect for DevOps workflows

</v-clicks>

</div>

<div>

## 🏗️ nix-build

**Declarative builds**

<div class="text-white opacity-100">

```bash
  pkgs.stdenv.mkDerivation {
    pname = "hello-cpp";
    version = "1.0.0";
    src = ./.;
    buildInputs = [ pkgs.cowsay ];
    nativeBuildInputs = [ pkgs.gcc ];
    buildPhase = ''
       g++ -o hello simple.cpp
    '';
  
    installPhase = ''
    mkdir -p $out/bin
    cp hello $out/bin/
  '';
}
```
</div>
<v-clicks>
- Strictly defined dependencies
</v-clicks>
</div>
</div>

---

# Why NixOS?

<div class="grid grid-cols-2 gap-4">

<div>

## Traditional Linux

<v-clicks>

- **Imperative** — "Run these commands"
- **Mutable** — System changes in place
- **Configuration Drift** — "It worked last month..."
- **Manual Rollback** — Hope you have backups

</v-clicks>

</div>

<div>

## NixOS

<v-clicks>

- **Declarative** — "This is the desired state"
- **Immutable** — System rebuilt from config
- **Reproducible** — Same config = Same system
- **Atomic Generations** — Boot previous instantly

</v-clicks>

</div>

</div>

<br>

<v-click>

<div class="text-center text-xl text-cyan-400 font-bold">
NixOS is Infrastructure as Code taken to its logical conclusion.
</div>

</v-click>

---

# NixOS Configuration Example

<div class="grid grid-cols-2 gap-8">

<div class="text-white opacity-100">

```nix
{
  boot.loader.grub.device = "/dev/sda";
  
  networking.hostName = "myserver";
  networking.firewall.enable = true;
  
  services.nginx.enable = true;
  
  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  
  environment.systemPackages = [
    pkgs.htop
    pkgs.git
  ];
}
```

</div>
<div class="flex items-center justify-center">
  <img src="/nixos-options.png" class="max-h-96 rounded-lg" text="https://search.nixos.org/options" />
</div>

</div>

<div class="text-center mt-5 text-lg">
Your entire system defined in one file. Change it, rebuild, done.
</div>

---

# Reproducibility: The Superpower

<div class="grid grid-cols-1 gap-4 items-center">

<div class="text-center p-4 bg-gray-800 rounded-lg">

### configuration.nix
*Your config*

</div>

</div>

<div class="text-center text-6xl my-8">
⬇️
</div>

<div class="text-center p-6 bg-green-900 rounded-lg text-2xl font-bold">
IDENTICAL IMAGE — Every. Single. Time.
</div>

<br>

<v-clicks>

- ✅ Build on your laptop → runs on Raspberry Pi
- ✅ Build today → build next year → same result
- ✅ Share config → anyone can reproduce your system

</v-clicks>

---

# Atomic Upgrades & Instant Rollback

## Boot Menu:

<div class="text-2xl font-mono bg-gray-800 p-8 rounded-lg">

```
NixOS - Generation 47 (current)     ← Latest

NixOS - Generation 46               ← Previous

NixOS - Generation 45

NixOS - Generation 44

...
```

</div>

<v-click>

<div class="mt-8 text-xl">

**Update broke something?**

→ Reboot, select previous generation<br>
→ System restored in **30 seconds**

</div>

</v-click>

<v-click>

<div class="mt-4 text-2xl text-green-400 font-bold text-center">
No reinstallation. No lost weekends.
</div>

</v-click>

---

# Why This Matters for Self-Hosting

<div class="grid grid-cols-2 gap-8">

<div>

<v-clicks>

- ✅ **No Configuration Drift**
  - Your system stays exactly as defined

- ✅ **Reproducible Builds**
  - Rebuild your server from scratch anytime

- ✅ **Easy Recovery**
  - Rollback to working state instantly

</v-clicks>

</div>

<div>

<v-clicks>

- ✅ **Shareable Infrastructure**
  - Your config IS the documentation

- ✅ **Auditable**
  - Review every package, every service

</v-clicks>

</div>

</div>

<br>

<v-click>

<div class="text-center text-2xl text-cyan-400 font-bold">
Your machine becomes a server you can TRUST.
</div>

</v-click>

---

# What's the Catch?

<div class="flex flex-col items-center justify-center h-full">

<v-click>

<img src="/nix-learning-curve.png" class="max-h-96 rounded-lg" />

</v-click>

</div>

---
layout: section
---

# Pillar 2

## Nextcloud — The Application

---

# Nextcloud: Your Private Cloud

<div class="grid grid-cols-2 gap-8">

<div>

## ☁️ Open-source cloud platform
### 400,000+ deployments worldwide

<br>

| Feature | Description |
|---------|-------------|
| 📁 Files | Sync & share |
| 📅 Calendar | Manage schedule |
| 👥 Contacts | Address book |
| 📝 Notes | Markdown notes |
| 🔌 200+ Apps | Extend it |

</div>

<div class="flex items-center justify-center">
<!-- Add Nextcloud logo/screenshot here -->
 <img src="/nextcloud-logo.png" class="w-80" />

</div>

</div>

<br>

---

# Pre-Configured & Ready

<div class="grid grid-cols-2 gap-8">

<div>

## Zero Configuration Required:

<v-clicks>

1. Connect ethernet & power
2. Boot your device
3. Wait 5 minutes for first-boot setup
4. Visit `https://nixtcloud.local`
5. Login: `admin` / `admin`
6. Change your password

</v-clicks>

<br>

<v-click>

<div class="text-green-400 text-sm">

- ✅ HTTPS enabled by default
- ✅ Database pre-configured
- ✅ Cron jobs scheduled
- ✅ External storage ready (NTFS supported 😉)

</div>

</v-click>

</div>
<v-click>
<div class="text-white opacity-100 text-xs">

```nix
services.nextcloud = {
  enable = true;
  package = pkgs.nextcloud32;
  hostName = name;
  database.createLocally = true;
  config = {
    dbtype = "sqlite";
    adminuser = "admin";
    adminpassFile = "/etc/nixos/adminpass.txt";
  };
  settings = {
    trusted_domains = [
      "localhost" 
      "${name}.local" 
      "192.168.*.*"
    ];
    default_phone_region = "GR";
    log_type = "file";
    loglevel = 4;
    maintenance_window_start = 1;
    quota_include_external_storage = true;
    overwriteprotocol = "https";
    overwritecondaddr = "^192\\.168\\..*$";
  };
};
```

</div>
</v-click>
</div>

---

# Remote acces???

---
layout: section
---

# Pillar 3

## Holesail — The Magic

---

# The Connectivity Problem

## How do you access your home server from outside?

```
YOUR DEVICE
     │
     ▼
┌─────────┐
│   NAT   │ ← Your router's firewall
└────┬────┘
     │
     ▼
┌─────────┐
│   ISP   │ ← Often blocks incoming ports/CGNAT
└────┬────┘
     │
     ▼
THE INTERNET   → Good luck getting in!
```

<v-clicks>

- **Port forwarding?** Router settings vary wildly.
- **Dynamic DNS?** Your IP changes constantly. 
- **VPN services?** Another subscription, another company.

</v-clicks>

---

# Enter Holesail

<div class="flex justify-center mb-8">
  <img src="/holesail-logo.png" class="h-32" />
</div>

<div class="text-center">

## "Peer-to-peer tunnels for everyone"

</div>

<br>

<div class="grid grid-cols-2 gap-8">

<div>

<v-clicks>

- ✅ No port forwarding
- ✅ No dynamic DNS
- ✅ No central server
- ✅ No account required
- ✅ End-to-end encrypted

</v-clicks>

</div>

<div>

<v-click>

### Just a CONNECTION STRING:

<div class="text-sm">

```bash
$ npm install -g holesail

$ holesail --live 80

```
```
Key: hs://s0003a3d2c1774c336e2c18828662b7b7c66

```

</div>

<br>

**Share the string → Connect from anywhere**

</v-click>

</div>

</div>

---

# Built on Pear Runtime

<div class="grid grid-cols-2 gap-8">

<div class="flex flex-col items-center justify-center">

<img src="/pear-logo.png" class="h-64 mb-4" />

<div class="text-center text-sm text-gray-400">
Pear Runtime - P2P application platform by Holepunch.to
</div>

</div>

<div class="flex flex-col items-center justify-center">

<img src="/keet-logo.png" class="h-48 mb-4" />

<div class="text-center">

### Keet - P2P Chat

- Encrypted chat & video
- No servers, no tracking
- Built on Pear, like Holesail

</div>

</div>

</div>

---

# Holesail-nix: My Contribution

<div class="grid grid-cols-2 gap-8">

<div>

### github.com/jjacke13/holesail-nix ⭐ 4

**MIT License**

<br>

### NixOS Modules:

| Module | Purpose |
|--------|---------|
| `holesail-server` | Expose local ports |
| `holesail-client` | Connect to remote |
| `holesail-filemanager` | Web file share |

</div>

<div>

```nix
services.holesail-server.mycloud = {
  enable = true;
  port = 80;
  key-file = "/var/lib/key.txt";
};
```

<br>

<div class="text-xl text-center text-purple-400 font-bold">
Declarative P2P. The Nix way.
</div>

</div>
</div>

---

# QR-Based Access

<div class="grid grid-cols-2 gap-8">

<div>

### In your Nextcloud, Nixtcloud creates:

<br>

**📄 remote.txt**
```
hs://s000abc123def456ghi789jkl012mno...
```

<br>

**🖼️ remote.jpg**

<!-- Add actual QR image here -->
<div class="text-6xl text-center">📱</div>

</div>

<div>

<v-clicks>

### How to use:

1. **At home:** Scan the QR / save the hs:// link

2. **Traveling:** Open Holesail app

3. **Scan/paste the link**

4. **Connect:** Access your cloud instantly

</v-clicks>

</div>

</div>

---

# Privacy by Design

<div class="grid grid-cols-2 gap-8">

<div>

<v-clicks>

## 🔐 END-TO-END ENCRYPTION
Your traffic is encrypted before it leaves your device

## 🚫 NO CENTRAL SERVER
No company sees your connection. No metadata harvesting.

</v-clicks>

</div>

<div>

<v-clicks>

## 📝 NO ACCOUNT REQUIRED
No email signup. No identity verification. No tracking.

## 🔓 OPEN SOURCE
Audit the code yourself. Trust through transparency.

</v-clicks>

</div>

</div>

<br>

<v-click>

<div class="text-center text-2xl text-green-400 font-bold">
TRUE peer-to-peer. YOUR data. YOUR rules.
</div>

</v-click>

---
layout: section
---

# Why Nixtcloud is Special

---

# Self-Healing System

<div class="grid grid-cols-3 gap-4">

<div class="p-4 bg-gray-800 rounded-lg">

### 🔄 Daily
- Scheduled health checks
- Automatic reboot (configurable)

</div>

<div class="p-4 bg-gray-800 rounded-lg">

### 📅 Weekly
- If Repository updates → System updates applied

</div>

<div class="p-4 bg-gray-800 rounded-lg">

### ⚡ On-Demand
- Delete `reboot.txt` → Reboot
- Delete `remote.txt` → New P2P key

</div>

</div>

<br>

<v-click>

### Always:
- ✅ USB drives auto-mount (30 sec delay)
- ✅ Services auto-restart on failure

</v-click>

<v-click>

<div class="text-center text-2xl text-cyan-400 font-bold mt-8">
Set it and forget it. It just works.
</div>

</v-click>

---

# Supported Hardware

<div class="grid grid-cols-3 gap-4">

<div class="p-4 bg-gray-800 rounded-lg text-center">

## 🥧 Raspberry Pi 4

- 2GB / 4GB / 8GB RAM
- Widely available

<div class="text-2xl text-green-400 font-bold mt-4">~€50-80</div>

</div>

<div class="p-4 bg-gray-800 rounded-lg text-center">

## 🥧 Raspberry Pi 5

- 2GB / 4GB / 8GB RAM
- Faster performance

<div class="text-2xl text-green-400 font-bold mt-4">~€60-90</div>

</div>
<v-click>
<div class="p-4 bg-orange-900 rounded-lg text-center">

## 🍊 NanoPi NEO3

- 2GB RAM
- Gigabit Ethernet
- Ultra-compact
- **Custom kernel**

<div class="text-2xl text-green-400 font-bold mt-4">~€30-40</div>

</div>
</v-click>
</div>

---

# NanoPi NEO3: The Challenge

<div class="grid grid-cols-2 gap-8">

<div>

<!-- Add your photo of NanoPi NEO3 here -->
<!-- <img src="/nanopi-neo3.jpg" class="rounded-lg" /> -->

<div class="text-center text-8xl">🍊</div>

### Specs:
- **SoC:** Rockchip RK3328
- **CPU:** Quad-core ARM Cortex-A53
- **RAM:** 2GB DDR4
- **Network:** Gigabit Ethernet

</div>

<div>

### The Problem:
- Stock kernel too large
- Long build times
- Bloated image size

<br>

### The Solution: (NixOS 😉)
<v-clicks>

- ✅ Custom minimal kernel
- ✅ Device tree configuration
- ✅ U-Boot optimization

</v-clicks>

</div>

</div>

---

# Custom Minimal Kernel

## Linux Kernel 6.18.3 — Compiled for NanoPi NEO3

<br>

| Aspect | Standard | Minimal |
|--------|----------|---------|
| Drivers | All | Essential only |
| Filesystems | All | ext4, FAT, NTFS |
| Network stacks | All | TCP/IP, basics |
| Debug features | Included | Stripped |
| **Build time** | ~45 min | **~15 min** |
| **Image size** | ~4.5 GB | **~2.7 GB** |

<br>

<v-click>

<div class="text-center text-xl text-cyan-400 font-bold">
Faster builds, smaller images, same functionality.
</div>

</v-click>

---
layout: center
class: text-center
---

# 🎬 DEMO TIME

<div class="text-2xl mt-8">

Let's see Nixtcloud in action

</div>

<br>

<div class="grid grid-cols-2 gap-8 mt-8">

<div class="p-4 bg-gray-800 rounded-lg">

## 💻 Laptop
Local access

</div>

<div class="p-4 bg-gray-800 rounded-lg">

## 📱 Mobile
Remote P2P access

</div>

</div>

---

# Get Involved

<div class="grid grid-cols-2 gap-8">

<div>

## ⭐ Star the Repos

| Repository | Stars |
|------------|-------|
| jjacke13/nixtcloud | ⭐ 18 |
| jjacke13/holesail-nix | ⭐ 4 |

<br>

## 🔧 Try It

Download → Flash → Boot → Learn

</div>

<div>

## 🤝 Contribute

- Report issues
- Submit pull requests
- Spread the word

<br>

## 📢 Previous Talks

- FOSSCOMM 2024
- FOSSCOMM 2025
- Greek NOG

</div>

</div>

---
layout: center
class: text-center
---

# Thank You

---
layout: center
class: text-center
---

# Questions?

<div class="text-3xl mt-8">

github.com/jjacke13/nixtcloud

</div>

<br>

<div class="flex gap-8 justify-center mt-8">

<div class="p-4 bg-gray-800 rounded-lg">⭐ Star it</div>
<div class="p-4 bg-gray-800 rounded-lg">🍴 Fork it</div>
<div class="p-4 bg-gray-800 rounded-lg">🤝 Contribute</div>

</div>
