# flutter-pi-toolchain

A universal toolchain to build, deploy, and run **Flutter ARM64 apps for Raspberry Pi** on any x86 Ubuntu machine using Docker + QEMU.

---

## 🚀 Features

- Build Linux ARM64 Flutter apps on x86 PCs  
- Zero Flutter installation required on host  
- Works on all Pis (Zero2, 3, 4, 5)  
- Clean CLI:

flutter-pi build
flutter-pi deploy --ip 192.168.1.10 --path /home/pi/app
flutter-pi run --ip 192.168.1.10 --path /home/pi/app
flutter-pi build-deploy --ip ... --path ...

yaml
Copy code

---

## 🛠 Installation

git clone <your-repo-url>
cd flutter-pi-toolchain
./install.sh

yaml
Copy code

Logout & login once (Docker requirement).

---

## 📦 Usage

### Build
flutter-pi build

shell
Copy code

### Deploy
flutter-pi deploy --ip 192.168.1.50 --path /home/pi/app

shell
Copy code

### Run
flutter-pi run --ip 192.168.1.50 --path /home/pi/app

shell
Copy code

### Build + Deploy
flutter-pi build-deploy --ip 192.168.1.50 --path /home/pi/app

yaml
Copy code

---

## 📁 Built Files

Located in:
build/linux/arm64/release/bundle/

yaml
Copy code

Copying this folder to the Pi is enough to run the app.

---

## 🔑 Setup Tip (Recommended)
To avoid typing your password multiple times, copy your SSH key to the Pi:

```bash
ssh-copy-id pi@192.168.1.XX

---

## 🧩 Requirements
- Ubuntu 22/23/24
- Docker
- SSH access to Raspberry Pi

---

## 🧸 Author
huhFahad
