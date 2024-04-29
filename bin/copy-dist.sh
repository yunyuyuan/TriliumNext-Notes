DEST_DIR="./dist"
DEST_DIR_SRC="$DEST_DIR/src"

for d in 'images' 'libraries' 'db' 'node_modules' ; do
    echo "Copying $d"
    cp -r "$d" "$DEST_DIR"/
done

for d in './src/public' './src/views' ; do
    echo "Copying $d"
    cp -r "$d" "$DEST_DIR_SRC"/
done