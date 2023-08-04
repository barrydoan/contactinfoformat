

const TextBundle = require('@sap/textbundle').TextBundle

module.exports = cds.service.impl(srv => {
    
    srv.on('error', async (err, req) => {
        console.log('err', err)
        const locale = req.user.locale
        const bundle = new TextBundle('../_i18n/i18n', locale)
        if (err.details) {
            // multiple error
            err.details.forEach(e => {
                if (e.code === 'ASSERT_FORMAT') {
                    console.log('element', e.element)
                    e.args = [...e.args, bundle.getText(e.element)]
                }
            })
        }
        else {
            // single error
            if (err.code === 'ASSERT_FORMAT') {
                err.args = [...err.args, bundle.getText(err.element)]
            }
        }
    
    })

    srv.on('READ', 'Users', async (req) => {

        const result = []
        const userApi = await cds.connect.to("jsonplaceholder");
        var users = await userApi.tx(req).get('/users')
        users.forEach((element, index) => {
            const user = {}
            user['username'] = element['username']
            user['name'] = element['name']
            user['email'] = element['email']
            user['phone'] = element['phone']
            user['website'] = element['website']
            result.push(user)
        })
        return result
        
    })
    
    
})
