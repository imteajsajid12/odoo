#!/bin/bash

# ============================================
# ODOO 19.0 STARTUP SCRIPT
# ============================================
# Project: Odoo Local Development
# Created: 2025-11-19
# User: luminous_imteaj
# ============================================

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Project directory
PROJECT_DIR="/Users/luminous_imteaj/Documents/officeWork/Odoo/odoo"

echo -e "${BLUE}============================================${NC}"
echo -e "${BLUE}   ODOO 19.0 LOCAL DEVELOPMENT SERVER${NC}"
echo -e "${BLUE}============================================${NC}"
echo ""

# Check if we're in the right directory
if [ ! -f "odoo-bin" ]; then
    echo -e "${RED}Error: odoo-bin not found!${NC}"
    echo -e "${YELLOW}Please run this script from: $PROJECT_DIR${NC}"
    exit 1
fi

# Check if config file exists
if [ ! -f "odoo.conf" ]; then
    echo -e "${RED}Error: odoo.conf not found!${NC}"
    echo -e "${YELLOW}Please create odoo.conf first${NC}"
    exit 1
fi

# Check if virtual environment exists
if [ ! -d "odoo-venv" ]; then
    echo -e "${RED}Error: Virtual environment not found!${NC}"
    echo -e "${YELLOW}Please create virtual environment first${NC}"
    exit 1
fi

# Check if PostgreSQL is running
if ! pgrep -x "postgres" > /dev/null; then
    echo -e "${YELLOW}Warning: PostgreSQL might not be running${NC}"
    echo -e "${YELLOW}Starting PostgreSQL...${NC}"
    brew services start postgresql@14
    sleep 2
fi

# Check if port 8069 is already in use
if lsof -Pi :8069 -sTCP:LISTEN -t >/dev/null ; then
    echo -e "${YELLOW}Warning: Port 8069 is already in use${NC}"
    echo -e "${YELLOW}Killing existing process...${NC}"
    lsof -ti:8069 | xargs kill -9 2>/dev/null
    sleep 1
fi

echo -e "${GREEN}✅ Pre-flight checks passed${NC}"
echo ""
echo -e "${BLUE}Configuration:${NC}"
echo -e "  Database: ${GREEN}odoo_test_db${NC}"
echo -e "  Port: ${GREEN}8069${NC}"
echo -e "  Addons: ${GREEN}addons,custom_addons${NC}"
echo -e "  Log: ${GREEN}/tmp/odoo.log${NC}"
echo ""
echo -e "${BLUE}Starting Odoo server...${NC}"
echo ""

# Start Odoo
./odoo-venv/bin/python3 odoo-bin -c odoo.conf

# This line will only execute if Odoo stops
echo ""
echo -e "${YELLOW}Odoo server stopped${NC}"

