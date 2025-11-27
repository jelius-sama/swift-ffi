```bash
# -resource-dir "$(SDK_ROOT)/usr/lib/swift_static" \

sudo mkdir -p /usr/local/swift/usr/lib/swift_static/linux-static

sudo cp $SWIFT_STATIC_SDK/usr/lib/swift_static/linux-static/*.lnk /usr/local/swift/usr/lib/swift_static/linux-static/

sudo cp -r  $SWIFT_STATIC_SDK/usr/lib/swift_static/linux-static/* \
            /usr/local/swift/usr/lib/swift_static/linux-static/

swiftc \
  -target x86_64-swift-linux-musl \
  -sdk "$SWIFT_STATIC_SDK" \
  -static-stdlib \
  -static-executable \
  main.swift \
  -o swift_only
```
