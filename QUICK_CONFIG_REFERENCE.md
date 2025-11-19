# ⚡ ODOO CONFIGURATION - Quick Reference Card

## 🎯 **YOUR CURRENT SETUP AT A GLANCE**

```
┌─────────────────────────────────────────────────────────────┐
│                  ODOO 19.0 CONFIGURATION                    │
├─────────────────────────────────────────────────────────────┤
│ Config File:     ❌ NONE (using command-line only)         │
│ Database:        ✅ odoo_test_db                           │
│ DB Host:         ✅ localhost                              │
│ DB Port:         ✅ 5432                                   │
│ DB User:         ✅ luminous_imteaj                        │
│ HTTP Port:       ✅ 8069                                   │
│ Addons Path:     ✅ addons,custom_addons                   │
│ Running:         ✅ Yes (PID: 55330, Terminal 49)          │
└─────────────────────────────────────────────────────────────┘
```

---

## 📍 **WHERE IS EVERYTHING?**

### **1. Config File Locations**

| Location | Path | Status |
|----------|------|--------|
| **User Config** | `~/.odoorc` | ❌ Not found |
| **Project Config** | `./odoo.conf` | ❌ Not found |
| **Sample Config** | `./debian/odoo.conf` | ✅ Exists (not used) |
| **Legacy Config** | `~/.openerp_serverrc` | ❌ Not found |

**Current:** You're NOT using any config file!

---

### **2. Database Location**

```
PostgreSQL Database: odoo_test_db
Location: /usr/local/var/postgresql@14/
Socket: /tmp/.s.PGSQL.5432
Owner: luminous_imteaj
Encoding: UTF8
```

**How to access:**
```bash
psql -U luminous_imteaj -d odoo_test_db
```

---

### **3. Port Configuration**

```
HTTP Port:        8069  (Web interface)
Longpolling Port: 8072  (Real-time updates)
Database Port:    5432  (PostgreSQL)
```

**Access URLs:**
- Web: http://localhost:8069
- Apps: http://localhost:8069/odoo/apps
- DB Manager: http://localhost:8069/web/database/manager

---

### **4. Addons Directories**

```
📁 /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo/
├── 📁 addons/              ← Official Odoo modules
└── 📁 custom_addons/       ← Your custom modules
    └── 📁 event_country_field/  ← Your Event Country module
```

---

## 🔧 **HOW TO SET CONFIGURATION**

### **Method 1: Command Line (Current)**

```bash
./odoo-venv/bin/python3 odoo-bin \
  --addons-path=addons,custom_addons \
  -d odoo_test_db \
  --http-port=8069
```

**Pros:** ✅ Quick, flexible
**Cons:** ❌ Must type every time, hard to manage

---

### **Method 2: Config File (Recommended)**

**Step 1: Create odoo.conf**
```bash
cat > odoo.conf << 'EOF'
[options]
db_host = localhost
db_port = 5432
db_user = luminous_imteaj
db_name = odoo_test_db
http_port = 8069
addons_path = addons,custom_addons
admin_passwd = admin
logfile = /tmp/odoo.log
log_level = info
EOF
```

**Step 2: Run with config**
```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf
```

**Pros:** ✅ Professional, easy to manage, version control
**Cons:** ❌ One extra step to create

---

## 📊 **CONFIGURATION PARAMETERS**

### **Database Parameters**

| Parameter | Current Value | Command Line | Config File |
|-----------|---------------|--------------|-------------|
| Database Name | `odoo_test_db` | `-d odoo_test_db` | `db_name = odoo_test_db` |
| DB Host | `localhost` | `--db_host=localhost` | `db_host = localhost` |
| DB Port | `5432` | `--db_port=5432` | `db_port = 5432` |
| DB User | `luminous_imteaj` | `--db_user=luminous_imteaj` | `db_user = luminous_imteaj` |
| DB Password | None | `--db_password=pass` | `db_password = pass` |

---

### **Server Parameters**

| Parameter | Current Value | Command Line | Config File |
|-----------|---------------|--------------|-------------|
| HTTP Port | `8069` | `--http-port=8069` | `http_port = 8069` |
| Longpolling | `8072` | `--longpolling-port=8072` | `longpolling_port = 8072` |
| Workers | `0` | `--workers=0` | `workers = 0` |

