# TN-DRUGADDICTION

## 🚀 FiveM QBCore Script - Drug Addiction System

**TN-DRUGADDICTION** is an old FiveM script designed for **QBCore Framework** that introduces drug addiction mechanics into the game. While it may have some **bugs or outdated code**, you're welcome to use and modify it as needed!

## ⚡ Features
- **Drug Addiction System** for roleplay immersion
- **Different Drugs Supported:**
  - 🥤 **Coke** - `{ name = 'coke', label = 'Coke' }`
  - 🧪 **Methamine** - `{ name = 'methamine', label = 'Methamine' }`
  - 🚬 **Weed Joint** - `{ name = 'weed_joint', label = 'Weed Joint' }`
- **Usable Items** that trigger different effects
- **Easily Expandable** for more drugs and mechanics

## ❗ Status
This script is **old and may need updates**, but it still works with some adjustments. Feel free to improve it!

## 📦 Installation
### 1️⃣ Prerequisites
- **FiveM Server** running **QBCore Framework**

### 2️⃣ Installation Steps
```sh
git clone https://github.com/yourgithub/TN-DRUGADDICTION.git
mv TN-DRUGADDICTION /path/to/your/fivem/resources/
open qbcore/server/player.lua under ligne  112
add those lignes
PlayerData.metadata['methaddiction'] = PlayerData.metadata['methaddiction'] or 100
PlayerData.metadata['cokeaddiction'] = PlayerData.metadata['cokeaddiction'] or 100
PlayerData.metadata['weedaddiction'] = PlayerData.metadata['weedaddiction'] or 100
open qbcore/shared/items 
add those items
    coke                          = { name = 'coke', label = 'Coke', weight = 0, type = 'item', image = 'coke.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy real quick' },
    methamine                     = { name = 'methamine', label = 'Methamine', weight = 0, type = 'item', image = 'methamine.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy real quick' },
    weed_joint                    = { name = 'weed_joint', label = 'Weed Joint', weight = 0, type = 'item', image = 'weed_joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy real quick' },
echo "ensure TN-DRUGADDICTION" >> server.cfg
```
Restart your server.

## 🔧 Configuration
- Open `config.lua` to modify drug effects and settings.
- Add new drugs by updating the items list.

## 🛠️ Known Issues
- Some **bugs** may exist due to outdated code.
- Compatibility with newer **QBCore versions** may require fixes.

## 📢 Contributing
Want to help improve **TN-DRUGADDICTION**? Contributions are welcome! Fork the repo, make changes, and submit a pull request.

## 📜 License
This project is open-source. Feel free to use, modify, and improve it!

Enjoy bringing **realistic drug addiction mechanics** to your FiveM server! 🚬💊
