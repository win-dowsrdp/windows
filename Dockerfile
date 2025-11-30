FROM dockurr/windows:latest

# 1. OFFICIAL WINDOWS 10
# This tells the container to download the official ISO from Microsoft.
ENV VERSION="https://filebin.net/ziyhw5mjkgtpsv3i/WIN10.PRO.AIO.U32-2.X64.%28WPE%29.ISO"

# 2. FORCE SOFTWARE MODE (Required)
# Render does not support KVM hardware acceleration.
# We must use "N" to force the software emulator.
ENV KVM="N"

# 3. HIGH-SPEC ALLOCATION (32GB Tier)
# We give the VM 30GB RAM and 8 Cores.
# (Leaving ~2GB buffer for the container prevents crashes).
ENV RAM_SIZE="30G"
ENV CPU_CORES="8"

# 4. PERSISTENCE
# Saves your C: drive to the Render Disk so you don't lose data.
ENV STORAGE="/storage"
ENV DISK_SIZE="64G"

# 5. AUTOMATION
# Since this is the official ISO, we can let the bot install it for us.
# It will auto-click "Next", accept EULA, and create the user.
ENV ACCEPT_EULA="Y"
# 6. PORT
EXPOSE 8006
