const cds = require('@sap/cds');
 
module.exports = cds.service.impl(async function() {
    const { Invoices } = this.entities;
 
    // Forcefully handle the POST request to bypass strict column/ID conflicts
    this.on('CREATE', 'Invoices', async (req) => {
        const data = req.data;
        // CDS handles the auto-generation of ID and timestamps automatically
        return await cds.run(INSERT.into(Invoices).entries(data));
    });
});