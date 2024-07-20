if [ ! -f .env ]; then
    echo "Missing .env file, cannot proceed."
    exit 1
fi

output_dir="output"
rm -rf "$output_dir"
mkdir -p "$output_dir"

source ./.env

# Download everything in output/notes.example.com/share/...
share_url="$SHARE_PROTOCOL://$SHARE_HOST/share/$ROOT_NOTE_ID"
wget -rp -e robots=off "$share_url" -P "$output_dir"

# Get rid of the domain in the output folder
mv "$output_dir/$SHARE_HOST"/* "$output_dir/"
rmdir "$output_dir/$SHARE_HOST"