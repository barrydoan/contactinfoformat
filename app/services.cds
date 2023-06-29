using from './customerpage/annotations';

annotate ContactService.Customers with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: '{i18n>firstname}',
        Value: firstName,
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>lastname}',
        Value: lastName,
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>telephone}',
        Value: telephone,
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>email}',
        Value: email,
    },
    {
        $Type: 'UI.DataField',
        Value: visibleContactDetail,
        Label: '{i18n>visiblecontactdetail}',
    },
]);
