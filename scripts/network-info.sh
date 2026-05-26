#!/bin/zsh

BOLD="\033[1m"
RESET="\033[0m"
CYAN="\033[38;5;117m"
GREEN="\033[38;5;114m"
ORANGE="\033[38;5;215m"
RED="\033[38;5;203m"
DIM="\033[2m"
YELLOW="\033[38;5;221m"

echo ""
echo "  ${BOLD}${CYAN}󰩟  Network Info${RESET}"
echo "  ${DIM}────────────────────────────────${RESET}"
echo ""

# Loopback
printf "  ${DIM}[lo]  %-18s${RESET} ${DIM}127.0.0.1${RESET}\n" "Loopback"

# Wi-Fi
WIFI=$(ipconfig getifaddr en0 2>/dev/null)
if [[ -n "$WIFI" ]]; then
  printf "  ${GREEN}${BOLD}[1]${RESET}${GREEN}   %-18s${RESET} ${GREEN}${BOLD}%s${RESET}\n" "Wi-Fi (en0)" "$WIFI"
else
  printf "  ${DIM}[1]   %-18s${RESET} ${DIM}non connecté${RESET}\n" "Wi-Fi (en0)"
fi

# VPN
VPN_IPS=()
VPN_IFACES=()
for iface in tun0 tun1 utun0 utun1 utun2 utun3 utun4 utun5; do
  IP=$(ifconfig "$iface" 2>/dev/null | awk '/inet / {print $2}')
  if [[ -n "$IP" ]]; then
    VPN_IPS+=("$IP")
    VPN_IFACES+=("$iface")
  fi
done

if [[ ${#VPN_IPS[@]} -gt 0 ]]; then
  printf "  ${ORANGE}${BOLD}[2]${RESET}${ORANGE}   %-18s${RESET} ${ORANGE}${BOLD}%s${RESET}\n" "VPN (${VPN_IFACES[1]})" "${VPN_IPS[1]}"
else
  printf "  ${DIM}[2]   %-18s${RESET} ${DIM}aucun VPN actif${RESET}\n" "VPN"
fi

echo ""
echo "  ${DIM}────────────────────────────────${RESET}"

# IP publique
printf "  ${DIM}[3]   %-18s${RESET} ${DIM}récupération...${RESET}\r" "IP Publique"
PUBLIC=$(curl -s --max-time 4 ipinfo.io/ip 2>/dev/null)
if [[ -n "$PUBLIC" ]]; then
  printf "  ${CYAN}${BOLD}[3]${RESET}${CYAN}   %-18s${RESET} ${CYAN}${BOLD}%s${RESET}\n" "IP Publique" "$PUBLIC"
else
  printf "  ${RED}[3]   %-18s${RESET} ${RED}timeout${RESET}\n" "IP Publique"
fi

echo ""
echo "  ${DIM}────────────────────────────────${RESET}"
echo "  ${DIM}[1/2/3] copier  •  [q] fermer${RESET}"
echo ""

read -k1 key
case "$key" in
  1) [[ -n "$WIFI" ]] && echo -n "$WIFI" | pbcopy && echo "  ${GREEN}✓ Copié : $WIFI${RESET}" ;;
  2) [[ ${#VPN_IPS[@]} -gt 0 ]] && echo -n "${VPN_IPS[1]}" | pbcopy && echo "  ${ORANGE}✓ Copié : ${VPN_IPS[1]}${RESET}" ;;
  3) [[ -n "$PUBLIC" ]] && echo -n "$PUBLIC" | pbcopy && echo "  ${CYAN}✓ Copié : $PUBLIC${RESET}" ;;
  *) ;;
esac

sleep 0.6
