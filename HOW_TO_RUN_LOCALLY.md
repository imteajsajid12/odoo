# 🚀 HOW TO RUN ODOO LOCALLY - Complete Guide

## ✅ **Senior Software Engineer - Setup Complete**

All configuration files have been created and tested. Your Odoo project is ready to run!

---

## 📋 **QUICK START (3 Simple Steps)**

### **Method 1: Using Startup Script (Easiest)**

```bash
# Step 1: Navigate to project directory
cd /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo

# Step 2: Run the startup script
./start_odoo.sh

# Step 3: Open browser
open http://localhost:8069
```

### **Method 2: Using Config File Directly**

```bash
# Step 1: Navigate to project directory
cd /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo

# Step 2: Start Odoo with config file
./odoo-venv/bin/python3 odoo-bin -c odoo.conf

# Step 3: Open browser
open http://localhost:8069
```

---

## 📁 **FILES CREATED**

| File | Purpose | Status |
|------|---------|--------|
| `odoo.conf` | Main configuration file | ✅ Created & Tested |
| `start_odoo.sh` | Startup script with checks | ✅ Created & Executable |
| `LOCAL_DEVELOPMENT_GUIDE.md` | Detailed development guide | ✅ Created |
| `HOW_TO_RUN_LOCALLY.md` | This file | ✅ Created |

---

## 🔧 **CONFIGURATION DETAILS**

### **odoo.conf Settings:**

```ini
Database Name:     odoo_test_db
Database Host:     localhost
Database Port:     5432
Database User:     luminous_imteaj
HTTP Port:         8069
Longpolling Port:  8072
Addons Path:       addons,custom_addons
Admin Password:    admin
Log File:          /tmp/odoo.log
Log Level:         info
Workers:           0 (development mode)
```

---

## 🎯 **STEP-BY-STEP GUIDE**

### **First Time Setup:**

```bash
# 1. Open Terminal
# Press Cmd+Space, type "Terminal", press Enter

# 2. Navigate to Odoo directory
cd /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo

# 3. Verify files exist
ls -la odoo.conf start_odoo.sh

# 4. Make startup script executable (if not already)
chmod +x start_odoo.sh

# 5. Start Odoo
./start_odoo.sh
```

### **What You'll See:**

```
============================================
   ODOO 19.0 LOCAL DEVELOPMENT SERVER
============================================

✅ Pre-flight checks passed

Configuration:
  Database: odoo_test_db
  Port: 8069
  Addons: addons,custom_addons
  Log: /tmp/odoo.log

Starting Odoo server...

2025-11-19 11:00:00,000 INFO odoo: Odoo version 19.0
2025-11-19 11:00:00,000 INFO odoo: database: luminous_imteaj@localhost:5432
2025-11-19 11:00:00,000 INFO odoo: HTTP service (werkzeug) running on 0.0.0.0:8069
```

### **Access Odoo:**

Open your browser and go to:
- **Main Interface:** http://localhost:8069
- **Apps Page:** http://localhost:8069/odoo/apps
- **Database Manager:** http://localhost:8069/web/database/manager

---

## 🔍 **VERIFY EVERYTHING IS WORKING**

### **Check 1: Config File**

```bash
cat odoo.conf | head -20
```

**Expected:** Should show configuration settings

### **Check 2: Database**

```bash
psql -U luminous_imteaj -l | grep odoo_test_db
```

**Expected:** `odoo_test_db | luminous_imteaj | UTF8`

### **Check 3: Server Running**

```bash
ps aux | grep odoo-bin | grep -v grep
```

**Expected:** Should show Python process running odoo-bin

### **Check 4: Port Open**

```bash
lsof -i :8069
```

**Expected:** Should show Python listening on port 8069

### **Check 5: Logs**

```bash
tail -f /tmp/odoo.log
```

**Expected:** Should show Odoo log messages

---

## 🛠️ **COMMON COMMANDS**

### **Start Odoo:**

```bash
# Using startup script
./start_odoo.sh

# Using config file directly
./odoo-venv/bin/python3 odoo-bin -c odoo.conf

# With development mode (auto-reload)
./odoo-venv/bin/python3 odoo-bin -c odoo.conf --dev=all
```

### **Stop Odoo:**

```bash
# Press Ctrl+C in the terminal where Odoo is running

# Or kill the process
ps aux | grep odoo-bin | grep -v grep | awk '{print $2}' | xargs kill
```

### **Restart Odoo:**

