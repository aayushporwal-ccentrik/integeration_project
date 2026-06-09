const cds = require('@sap/cds');
 
// 🚀 Pure native express middleware setup without requiring external dependencies
cds.on('bootstrap', (app) => {
    app.use((req, res, next) => {
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
        res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With');
        // Handle Preflight Request immediately
        if (req.method === 'OPTIONS') {
            return res.sendStatus(200);
        }
        next();
    });
});
 
module.exports = cds.server;