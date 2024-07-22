import shaca from "../shaca";
import Shaca from "../shaca-interface";

class AbstractShacaEntity {
    get shaca(): Shaca {
        return shaca;
    }
}

export default AbstractShacaEntity;