```bash
# Stop (Ctrl+C), then start again
./start_odoo.sh
```

### **View Logs:**

```bash
# Real-time log viewing
tail -f /tmp/odoo.log

# Last 50 lines
tail -50 /tmp/odoo.log

# Search logs
grep ERROR /tmp/odoo.log
```

### **Update Module:**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf -u event_country_field --stop-after-init
```

### **Install Module:**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf -i event_country_field --stop-after-init
```

---

## 🐛 **TROUBLESHOOTING**

### **Problem 1: Port 8069 Already in Use**

```bash
# Find what's using the port
lsof -i :8069

# Kill it
lsof -ti:8069 | xargs kill -9

# Or use the startup script (it handles this automatically)
./start_odoo.sh
```

### **Problem 2: PostgreSQL Not Running**

```bash
# Check if PostgreSQL is running
brew services list | grep postgresql

# Start PostgreSQL
brew services start postgresql@14

# Verify it's running
psql -U luminous_imteaj -l
```

### **Problem 3: Config File Not Found**

```bash
# Verify you're in the right directory
pwd
# Should show: /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo

# Check if config file exists
ls -la odoo.conf

# If not, you're in the wrong directory
cd /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo
```

### **Problem 4: Permission Denied**

```bash
# Make startup script executable
chmod +x start_odoo.sh

# Fix data directory permissions
mkdir -p /Users/luminous_imteaj/.local/share/Odoo
chmod 755 /Users/luminous_imteaj/.local/share/Odoo
```

### **Problem 5: Module Not Found**

```bash
# Verify module exists
ls -la custom_addons/event_country_field/

# Check addons path in config
cat odoo.conf | grep addons_path
# Should show: addons_path = addons,custom_addons
```

---

## 📊 **PROJECT STRUCTURE**

```
/Users/luminous_imteaj/Documents/officeWork/Odoo/odoo/
│
├── 📄 odoo.conf                          ← ✅ Configuration file
├── 📄 start_odoo.sh                      ← ✅ Startup script
├── 📄 odoo-bin                           ← Main executable
│
├── 📁 odoo-venv/                         ← Python virtual environment
│   └── bin/python3                       ← Python interpreter
│
├── 📁 addons/                            ← Official Odoo modules
│   ├── base/
│   ├── web/
│   └── ... (1000+ modules)
│
├── 📁 custom_addons/                     ← Your custom modules
│   └── event_country_field/              ← ✅ Your Event Country module
│       ├── __manifest__.py
│       ├── models/
│       ├── views/
│       ├── data/
│       └── security/
│
├── 📁 odoo/                              ← Odoo core
│
└── 📄 /tmp/odoo.log                      ← Log file
```

---

## ✅ **VERIFICATION CHECKLIST**

Before running, verify:

- [x] ✅ Config file exists: `odoo.conf`
- [x] ✅ Startup script exists: `start_odoo.sh`
- [x] ✅ Startup script is executable
- [x] ✅ Database exists: `odoo_test_db`
- [x] ✅ PostgreSQL is running
- [x] ✅ Virtual environment exists: `odoo-venv/`
- [x] ✅ Custom module exists: `custom_addons/event_country_field/`
- [x] ✅ Port 8069 is available

---

## 🎉 **SUMMARY**

**Configuration:** ✅ Complete and tested

**Startup Methods:**
1. ✅ `./start_odoo.sh` (Recommended - includes checks)
2. ✅ `./odoo-venv/bin/python3 odoo-bin -c odoo.conf` (Direct)

**Access URL:** http://localhost:8069

**Log File:** /tmp/odoo.log

**Status:** ✅ Ready to run!

---

## 📚 **ADDITIONAL RESOURCES**

- **LOCAL_DEVELOPMENT_GUIDE.md** - Detailed development workflow
- **ODOO_CONFIGURATION_GUIDE.md** - Configuration reference
- **QUICK_CONFIG_REFERENCE.md** - Quick reference card
- **CREATE_CONFIG_FILE_GUIDE.md** - Config file details

---

## 🚀 **NEXT STEPS**

1. **Start Odoo:** Run `./start_odoo.sh`
2. **Open Browser:** Go to http://localhost:8069
3. **Install Module:** Search for "Event Country Field" and click Install
4. **Start Developing:** Make changes to your module
5. **View Logs:** Run `tail -f /tmp/odoo.log` in another terminal

---

**Everything is ready! Start developing!** 🎉

