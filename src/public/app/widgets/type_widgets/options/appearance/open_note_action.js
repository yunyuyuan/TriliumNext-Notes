import OptionsWidget from "../options_widget.js";
import { t } from "../../../../services/i18n.js";

const TPL = `
<div class="options-section">
    <h4>笔记操作</h4>
    
    <select class="open-note-action form-select">
        <option value="new">新页面</option>
        <option value="active">已有页面</option>
    </select>
</div>`;

export default class OpenNoteActionOptions extends OptionsWidget {
    doRender() {
        this.$widget = $(TPL);
        this.$openNoteAction = this.$widget.find(".open-note-action");
        this.$openNoteAction.on('change', () => {
            const newValue = this.$openNoteAction.val();

            this.updateOption('openNoteAction', newValue);
        });
    }

    async optionsLoaded(options) {
        this.$openNoteAction.val(options.openNoteAction);
    }
}
