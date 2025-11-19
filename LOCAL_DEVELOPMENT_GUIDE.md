# 🚀 ODOO LOCAL DEVELOPMENT GUIDE - Complete Setup

## ✅ **Configuration File Created Successfully**

**Location:** `/Users/luminous_imteaj/Documents/officeWork/Odoo/odoo/odoo.conf`

**Status:** ✅ Validated and ready to use!

---

## 📋 **QUICK START - Run Odoo Locally**

### **Step 1: Stop Current Server (if running)**

```bash
# Find the running Odoo process
ps aux | grep odoo-bin | grep -v grep

# Kill it (replace PID with actual process ID)
kill 55330

# Or use killall
killall -9 Python
```

### **Step 2: Start Odoo with Config File**

```bash
# Navigate to Odoo directory
cd /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo

# Start Odoo with config file
./odoo-venv/bin/python3 odoo-bin -c odoo.conf
```

### **Step 3: Access Odoo**

Open your browser and go to:
- **Main Interface:** http://localhost:8069
- **Apps Page:** http://localhost:8069/odoo/apps
- **Database Manager:** http://localhost:8069/web/database/manager

---

## 🔧 **CONFIGURATION FILE DETAILS**

### **What's Configured:**

```ini
✅ Database: odoo_test_db on localhost:5432
✅ Database User: luminous_imteaj
✅ HTTP Port: 8069
✅ Longpolling Port: 8072
✅ Addons Path: addons,custom_addons
✅ Admin Password: admin
✅ Log File: /tmp/odoo.log
✅ Log Level: info
✅ Workers: 0 (development mode)
✅ Data Directory: ~/.local/share/Odoo
```

### **Key Settings Explained:**

| Setting | Value | Purpose |
|---------|-------|---------|
| `db_name` | `odoo_test_db` | Default database to use |
| `db_user` | `luminous_imteaj` | PostgreSQL user |
| `http_port` | `8069` | Web interface port |
| `addons_path` | `addons,custom_addons` | Where to find modules |
| `admin_passwd` | `admin` | Master password for DB operations |
| `workers` | `0` | Single process (good for development) |
| `logfile` | `/tmp/odoo.log` | Where logs are saved |

---

## 🎯 **COMMON COMMANDS**

### **1. Start Odoo (Normal Mode)**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf
```

### **2. Start with Different Database**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf -d another_database
```

### **3. Start with Different Port**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf --http-port=8070
```

### **4. Start in Development Mode (Auto-reload)**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf --dev=all
```

### **5. Update Module**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf -u event_country_field
```

### **6. Install Module**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf -i event_country_field
```

### **7. Run Tests**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf --test-enable --stop-after-init
```

### **8. Create New Database**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf -d new_database --init=base --stop-after-init
```

### **9. Shell Mode (Python Console)**

```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf shell -d odoo_test_db
```

### **10. View Logs**

```bash
tail -f /tmp/odoo.log
```

---

## 📊 **PROJECT STRUCTURE**

```
/Users/luminous_imteaj/Documents/officeWork/Odoo/odoo/
├── odoo.conf                    ← ✅ Configuration file (NEW!)
├── odoo-bin                     ← Main executable
├── odoo-venv/                   ← Python virtual environment
├── addons/                      ← Official Odoo modules
├── custom_addons/               ← Your custom modules
│   └── event_country_field/     ← Your Event Country module
├── odoo/                        ← Odoo core
├── requirements.txt             ← Python dependencies
└── /tmp/odoo.log               ← Log file
```

---

## 🔍 **VERIFY SETUP**

### **Check Config File:**

```bash
cat odoo.conf | grep -E "(db_name|http_port|addons_path)"
```

**Expected Output:**
```
db_name = odoo_test_db
http_port = 8069
addons_path = addons,custom_addons
```

### **Check Database:**

```bash
psql -U luminous_imteaj -l | grep odoo
```

**Expected Output:**
```
odoo_test_db | luminous_imteaj | UTF8
```

### **Check Port:**

```bash
lsof -i :8069
```

**Expected Output:**
```
Python ... TCP *:8069 (LISTEN)
```

---

## 🚀 **STEP-BY-STEP: First Time Setup**

### **Complete Setup from Scratch:**

```bash
# 1. Navigate to project directory
cd /Users/luminous_imteaj/Documents/officeWork/Odoo/odoo

# 2. Verify config file exists
ls -la odoo.conf

# 3. Verify virtual environment
ls -la odoo-venv/

# 4. Verify database exists
psql -U luminous_imteaj -l | grep odoo_test_db

# 5. Start Odoo with config file
./odoo-venv/bin/python3 odoo-bin -c odoo.conf

# 6. Open browser
open http://localhost:8069
```

---

## 🔧 **DEVELOPMENT WORKFLOW**

### **Daily Development Routine:**

```bash
# 1. Start Odoo in development mode
./odoo-venv/bin/python3 odoo-bin -c odoo.conf --dev=all

# 2. Make changes to your module
# Edit files in custom_addons/event_country_field/

# 3. Update module (in another terminal)
./odoo-venv/bin/python3 odoo-bin -c odoo.conf -u event_country_field --stop-after-init

# 4. Restart server
# Ctrl+C to stop, then start again

# 5. Test in browser
open http://localhost:8069
```

---

## 📝 **CONFIGURATION FILE CUSTOMIZATION**

### **Enable Development Mode:**

Edit `odoo.conf` and uncomment:

```ini
dev_mode = reload,qweb,werkzeug,xml
```

### **Change Log Level to Debug:**

```ini
log_level = debug
```

### **Enable Workers (Production-like):**

```ini
workers = 4
```

### **Configure Email (Optional):**

```ini
email_from = odoo@localhost
smtp_server = localhost
smtp_port = 25
```

---

## 🎯 **TROUBLESHOOTING**

### **Problem 1: Port Already in Use**

```bash
# Find process using port 8069
lsof -i :8069

# Kill it
kill -9 <PID>

# Or change port in odoo.conf
http_port = 8070
```

### **Problem 2: Database Connection Error**

```bash
# Check PostgreSQL is running
brew services list | grep postgresql

# Start PostgreSQL if needed
brew services start postgresql@14

# Verify database exists
psql -U luminous_imteaj -l
```

### **Problem 3: Module Not Found**

```bash
# Verify addons path in odoo.conf
cat odoo.conf | grep addons_path

# Should show: addons_path = addons,custom_addons

# Verify module exists
ls -la custom_addons/event_country_field/
```

### **Problem 4: Permission Denied**

```bash
# Check file permissions
ls -la odoo.conf

# Fix if needed
chmod 644 odoo.conf

# Check data directory
mkdir -p /Users/luminous_imteaj/.local/share/Odoo
chmod 755 /Users/luminous_imteaj/.local/share/Odoo
```

---

## ✅ **VERIFICATION CHECKLIST**

Before starting development, verify:

- [x] ✅ Config file created: `odoo.conf`
- [x] ✅ Database exists: `odoo_test_db`
- [x] ✅ PostgreSQL running
- [x] ✅ Virtual environment activated
- [x] ✅ Addons path correct
- [x] ✅ Port 8069 available
- [x] ✅ Custom module exists: `event_country_field`

---

## 🎉 **SUMMARY**

**Configuration File:** ✅ Created at `odoo.conf`

**Start Command:** 
```bash
./odoo-venv/bin/python3 odoo-bin -c odoo.conf
```

**Access URL:** http://localhost:8069

**Log File:** /tmp/odoo.log

**Status:** ✅ Ready for local development!

---

**Next Step:** Start Odoo and begin developing! 🚀

