DEST_DIR="./dist"
DEST_DIR_SRC="$DEST_DIR/src"
DEST_DIR_NODE_MODULES="$DEST_DIR/node_modules"

for d in 'images' 'libraries' 'db'  ; do
    echo "Copying $d"
    cp -r "$d" "$DEST_DIR"/
done

for d in './src/public' './src/views' ; do
    echo "Copying $d"
    cp -r "$d" "$DEST_DIR_SRC"/
done

mkdir "$DEST_DIR_NODE_MODULES"

cd node_modules

for m in 'react/umd/react.production.min.js' 'react/umd/react.development.js' 'react-dom/umd/react-dom.production.min.js' 'react-dom/umd/react-dom.development.js' 'katex/dist/katex.min.js' 'katex/dist/contrib/mhchem.min.js' 'katex/dist/contrib/auto-render.min.js'; do
    echo "Copying $m"
    cp --parents "$m" ../"$DEST_DIR_NODE_MODULES"
done

for m in '@excalidraw/excalidraw/dist/' 'katex/dist/' 'dayjs/' 'force-graph/dist/' 'boxicons/css/' 'boxicons/fonts/' 'mermaid/dist/' 'jquery/dist/' 'jquery-hotkeys/' 'print-this/' 'split.js/dist/' 'panzoom/dist/' ; do
    echo "Copying $m"
    cp --parents -r "$m" ../"$DEST_DIR_NODE_MODULES"
done
