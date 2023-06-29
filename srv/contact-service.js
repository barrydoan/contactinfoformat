

const TextBundle = require('@sap/textbundle').TextBundle

module.exports = cds.service.impl(srv => {
    srv.on('error', async (err, req) => {
        const locale = req.user.locale
        const bundle = new TextBundle('../_i18n/i18n', locale)
        err.details.forEach(e => {
            if (e.code === 'ASSERT_FORMAT') {
                e.args = [...e.args, bundle.getText(e.element)]
            }
        })
    
    })
    
})
