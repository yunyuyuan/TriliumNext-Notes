if [ ! -f .env ]; then
    echo "Missing .env file, cannot proceed."
    exit 1
fi

output_dir="output"
rm -rf "$output_dir"
mkdir -p "$output_dir"

source ./.env
wget -rp -e robots=off "$SHARE_URL" -P "$output_dir"