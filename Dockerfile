# We use the correct image with double 'r'
FROM dockurr/windows:latest

# 1. YOUR CUSTOM ISO SOURCE
# The container will download the ISO from your PC via this tunnel link.
ENV VERSION="https://numeric-officers-latex-falling.trycloudflare.com/WIN10.PRO.AIO.U32-2.X64.(WPE).ISO"

# 2. FORCE SOFTWARE MODE (The "Render Fix")
# Render does not allow hardware virtualization (KVM).
# We set this to "N" to force QEMU TCG (Software Emulation).
# Without this, the container will crash immediately.
ENV KVM="N"

# 3. MAXIMIZE RESOURCES (For Render 16GB Plan)
# We allocate 14GB to Windows, leaving ~2GB for Docker overhead.
ENV RAM_SIZE="14G"
ENV CPU_CORES="4"

# 4. PERSISTENT STORAGE
# This saves the C: drive to your Render Disk so data survives restarts.
ENV STORAGE="/storage"
ENV DISK_SIZE="64G"

# 5. MANUAL INSTALLATION MODE
# Custom ISOs often have unique installers that confuse the auto-bot.
# This forces the VNC screen to open immediately so YOU can click "Next".
ENV MANUAL="Y"

# 6. PORT CONFIGURATION
EXPOSE 8006