---

### **Path Parameters**

| Parameter | Current Value | Command Line | Config File |
|-----------|---------------|--------------|-------------|
| Addons Path | `addons,custom_addons` | `--addons-path=addons,custom_addons` | `addons_path = addons,custom_addons` |
| Data Dir | Default | `--data-dir=/path` | `data_dir = /path` |
| Log File | None | `--logfile=/tmp/odoo.log` | `logfile = /tmp/odoo.log` |

---

## 🚀 **COMMON COMMANDS**

### **Start Odoo**
```bash
# With command line
./odoo-venv/bin/python3 odoo-bin --addons-path=addons,custom_addons -d odoo_test_db --http-port=8069

# With config file
./odoo-venv/bin/python3 odoo-bin -c odoo.conf
```

### **Change Database**
```bash
# Command line
./odoo-venv/bin/python3 odoo-bin -d another_database --http-port=8069

# With config file (override)
./odoo-venv/bin/python3 odoo-bin -c odoo.conf -d another_database
```

### **Change Port**
```bash
# Command line
./odoo-venv/bin/python3 odoo-bin -d odoo_test_db --http-port=8070

# With config file (override)
./odoo-venv/bin/python3 odoo-bin -c odoo.conf --http-port=8070
```

### **Generate Config File**
```bash
./odoo-venv/bin/python3 odoo-bin --save --stop-after-init \
  --addons-path=addons,custom_addons \
  -d odoo_test_db \
  --http-port=8069
```

---

## 🔍 **CHECK CURRENT CONFIGURATION**

### **View Running Process**
```bash
ps aux | grep odoo-bin | grep -v grep
```

**Output:**
```
luminous_imteaj  55330  ... odoo-bin --addons-path=addons,custom_addons -d odoo_test_db --http-port=8069
```

### **List Databases**
```bash
psql -U luminous_imteaj -l | grep odoo
```

**Output:**
```
odoo_test_db | luminous_imteaj | UTF8
```

### **Check Port**
```bash
lsof -i :8069
```

**Output:**
```
Python  55330 luminous_imteaj   ... TCP *:8069 (LISTEN)
```

---

## 📋 **SAMPLE CONFIG FILE**

**Location:** `./debian/odoo.conf`

```ini
[options]
; This is the password that allows database operations:
; admin_passwd = admin
db_host = False
db_port = False
db_user = odoo
db_password = False
;addons_path = /usr/lib/python3/dist-packages/odoo/addons
default_productivity_apps = True
```

---

## ✅ **RECOMMENDED CONFIG FILE FOR YOU**

**Create:** `./odoo.conf`

```ini
[options]
# Database
db_host = localhost
db_port = 5432
db_user = luminous_imteaj
db_name = odoo_test_db

# Server
http_port = 8069
longpolling_port = 8072

# Addons
addons_path = addons,custom_addons

# Admin
admin_passwd = admin

# Logging
logfile = /tmp/odoo.log
log_level = info

# Performance
workers = 0
max_cron_threads = 2

# Security
list_db = True
```

---

## 🎯 **QUICK SUMMARY**

```
┌──────────────────────────────────────────────────────────┐
│ CURRENT SETUP                                            │
├──────────────────────────────────────────────────────────┤
│ ❌ No config file (using command-line parameters)       │
│ ✅ Database: odoo_test_db on localhost:5432             │
│ ✅ HTTP Server: localhost:8069                          │
│ ✅ Addons: addons/ + custom_addons/                     │
│ ✅ Running: Terminal 49, PID 55330                      │
├──────────────────────────────────────────────────────────┤
│ RECOMMENDATION                                           │
├──────────────────────────────────────────────────────────┤
│ ✅ Create odoo.conf file                                │
│ ✅ Store all settings in one place                      │
│ ✅ Use: ./odoo-venv/bin/python3 odoo-bin -c odoo.conf   │
└──────────────────────────────────────────────────────────┘
```

---

**Access your Odoo:** http://localhost:8069 🚀

