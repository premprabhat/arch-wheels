if [ -n "$IS_OSX" ]; then
    # Only x86_64 by default
    ARCH_FLAGS=${ARCH_FLAGS:-"-arch x86_64"}
fi