import Shaca from "../shaca-interface";

let shaca: Shaca;

class AbstractShacaEntity {
    get shaca(): Shaca {
        return shaca;
    }
}

export default AbstractShacaEntity;
