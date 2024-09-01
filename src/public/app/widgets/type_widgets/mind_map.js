import libraryLoader from "../../services/library_loader.js";
import TypeWidget from "./type_widget.js";

const TPL = `
<div class="note-detail-mind-map note-detail-printable">
    <div class="mind-map-container">
    </div>

    <style>
        .note-detail-mind-map {
            height: 100%;
            overflow: hidden !important;
        }

        .note-detail-mind-map .mind-map-container {
            height: 100%;
        }
    </style>
</div>
`;

export default class MindMapWidget extends TypeWidget {
    static getType() { return "mindMap"; }

    doRender() {
        this.$widget = $(TPL);
        this.$content = this.$widget.find(".mind-map-container");

        libraryLoader
            .requireLibrary(libraryLoader.MIND_ELIXIR)
            .then(() => {
                this.#onLibraryLoaded();
            });

        super.doRender();
    }

    #onLibraryLoaded() {
        const mind = new MindElixir({
            el: this.$content[0],
            direction: MindElixir.LEFT
        });
        this.mind = mind;
        mind.init(MindElixir.new());
        mind.bus.addListener("operation", (operation) => {
            this.spacedUpdate.scheduleUpdate();
        });
    }

    async getData() {
        const mind = this.mind;
        if (!mind) {
            return;
        }

        return {
            content: mind.getDataString()
        };
    }

    async entitiesReloadedEvent({loadResults}) {
        if (loadResults.isNoteReloaded(this.noteId)) {
            this.refresh();
        }
    }
}