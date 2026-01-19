<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://i.ibb.co/qLqknnYd/BMScripts-Header.png">
  <source media="(prefers-color-scheme: light)" srcset="https://i.ibb.co/qLqknnYd/BMScripts-Header.png">
  <img alt="Shows the BM Scripts banner" src="https://i.ibb.co/qLqknnYd/BMScripts-Header.png">
</picture>

# BM Hints – QB/QBox Information Broker System

A polished, configurable information‑broker system for FiveM.  
Players can approach NPCs, purchase information, and receive hints through multiple delivery methods such as email, text, map markers, items, and more.

Designed with modularity, UX, and server‑owner flexibility in mind.

---

## ✨ Features

- Unlimited NPC information brokers  
- Custom hint categories per NPC  
- Multiple payment types  
  - Cash  
  - Bank  
  - Item  
- Per‑hint cooldown system  
- Six delivery methods  
  - Email  
  - Item  
  - Waypoint  
  - Blip  
  - Notify (with custom duration)  
- Optional ped blips + markers  
- Fully configurable  
- Modular client/server structure  
- Optimized (0.02ms idle)

---

## 📦 Dependencies

- **QBCore (qbx_core)**
- **ox_lib**
- **ox_target**
- **qb-phone** (or any phone using qb-phone email export)

---

## 🧠 How It Works

1. Player approaches an NPC (ped).  
2. Interacts using **ox_target**.  
3. A menu opens showing available hints.  
4. Player selects a hint → payment is processed.  
5. Server checks:  
   - Payment  
   - Cooldown  
6. If approved → hint is delivered using the configured method.

---

## 🛠️ Installation

1. Drag the `bm-hints` folder into your server’s resources.
2. Add to your `server.cfg`:
```
ensure bm-hints
```

3. Configure your NPCs and hints inside `config.lua`.

---

## 🧩 Configuration Overview

Each ped entry supports:

- Model  
- Scenario  
- Coords  
- Payment  
- Blip  
- Marker  
- Hints (unlimited)

Each hint supports:

- Header  
- Subtext  
- Icon  
- Email sender/subject/message  
- Wait time  
- Cooldown  
- Delivery method + settings  

---

## 🚚 Delivery Methods

### **1. Email**
Sends a message through qb-phone.

```lua
delivery = {
    method = "email"
}
```

### **2. Text Message**
Sends a text message through qb-phone.
```lua
delivery = {
    method = "text"
}
```

### **3. Item**
Gives the player an item.
```lua
delivery = {
    method = "item",
    item = "usb_green"
}
```

### **4. Waypoint**
Marks a GPS location.
```lua
delivery = {
    method = "waypoint",
    waypoint = vec3(452.1, -973.2, 30.7)
}
```
### **5. Blip**
Adds a map blip + notifies the player.
```lua
delivery = {
    method = "blip",
    blip = {
        coords = vec3(1234.5, -1300.2, 35.0),
        sprite = 161,
        color = 1,
        scale = 1.0,
        text = "Hidden Stash"
    }
}
```
### **6. Notify**
Shows a notification with custom duration.
```lua
delivery = {
    method = "notify",
    notifyDuration = 8000,
    notifyType = "inform",
    notifyMessage = "Here's your tip."
}
```

## ⏳ Cooldowns

Each hint can have its own cooldown:

```lua
cooldown = 60000 -- 1 minute
```

## 🌍 Localization Support

BM Hints includes full multi‑language support using a simple locale system.

### **Configuring the Locale**

Set your preferred language in `config.lua`:
```lua
Config.Locale = "en"
```
> Currently the only language supported is English. Join the Discord to have your language added.
