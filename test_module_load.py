#!/usr/bin/env python3
"""Test if events_clone module can be loaded by Odoo"""

import sys
import os

# Add Odoo to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

try:
    import odoo
    from odoo.modules.module import get_module_path, get_modules, initialize_sys_path
    
    # Initialize Odoo paths
    initialize_sys_path()
    
    # Set addons paths
    odoo.tools.config['addons_path'] = '/Users/luminous_imteaj/Documents/officeWork/Odoo/odoo/addons,/Users/luminous_imteaj/Documents/officeWork/Odoo/odoo/custom_addons'
    
    # Try to get the module path
    print("=" * 60)
    print("Testing events_clone module loading...")
    print("=" * 60)
    
    path = get_module_path('events_clone', display_warning=True)
    if path:
        print(f"✓ Module found at: {path}")
        
        # Check if __manifest__.py exists
        manifest_path = os.path.join(path, '__manifest__.py')
        if os.path.exists(manifest_path):
            print(f"✓ __manifest__.py exists")
            
            # Try to load the manifest
            import ast
            with open(manifest_path, 'r') as f:
                manifest_content = f.read()
                manifest = ast.literal_eval(manifest_content.split('{', 1)[1].rsplit('}', 1)[0] + '}')
                print(f"✓ Manifest loaded successfully")
                print(f"  Name: {manifest.get('name')}")
                print(f"  Version: {manifest.get('version')}")
                print(f"  Category: {manifest.get('category')}")
                print(f"  Installable: {manifest.get('installable')}")
                print(f"  Application: {manifest.get('application')}")
                print(f"  Dependencies: {manifest.get('depends')}")
        else:
            print(f"✗ __manifest__.py NOT found")
    else:
        print(f"✗ Module NOT found in addons paths")
        print(f"  Addons paths: {odoo.tools.config['addons_path']}")
        
    print("=" * 60)
    
except Exception as e:
    print(f"✗ Error: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)

