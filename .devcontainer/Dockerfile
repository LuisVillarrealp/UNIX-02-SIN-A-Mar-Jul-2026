# Docker builds images by stacking one layer per instruction.
# Each layer is cached, so unchanged instructions are reused on the
# next build. This is why stable instructions go first and custom
# config goes last.
#
# What I understand: putting stable things first means Docker reuses
# cached layers and only rebuilds what actually changed. Which saves a 
# lot of time by avoiding the need to repeat the entire 
# configuration process every time.

# FROM specifies the base image Docker pulls to start the build.
# Every instruction below stacks on top of it. We use Kali Linux
# rolling because it is always up to date and built for security work.
#
#What I understand: it is the OS the container starts from, 
#we use Kali because it is always updated and comes ready for security and penetration testing work.
FROM kalilinux/kali-rolling:latest

# ENV declares environment variables that persist inside the container.
# Any program running inside can read them. The shell loads these on
# every new session — running "env" in the terminal lists all of them.
#
#   DEBIAN_FRONTEND=noninteractive
#     Tells apt not to ask interactive questions during install.
#     Without it the build would hang waiting for input that never comes.
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Set the language and character encoding so accents and special
#     characters display correctly in the terminal.
#
#   TERM=xterm-256color
#     Tells programs the terminal supports 256 colors so tools like
#     vim and zsh themes render with full color.
# What I understand: these are global settings that get loaded before anything runs, 
# so every program inside the container already has access 
# to them without needing to set them manually.ensuring the environment is perfectly 
# pre-configured for every task from the moment it starts. 
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# debconf-set-selections pre-loads answers to package configuration
# questions so installs never pause waiting for user input.
# Wireshark asks during install whether non-root users can capture
# packets, we answer false before the question is even asked.
# The pipe "|" sends the output of echo as stdin to debconf-set-selections.
#
# What I understand: we use the pipe "|" to send our answer 
# (like saying "false" to Wireshark) before the installer 
# even has a chance to ask. By pre-loading the answer, the 
# setup doesn't freeze waiting for a human to hit enter, 
# allowing the build to finish completely on its own.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


 
# RUN executes commands during the image build.
# All course software is installed in one single RUN block because
# every RUN creates a new image layer — fewer layers means a smaller
# and faster image.
#
#   apt-get update                 refreshes the package list
#   apt-get install                downloads and installs packages
#     -y                           answers yes to all prompts automatically
#     --no-install-recommends      installs only required packages,
#                                  skipping suggested extras to save space
#
# "&&" is the logical AND operator: the next command only runs if the
# previous one succeeded. If update fails, install never starts.
#
# The trailing "\" continues the same instruction on the next line
# for readability.
#
# Key tools installed and why:
#   gawk / sed / grep    search, filter and transform text streams
#   shellcheck           static linter that finds bugs in bash scripts
#   nmap                 widely used port and network scanner
#   tcpdump / tshark     capture and inspect network packets from the terminal
#   tor / proxychains4   route traffic through anonymous proxy chains
#   jq                   parse and query JSON from the command line
#   man-db               restores the man command so we can look up commands
#
# What I understand: We group the update, installation, and 
# cleanup into one single step. This helps Docker keeping the final image 
# small and fast. We connect these steps using "&&" so that 
# if any part fails, the whole build stops immediately to prevent 
# a broken container. Within this step, we also grab essential 
# tools—like "vim"or others so we have a 
# quick way to easily read or edit files once the container is running.
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    
    neovim \
    vim \
    zsh \
    bash-completion \
    \
  
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    man-db \
    manpages \
    manpages-posix \
    \

    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \

    shellcheck \
    \

    nmap \
    masscan \
    \

    tcpdump \
    tshark \
    \

    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \

    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    httpie \
    \
# sed -i directly edits /etc/locale.gen, removing the comment
# symbol "#" from the es_ES.UTF-8 line to activate it.
# locale-gen then reads that file and builds the language data
# the system needs to show Spanish characters correctly.
#
# What I understand: the locale.gen file has many languages disabled
# by default. We uncomment the Spanish one and then run locale-gen so
# the system actually builds it and makes it ready to use.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \

# apt-get clean removes downloaded package files and rm -rf deletes
# the package list cache. Both run inside this same RUN so the cleanup
# is part of the same layer. A separate RUN would not help because the
# files would still exist in the previous layer and waste space

# What I understand: Docker takes a permanent snapshot at the end of
# every step. If we clean up in a separate step, the previous snapshot
# already saved the junk files forever. Doing install and cleanup in
# the same step means the snapshot Docker takes is already clean,
# keeping the final image as small as possible.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# SHELL changes the interpreter Docker uses for all RUN instructions
# that follow. The default is /bin/sh, a minimal POSIX shell.
# Switching to bash or zsh makes later RUN steps run under the same shell
# configured for the user.
#
# What I understand: we replace the default minimal shell with bash or zsh 
# so the instructions that come after this run in the same environment
# the user will actually work in.
SHELL ["/bin/zsh", "-c"]


# WORKDIR sets the working directory for all instructions that follow
# and for the terminal when the container starts. Codespaces mounts
# the repository under /workspaces so terminals open right next to
# the course files.
#
# What I understand: it is like running cd once so every command after
# this starts from the right folder automatically.
WORKDIR /workspaces

# git config --system applies git settings to every repository on the
# system inside the container.
#   safe.directory *         trusts any mounted repo; without this Git
#                            refuses to work because the folder owner
#                            differs from the running user
#   init.defaultBranch main  stops Git from warning about master vs main
#   pull.rebase false        uses merge instead of rebase on git pull
#   git lfs install          registers Git LFS hooks globally so repos
#                            that track large files work out of the box
#
# What I understand: we apply global git settings once 
# at build time so every repository inside the container behaves correctly 
# without needing extra setup every time.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# chsh -s changes the login shell for the specified user.
# We set it to zsh for root so every new terminal session starts
# in zsh instead of sh or bash.

# What I understand: we permanently change the default shell for root 
#to zsh so it starts automatically on every new session instead of having 
#to switch to it manually.
RUN chsh -s /usr/bin/zsh root

# A here-document (<<) is a way to pass multiple lines of text directly
# into a command. Everything written between the two EOF markers is
# treated as input, just like a file would be.
# The ">>" appends those lines to .zshrc instead of overwriting it.
# The single quotes around 'EOF' make bash write the text literally,
# without expanding any variables inside the block.
#
# The PROMPT line sets how the terminal prompt looks:
#   %F{cyan}...%f        prints text in cyan color
#   [Luis-Villarreal🐺]  custom name shown on every prompt line
#   %1~                  shows only the current folder name
#   %(?.√.X %?)          shows a green checkmark if the last command
#                        worked, or a red X with the error code if not
#
# What I understand: instead of running echo multiple times to add lines
# to the config file, heredoc lets us write a whole block at once. The
# result is a custom prompt that shows where we are and whether the
# last command succeeded.
RUN cat >> /root/.zshrc <<'EOF'
PROMPT='%F{cyan}[Luis-Villarreal🐺]%f %F{yellow}%1~%f %(?.%F{green}√.%F{red}X %?)%f %# '
EOF

CMD ["/usr/bin/zsh"]



