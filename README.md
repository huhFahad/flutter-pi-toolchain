# flutter-pi-toolchain

A universal toolchain to build, deploy, and run **Flutter ARM64 apps for Raspberry Pi** on any x86 Ubuntu machine using Docker + QEMU.

---

## 🚀 Features

- 🏗️ **Cross-Compile:** Build Linux ARM64 Flutter apps on x86 PCs.
- 🧹 **Auto-Clean:** Automatically cleans up the host environment so local debugging (`flutter run -d linux`) works immediately after building.
- 📦 **Safe Harbor:** Saves the Pi build to a protected `pi-release/` folder.
- 🔌 **Universal:** Works on all Pis (Zero 2, 3, 4, 5).
- ⚡ **Zero Config:** No Flutter installation required on the host (uses Docker).

---

## 🛠 Installation

```bash
git clone https://github.com/huhFahad/flutter-pi-toolchain.git
cd flutter-pi-toolchain
./install.sh
```

*Note: You must logout & login once after installation to update Docker permissions.*

---

## 📦 Usage

### 1. Build
Compiles the app inside Docker, cleans up the mess, and saves the binary to `pi-release/`.
```bash
flutter-pi build
```

### 2. Deploy
Uploads the build to your Pi.
**Note:** Use the full SSH target (user@ip).
```bash
flutter-pi deploy --target pi@192.168.1.50 --path /home/pi/my_app
```

### 3. Run
Runs the app remotely on the Pi's display (auto-kills previous instances).
```bash
flutter-pi run --target pi@192.168.1.50 --path /home/pi/my_app
```

### 4. Combined Commands (Workflow Shortcuts)
Automate the whole cycle in one command:

| Command | Description |
| :--- | :--- |
| `build-deploy` | Builds locally, then uploads to Pi. |
| `deploy-run` | Uploads existing build, then runs it. |
| `build-deploy-run` | **The "Magic Button":** Builds, Deploys, and Runs instantly. |

**Example:**
```bash
flutter-pi build-deploy-run --target pi@192.168.1.50 --path /home/pi/my_app
```

---

## ⚠️ Important Note on Paths
When using the `--path` flag, **avoid using `~` (tilde) without quotes**, as your local PC will expand it to *your* home folder, not the Pi's.

**✅ Good:**
- `--path /home/pi/apps/quiz_app` (Absolute path)
- `--path '~/apps/quiz_app'` (Quoted relative path)
- `--path apps/quiz_app` (Relative to user home)

**❌ Bad:**
- `--path ~/apps/quiz_app` (This will try to create `/home/your-local-name/` on the Pi)

---

## 🔑 Setup Tip (Recommended)
To avoid typing your password every time, copy your SSH key to the Pi:

```bash
ssh-copy-id pi@192.168.1.XX
```

---

## 🧩 Requirements
- Ubuntu 22/23/24
- Docker
- SSH access to Raspberry Pi

---

## 🧸 Author
huhFahad
