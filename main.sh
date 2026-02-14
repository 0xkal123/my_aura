#!/bin/bash

# ---------------
# 🔹 INPUT VALIDATION
# ---------------
if [ $# -ne 1 ]; then
    echo "Usage: $0 <company_name>"
    exit 1
fi

COMPANY="$1"
BASE_DIR="/root/Desktop/scripts"

# ---------------
# 🔹 SCRIPT LIST
# ---------------
scripts=(
    "$BASE_DIR/data/subdomains/active-passive_dns-rec_subs.sh"
    "$BASE_DIR/data/subs_with_ports/subs_with_ports.sh"
    "$BASE_DIR/data/httpx_subdomains/httpx_subs.sh"
    "$BASE_DIR/data/ips/ips.sh"
    "$BASE_DIR/data/ips_with_ports/ips_with_ports.sh"
    "$BASE_DIR/data/httpx_ips/httpx_ips.sh"
    "$BASE_DIR/data/archive_data_subs/archive_data_subs.sh"
    "$BASE_DIR/data/archive_data_ips/archive_data_ips.sh"
    "$BASE_DIR/data/archive_filtered_subs/archive_filtered_subs.sh"
    "$BASE_DIR/data/archive_filtered_ips/archive_filtered_ips.sh"
    "$BASE_DIR/js_enum/js_enum.sh"
    "$BASE_DIR/origin_ips/origin_ips.sh"
    "$BASE_DIR/injection_vulns/injection_vulns.sh"
)

# ---------------
# 🔹 RUN SCRIPT FUNCTION
# ---------------
run_script() {
    local script_path="$1"
    local script_name=$(basename "$script_path")

    echo -e "\n[▶] Running $script_name ..."
    bash "$script_path" "$COMPANY"
    echo "=============="
}

# ---------------
# 🔹 RUN ALL
# ---------------
for script in "${scripts[@]}"; do
    run_script "$script"
done




# resolved_subs_and_ips.sh (not in use currently due to inaccurate results by -ptr rec)
# bash $BASE_DIR/data/subdomains_ips_resolved/resolved_subs_and_ips.sh $COMPANY



#SCRIPTS MANUALLY TO BE RUN:
# 403-bypass_subs.sh
# bash $BASE_DIR/403-bypass_subs/403-bypass.sh $COMPANY
# 403-bypass_ips.sh
# bash $BASE_DIR/403-bypass_ips/403-bypass.sh $COMPANY
# fuzz.sh
# bash fuzz.sh <input file> -p <parts> <company>