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


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).
SHELL ["/bin/zsh", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.

RUN chsh -s /usr/bin/zsh root
RUN cat >> /root/.zshrc <<'EOF'
PROMPT='%F{cyan}[Luis-Villarreal🐺]%f %F{yellow}%1~%f %(?.%F{green}√.%F{red}X %?)%f %# '
EOF
CMD ["/usr/bin/zsh"]



