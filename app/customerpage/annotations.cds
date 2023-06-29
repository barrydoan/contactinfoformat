using ContactService as service from '../../srv/contact-service';

annotate service.Customers with @(
    UI.Facets              : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Customer',
        ID    : 'Customer',
        Target: '@UI.FieldGroup#Customer',
    }, ],
    UI.FieldGroup #Customer: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: firstName,
                Label : '{i18n>firstname}',
            },
            {
                $Type: 'UI.DataField',
                Value: lastName,
                Label : '{i18n>lastname}',
            },
            {
                $Type: 'UI.DataField',
                Value: telephone,
                Label : '{i18n>telephone}',
            },
            {
                $Type: 'UI.DataField',
                Value: email,
                Label : '{i18n>email}',
            },
            {
                $Type: 'UI.DataField',
                Value: visibleContactDetail,
                Label: '{i18n>visiblecontactdetail}',
            },
        ],
    }
);

annotate service.Customers with @(UI.LineItem: [
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
