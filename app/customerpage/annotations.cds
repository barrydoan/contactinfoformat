using from '../../srv/contact-service';
using from '../../db/schema';

annotate ContactService.Customers with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: firstName,
        Label: '{i18n>firstname}',
    },
    {
        $Type: 'UI.DataField',
        Value: lastName,
        Label: '{i18n>lastname}',
    },
    {
        $Type     : 'UI.DataField',
        Value     : telephone,
        Label     : '{i18n>telephone}',
        @UI.Hidden: {$edmJson: {$Eq: [
            {$Path: 'visibleContactDetail'},
            false
        ]}}
    },
    {
        $Type     : 'UI.DataField',
        Value     : email,
        Label     : '{i18n>email}',
        @UI.Hidden: {$edmJson: {$Eq: [
            {$Path: 'visibleContactDetail'},
            false
        ]}}
    },
    {
        $Type: 'UI.DataField',
        Value: visibleContactDetail,
        Label: '{i18n>visiblecontactdetail}',
    },
    {
        $Type: 'UI.DataField',
        Value: comment,
        Label: '{i18n>comment}',
    },
]);

annotate ContactService.Customers with @(
    UI.Facets               : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Customer',
        ID    : 'Customer',
        Target: '@UI.FieldGroup#Customer1',
    }, ],
    UI.FieldGroup #Customer1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: firstName,
                Label: '{i18n>firstname}',
            },
            {
                $Type: 'UI.DataField',
                Value: lastName,
                Label: '{i18n>lastname}',
            },
            {
                $Type     : 'UI.DataField',
                Value     : telephone,
                Label     : '{i18n>telephone}',
                @UI.Hidden: {$edmJson: {$Eq: [
                    {$Path: 'visibleContactDetail'},
                    false
                ]}}
            },
            {
                $Type     : 'UI.DataField',
                Value     : email,
                Label     : '{i18n>email}',
                @UI.Hidden: {$edmJson: {$Eq: [
                    {$Path: 'visibleContactDetail'},
                    false
                ]}}
            },
            {
                $Type: 'UI.DataField',
                Value: visibleContactDetail,
                Label: '{i18n>visiblecontactdetail}',
            },
            {
                $Type: 'UI.DataField',
                Value: comment,
                Label: 'comment',
            },
        ],
    }
);
