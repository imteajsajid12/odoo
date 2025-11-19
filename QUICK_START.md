# ⚡ ODOO - QUICK START GUIDE

## 🚀 **START ODOO IN 3 STEPS**

```bash
# Step 1: Navigate to project
cd /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo

# Step 2: Run startup script
./start_odoo.sh

# Step 3: Open browser
open http://localhost:8069
```

**That's it!** 🎉

---

## 📋 **WHAT WAS CREATED**

```
✅ odoo.conf           - Configuration file
✅ start_odoo.sh       - Startup script
✅ 6 Documentation     - Complete guides
```

---

## 🔧 **CONFIGURATION**

```ini
Database:     odoo_test_db
Port:         8069
Addons:       addons,custom_addons
Logs:         /tmp/odoo.log
```

---

## 🎯 **COMMON COMMANDS**

### **Start:**
```bash
./start_odoo.sh
```

### **Stop:**
```bash
Ctrl+C
```

### **View Logs:**
```bash
tail -f /tmp/odoo.log
```

### **Update Module:**
```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf -u event_country_field --stop-after-init
```

---

## 🌐 **ACCESS URLS**

- **Web:** http://localhost:8069
- **Apps:** http://localhost:8069/odoo/apps
- **DB Manager:** http://localhost:8069/web/database/manager

---

## 📚 **DOCUMENTATION**

| File | Purpose |
|------|---------|
| `HOW_TO_RUN_LOCALLY.md` | Complete setup guide |
| `LOCAL_DEVELOPMENT_GUIDE.md` | Development workflow |
| `SETUP_COMPLETE_SUMMARY.md` | Setup summary |
| `QUICK_CONFIG_REFERENCE.md` | Quick reference |

---

## 🐛 **TROUBLESHOOTING**

### **Port in use?**
```bash
lsof -ti:8069 | xargs kill -9
./start_odoo.sh
```

### **PostgreSQL not running?**
```bash
brew services start postgresql@14
```

### **Can't find config?**
```bash
cd /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo
ls -la odoo.conf
```

---

## ✅ **STATUS**

```
Configuration:  ✅ Complete
Testing:        ✅ Verified
Documentation:  ✅ Complete
Ready:          ✅ YES!
```

---

## 🎉 **YOU'RE READY!**

**Just run:** `./start_odoo.sh`

**Then open:** http://localhost:8069

**Happy coding!** 🚀

