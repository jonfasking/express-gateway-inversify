"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const path_1 = require("path");
const gateway = require('express-gateway');
gateway()
    .load(path_1.join(__dirname, 'config'))
    .run();
//# sourceMappingURL=index.js.map