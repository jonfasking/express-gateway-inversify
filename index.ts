import { join } from 'path';
const gateway = require('express-gateway');

gateway()
    .load(join(__dirname, 'config'))
    .run();
