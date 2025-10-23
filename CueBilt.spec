# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['main.py'],
    pathex=[],
    binaries=[],
    datas=[('./scripts', './scripts')],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='CueBilt',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=['cuebilt.icns'],
)
coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='CueBilt',
)
app = BUNDLE(
    coll,
    name='CueBilt.app',
    icon='cuebilt.icns',
    bundle_identifier='com.tbsounddesigns.cuebilt',
    info_plist= {
        'CFBundleShortVersionString': '1.1.0',  # Your app version
        'CFBundleVersion': '1.1.0',             # Build version (can be same as short version)
        'NSHumanReadableCopyright': '© 2025 Tyler A. Berg (tbsounddesigns.com)', # Optional: Copyright info
    }
)
